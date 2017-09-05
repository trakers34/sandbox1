/**
 * Created by guillaume.rebmann on 3/8/17.
 */
({
    handleInformation:function(component){
        var action = component.get('c.getInformations');
            action.setParams({
               objectId :   component.get('v.Id'),
               objectType:  component.get('v.Type')
            });


        var that = this;
        return new Promise(function(resolve, reject){
            action.setCallback(that, function(response) {

                var state = response.getState();
                var res   = action.getReturnValue();
                 if(state === "SUCCESS") {
                    resolve(res);
                 }else{
                    reject(res);
                 }
            });
            $A.enqueueAction(action);
         })
    },
    mouseEvent:function(data){

    },
    fileToImage:function(image,file){
        var reader  = new FileReader();

           reader.onloadend = function () {
               image.src = reader.result;
           }

           if (file) {
               reader.readAsDataURL(file); //reads the data as a URL
           } else {
               image.src = "";
           }
    },
    loadImage:function(component){
        var action = component.get('c.getImages');
            action.setParams({
               objectId :component.get('v.Id'),
               type:component.get('v.Type'),
               platform:component.get('v.Platform')
            });

            //console.log(objectId);
            //console.log(type);
        var that = this;
        return new Promise(function(resolve, reject){
            action.setCallback(that, function(response) {

                var state = response.getState();
                var res   = action.getReturnValue();
                 if(state === "SUCCESS") {
                    resolve(res);
                 }else{
                    reject(res);
                 }
            });
            $A.enqueueAction(action);
        })

    },
    updateOrders:function(component,order){
        var action = component.get('c.updateOrders');
            action.setParams({
               order :order
            });

        var that = this;
        return new Promise(function(resolve, reject){
            action.setCallback(that, function(response) {

                var state = response.getState();
                var res   = action.getReturnValue();
                 if(state === "SUCCESS") {
                    resolve(res);
                 }else{
                    reject(res);
                 }
            });
            $A.enqueueAction(action);
        })
    }
})