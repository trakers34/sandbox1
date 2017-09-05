(
    {
        getPayments : function(component,helper) {
            var action = component.get('c.getPayments');


            action.setParam('paramDealId',component.get('v.id'));

            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state === "SUCCESS") {
                    component.set('v._payments',response.getReturnValue());
                    helper.setPayments(component,helper);
                }
            });

            $A.enqueueAction(action);
        },
        setPayments : function(component,helper) {
            var paymentProcessed = component.get('v._paymentProcessed') || 0;
            var payments = [];
            component.get('v._payments').forEach(function(paramPayment){
                 var payment = {
                     'name'  :   paramPayment.Name,
                     'date'  :   paramPayment.CreatedDate,
                     'store' :   paramPayment.MyStore__c?'My-Store':'DeinDeal',
                     'status':   paymentProcessed == payments.length + 1?'=>':(paymentProcessed > payments.length?'Done':'TO-DO')
                 };
                 payments.push(payment);
            });
            component.set('v.payments',payments);
            component.set('v._paymentPositionProcessed', 0);

            helper.getPaymentPositions(component,helper);
        },
        getPaymentPositions : function(component, helper) {
            var action = component.get('c.getPaymentPositions');

            action.setParam('paramPaymentId', component.get('v._payments')[component.get('v._paymentProcessed') - 1].Id);
            helper.setPaymentPositions(component,helper, false);
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (component.isValid() && state === "SUCCESS") {
                    component.set('v._paymentPositions', response.getReturnValue());
                    helper.setPaymentPositions(component,helper, true);
                }
            });

            $A.enqueueAction(action);

        },
        setPaymentPositions : function(component, helper, finished) {
            var paymentPositionProcessed = component.get('v._paymentPositionProcessed') || 0;
            var paymentPositions = [];
            component.get('v._paymentPositions').forEach(function(paramPaymentPosition){
                 var paymentPosition = {
                     'name'  :   paramPaymentPosition.Name,
                     'paidUnits'        :   paramPaymentPosition.Coupons_to_be_paid_in_this_payment_new__c,
                     'negativeUnits'    :   paramPaymentPosition.CouponsRedeemedAndRefunded__c || 0,
                     'positiveCoupons'  :   paramPaymentPosition.PositiveCoupons__c,
                     'negativeCoupons'  :   paramPaymentPosition.NegativeCoupons__c,
                     'status'           :   paymentPositionProcessed == paymentPositions.length + 1?(finished?'√':'<=>'):(paymentPositionProcessed > paymentPositions.length?'√':'-'),
                     'store' :   paramPaymentPosition.MyStore__c?'My-Store':'DeinDeal'
                 };
                 paymentPositions.push(paymentPosition);
            });
            component.set('v.paymentPositions',paymentPositions);
            if(finished) helper.doNext(component,helper);
        },
        nextPayment : function(component, helper) {
            component.set('v._paymentProcessed',component.get('v._paymentProcessed') + 1);
            helper.setPayments(component,helper);
        },

        processPaymentPosition : function(component,helper) {
            var action = component.get('c.processPaymentPosition');
            component.set('v._paymentPositionProcessed',component.get('v._paymentPositionProcessed') + 1);

            action.setParam('paramPaymentId',component.get('v._payments')[component.get('v._paymentProcessed')-1].Id);
            action.setParam('paramPaymentPositionId',component.get('v._paymentPositions')[component.get('v._paymentPositionProcessed')-1].Id);

            action.setCallback(this, function(response){
                helper.getPaymentPositions(component,helper);
            });

            $A.enqueueAction(action);

        },

        doNext : function(component, helper, manual) {
            if (component.get('v.autorun') || manual == true) {
                if (component.get('v._paymentPositionProcessed') == component.get('v._paymentPositions').length){
                    if (component.get('v._paymentProcessed') < component.get('v._payments').length) {
                        //console.log('doNext','nextPayment',component.get('v._paymentPositionProcessed') ,'==', component.get('v._paymentPositions').length,component.get('v._paymentProcessed'),'<',component.get('v._payments').length);
                        helper.nextPayment(component, helper);
                    } else {console.log('doNext','die',component.get('v._paymentPositionProcessed') ,'==', component.get('v._paymentPositions').length,component.get('v._paymentProcessed'),'>=',component.get('v._payments').length);}
                } else {
                    //console.log('doNext','processPaymentPosition',component.get('v._paymentPositionProcessed') ,'!=', component.get('v._paymentPositions').length);
                    helper.processPaymentPosition(component,helper);
                    //helper.processPaymentPosition(component,helper);
                }
            }
        }
    }
)