/**
 * Created by guillaume.rebmann on 4/5/17.
 */
({
    getObjects:function(component){
            var action = component.get('c.getProducts');

              action.setParams({
                 collectionId:component.get('v.collectionId'),
              });

              var that = this;
              return new Promise(function(resolve, reject){
                  action.setCallback(that, function(response) {

                      var state = response.getState();
                      var res   = action.getReturnValue();

                       if(state === "SUCCESS") {
                          resolve(res);
                       }else{
                           console.log(state);
                           console.log(response);
                           reject(response.getError());
                       }
                  });
                  $A.enqueueAction(action);
              })
    }
})