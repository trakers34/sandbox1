@isTest
private class AccountProcessorTest {
	
    public static testmethod void testMethod1(){
        Account acc = new Account(Name='testAccount');
        insert acc;
        List<Contact> contacts = RandomContactFactory.generateRandomContacts(5,'guigui',acc);
        
        insert contacts;
        System.assertEquals(5,contacts.size());
        System.assertEquals(acc.Id,contacts[0].accountId);
        Test.startTest();
        AccountProcessor.countContacts(new List<Id>{acc.Id});
        Test.stopTest();
        
        System.assertEquals(5,[select Number_of_Contacts__c from Account where Id =: acc.Id].Number_of_Contacts__c);
    }
}