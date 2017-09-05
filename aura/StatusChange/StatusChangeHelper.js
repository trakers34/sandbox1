/**
 * Created by guillaume.rebmann on 2/6/17.
 */
({
	init : function(component,helper) {
		var action = component.get("c.getObject");
    	action.setParams({
            objectId : component.get("v.objectId")
        });
        console.log('Init - helper');
        var that = this;
        $A.enqueueAction(action);

        return new Promise(function(resolve, reject){
             action.setCallback(that, function(response) {
                      var state = response.getState();
                      if (state === "SUCCESS") {
                          var obj = action.getReturnValue();
                             component.set("v.currentStatus",(obj.MH_Status__c==''|| obj.MH_Status__c == undefined)?'In Review':obj.MH_Status__c);
                             component.set("v.obj",obj);

                        resolve(that.getMessages(component,obj));
                      } else {
                        reject(response.getError());
                      }
               });



        });

	},
	changeStatus : function(component, event, helper) {


       console.log('ChangeStatus - Helper');
       component.set('v.loading',true);

      var action = component.get("c.updateStatus");
      console.log(component.get('v.obj'));
      console.log(event.target.getAttribute('data-status'));

          action.setParams({
              currentObject : component.get('v.obj'),
              objectStatus : event.target.getAttribute('data-status')
          });

          $A.enqueueAction(action);


          var that = this;
          return new Promise(function(resolve, reject){
             action.setCallback(that, function(response) {
                   var state = response.getState();
                   var obj = action.getReturnValue();
                      if (state === "SUCCESS") {
                        resolve(helper.init(component,that));
                      } else {
                        reject(response.getError());
                      }
               });



           });

          //


  },
  getMessages: function(component,obj){

    console.log('getMessages - helper');
    var action = component.get("c.validateObject");
        action.setParams({
            obj : component.get("v.obj")
        });

    $A.enqueueAction(action);
    var that = this;

    return new Promise(function(resolve, reject){

         action.setCallback(that, function(response) {
                var state = response.getState();
                var res   = action.getReturnValue();

                  if(state === "SUCCESS") {
                      component.set('v.messages',res);
                      resolve(res);
                  } else {
                      reject(response.getError());
                  }
          });


    });


  }
})