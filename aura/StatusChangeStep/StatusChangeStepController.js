/**
 * Created by guillaume.rebmann on 2/7/17.
 */
({
    changeStatus : function(component,event,helper){
            var eventToFire = component.getEvent("statusChanged");
                eventToFire.setParams({ "status" :component.get("v.stage.name"),'obj':component.get("v.stage.currentObject")});
                eventToFire.fire();
    }

})