@isTest
private class AddPrimaryContactTest {
    
    
    public static testmethod void testMethod1(){
        List<Account> listOfAccountToInsert = new List<Account>();
        
        for(Integer i = 0;i < 50; i++){
            listOfAccountToInsert.add(new Account(Name='NY'+i,BillingState='NY'));
            listOfAccountToInsert.add(new Account(Name='CA'+i,BillingState='CA'));
        }
           
        insert listOfAccountToInsert;
        Test.startTest();
        System.enqueueJob(new AddPrimaryContact(new Contact(LastName='guillaume'),'NY'));
        Test.stopTest();
        System.assertEquals(50,[SELECT Id from Contact where Account.BillingState = 'NY'].size());
        
        
    }
    
}