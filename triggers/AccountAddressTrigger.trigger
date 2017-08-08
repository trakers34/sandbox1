trigger AccountAddressTrigger on Account (before insert, before update) {
	
        //check contacts prior to insert or update for invalid data
        if(Trigger.isInsert  || Trigger.isUpdate){
            for (Account acc : Trigger.New) {
                if(acc.BillingPostalCode <> null && acc.Match_Billing_Address__c){
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                }
            }
        }
	

}