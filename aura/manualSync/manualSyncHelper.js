/**
 * Created by guillaume.rebmann on 2/10/17.
 */
({
    init:function(component){

        component.set('v.progressData',[{'name':'Schedules','status':'active'},
                                        {'name':'Collection','status':null},
                                        {'name':'Products','status':null},
                                        {'name':'Variants','status':null},
                                        {'name':'Deallines','status':null}
                                       ]);
        component.set('v.progressStatus',0);
        component.set('v.message',null);

    },
    syncObject:function(obj,component,helper,callback){

        // If callback == null => "Initial" ELSE => "Recursivity with callback"

        console.log('syncObject call');
        var action;
        if(obj.media == true){
            action = component.get("c.sendMediaController");
        }else{
            action = component.get("c.sendAllController");
        }

            action.setParams({
                objectType      : obj.object,
                timestamp       : obj.timestamp,
                collectionId    : obj.collectionId,
                media           : obj.media
            });

        if(callback == null){
            component.set('v.current',{'name':obj.object});
        }




        var that = this;
        return new Promise(function(resolve, reject){
             var validate = callback==null?resolve:callback;
             action.setCallback(that, function(response) {
                    var state = response.getState();
                    var res   = action.getReturnValue();


                      if(state === "SUCCESS") {

                          if(obj.total == null){
                              obj.total = res;
                          }

                          if(res > 100){
                              helper.syncObject(obj,component,that,validate);
                              var total = (obj.total + 100 - res)*100/obj.total;
                              component.set('v.total',total);
                              component.set('v.totalToDisplay',Math.round(total)+'%');
                          }else{
                              console.log('Resolve');
                              component.set('v.total',100);
                              component.set('v.totalToDisplay','100%');

                              that.wait().then(function(){
                                  $A.util.addClass(component.find('containerManualSyncInfo'), 'hidden');
                                  component.set('v.total',0);
                                  component.set('v.totalToDisplay',null);
                                  return that.wait();
                              }).then(function(){
                                   $A.util.removeClass(component.find('containerManualSyncInfo'), 'hidden');
                                   validate(res);
                              })

                          }


                      } else {
                          console.log(response.getError());
                          reject(response.getError());
                      }
              });
              $A.enqueueAction(action);


        });

    },
    changeProgressValue:function(obj,name,value){
        for(var key in obj){
            if(obj[key].name == name){
                obj[key].status = value;
            }
        }
    },
    wait:function() {
        return new Promise(function (resolve, reject) {
            setTimeout(function () {
                resolve();
            }, 2000);
        });
    },toggle : function(component) {
          var target = component.find("containerManualSyncInfo");
          $A.util.toggleClass(target, "toggle");
      }
})