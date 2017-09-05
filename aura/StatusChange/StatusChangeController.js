/**
 * Created by guillaume.rebmann on 2/6/17.
 */
({
	doInit : function(component, event, helper) {
	    console.log('doInit');
        helper.init(component,helper)
        .then(function(response){
            console.log('doInit - Success');
            component.set("v.loading",false);
        },function(error){
            console.log('doInit - Error');
           console.log(error);
        })
    },
    changeStatus: function(component, event, helper) {
           console.log('Changing Status');
           helper.changeStatus(component,event,helper)
           .then(function(response){
                component.set("v.loading",false);
                //location.reload();
             },function(error){
                 console.log(error);
             }
           );


    }

})