(
    {
        handleInit : function(component,event,helper) {
            helper.getPayments(component,helper);
        },
        nextPayment : function(component,event,helper){
            helper.nextPayment(component,helper);
        },
        nextPaymentPosition : function(component,event,helper) {
            helper.processPaymentPosition(component,helper);
        },
        startAutoRun : function(component,event,helper) {
            component.set('v.autorun',true);
            helper.doNext(component,helper);
        },
        stopAutoRun : function(component,event,helper) {
            component.set('v.autorun',false);
        },
        doNext : function(component,event,helper) {
            helper.doNext(component,helper,true);
        }
     }
)