/**
 * Created by guillaumerebmann on 5/7/15.
 */

var app = {peer:null,trade:{},connected:[],userList:{}};


app.onClick = function(){
    $("body").on('click',".others .avatar img",function(){
        var object = $(this).closest(".connected");
        var id = object.find(".user-info").data('id');
        if(!app.trade[id]){

            object.find("input").click();
        }else{
            console.log(app.trade[id]);
            console.log("Sorry we can't re-open a peer connection with %d because it's already in share mode",id);
        }

    })
}
// Event when a file is selected and ready to be share
app.initInput = function(){
    var eventFile = new Event('fileSelected');
    $('body').on('fileSelected','.fileSelector',function(e,data){
        console.log(e); // Event
        console.log(data); // EventData
        app.sender(data);
    });
}

app.init = function(callback){
    app.onClick();
    $('body').on("change",'.fileSelector',function(){
        var object = $(this).closest(".connected");
        var id = object.find(".user-info").data('id');
        var file = $(this)[0].files[0];
        object.find('.fileSelector').trigger("fileSelected",{id:id,file:file});
        console.log("Id: %d fileName: %s fileSize %d",id,file.name,file.size);


    });

    $("body").on("click",".cancel",function(){
        console.log("Clicked");
        var id =$(this).data('id');
        console.log(id);
        $("#"+id).trigger("refuseFile");

    });
    $("body").on("click",".accept",function(){
        console.log("Clicked");
        var id = $(this).data('id');
        $("#"+id).trigger("acceptFile");
    });

    app.initInput();
    app.peer = new Peer($('.you').find(".user-info").data("id"), {host: 'fileportal.herokuapp.com',debug:3});
    return callback();
}

app.addUser = function(id,name){
    var content = '<div class=" peer connected" id="'+id+'"><div class="avatar"><svg class="ember-view" width="76" height="76" viewport="0 0 76 76"> <path class="break" transform="translate(38, 38)"></path> </svg> <img class="ember-view gravatar" src="https://www.gravatar.com/avatar/?d=mm&amp;s=128" alt="'+name+'" data-sending-progress="0" data-receiving-progress="0"> </div> <div class="user-info" data-id="'+id+'"> <div class="user-ip"> <div class="user-connection-status disconnected"></div>'+name+'</div> </div> <input class="fileSelector ember-text-field invisible" type="file"> </div>';
    $(".others").append(content);
}

app.removeUser = function(id){
    if(app.trade[id])
         delete app.trade[id];

    var index = app.connected.indexOf(id);
    app.connected.splice(index, 1);

    $("#"+id).remove();

}

app.addCurrentUser = function(id,name,callback){
    var content = '<div class="ember-view peer"> <div class="avatar"> <img class="gravatar" src="https://www.gravatar.com/avatar/?d=mm&amp;s=128" alt="'+name+'"/> </div> <div class="user-info" data-id="'+id+'"> <div class="user-label">You</div> <div class="user-ip"> <strong>'+name+'</strong> </div> </div> </div>';
    $(".you").html(content);
    return callback();
}


// Sender
app.sender = function(data){
    var peer = app.peer;
    var id = data.id;
    var conn = peer.connect(id);
    var file = data.file; // File information
    app.trade[id] = true;

    _close = function(){
        delete app.trade[id];
        conn.send({action:"close",type:"sender"});
        conn.close();
    }
    _init = function(name,size){
        console.log("SEND: INIT");
        conn.send({action:"init",data:{name:name,size:size},type:"sender"});
    }
    _accept = function(e){
        if(e == "yes"){
            console.log("SEND: fileSending");
            conn.send({message:"sent the file",action:"fileSending",data:file,type:"sender"});
        }else{
            console.log("SEND: NOTHING because not accepted");
            _close();
        }


    }


    conn.on('open', function() {
        // Receive messages
        conn.on('data', function(data) {
            if(data.action == "accept"){
                console.log("RECEIVED: accept");
                _accept(data.message);
            }else if(data.action == "receivedFile"){
                console.log("RECEIVED: receivedFile");
                _close();
            }else if(data.action == "close"){
                console.log("RECEIVED: close")
                _close();
            }
        });

        // Send message
        _init(file.name,file.size);

    });

}

app.receiver = function(conn){
    var peer = app.peer;
    var conn = conn;
    var id = conn.peer;
    var fileName = null;
    var fileSize = null;
    app.trade[id] = null;
    var eventAccept = new Event("acceptFile");
    var eventRefuse = new Event("refuseFile");
    // Listening to the AcceptEvent
    $('#'+id).on('acceptFile',function(){
        console.log("ACCEPT");
        $("#"+id).popover("destroy");
        console.log("SEND: yes")
        conn.send({message:"yes",action:"accept",type:"receiver"})
        $('#'+id).off();
    })
    // Listening to the RefuseEvent
    $('#'+id).on('refuseFile',function(){
        console.log("CANCEL")
        $("#"+id).popover("destroy");
        console.log("SEND: no")
        conn.send({message:"no",action:"accept",type:"receiver"})
        $('#'+id).off();
    })

    _close = function(){
      conn.close();
    }

    _accept = function(){
        var obj = $("#"+id).popover({
            title:"File Transfert",
            placement:"top",
            html:true,
            content:"Do you accept the connection ?</br> <button type='button' class='button cancel' data-id='"+id+"' >No</button><button type='button' class='button accept' data-id='"+id+"'>Yes</button>"
        });

        obj.popover("show");
    }

    _computeFile = function(file){
        // Do all the stuff for the file
        console.log("SEND: file received")

        var dataView = new Uint8Array(file);
        var dataBlob = new Blob([dataView]);
        console.log(file.name);
        console.log(dataBlob);
        saveAs(dataBlob, fileName);
        conn.send({action:"receivedFile",type:"receiver"});
    }

    conn.on('open', function() {
        // Receive messages
        conn.on('data', function(data) {
            if(data.action == "init"){
                console.log("RECEIVED: init");
                fileName = data.data.name;
                fileSize = data.data.size;
                    _accept();
            }else if(data.action == "fileSending"){
                console.log("RECEIVED: fileSending");
                _computeFile(data.data);
            }else if(data.action == "close"){
                console.log("RECEIVED: close");
                _close();
            }
        });

    });
}

app.connection = function(){
    var peer = app.peer;
    peer.on('connection', function(conn) {
        console.log("CONNECTION: new");
        app.checkUsers([conn.peer]);
        app.receiver(conn);


    });

    peer.on('error', function(err) {
        peer.destroy();
        // Reset all the connections
        app.peer = new Peer($('.you').find(".user-info").data("id"), {host: 'fileportal.herokuapp.com',debug:3});
        app.connection();
    });
}

app.checkUsers = function(userList){
    var current = $('.you').find(".user-info").data("id");
        for(var i=0; i<userList.length; i++){
            var obj = userList[i];
            if(app.connected.indexOf(obj) > -1 || obj == current){
                // Already in
            }else{
                app.connected.push(obj);
                if(app.userList[obj]){
                    app.addUser(obj,app.userList[obj]);
                }else{
                    app.addUser(obj,"External User :"+obj);
                }
                
            }
        }

    // Second checking for deletion
    var idToRemove = [];
    $(".others .connected").each(function(){
        var id = $(this).attr("id");
       // console.log(id);
        if(userList.indexOf(id) <= -1 ){
            idToRemove.push(id);
        }

    });

    for (var i = 0; i < idToRemove.length; i++) {
        app.removeUser(idToRemove[i]);
    };
}
