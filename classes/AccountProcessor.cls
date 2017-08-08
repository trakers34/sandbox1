public class AccountProcessor {
	
    @future
    public static void countContacts(List<Id> paramAccounts){
        List<Account> accounts = [select id,(select id from Contacts) FROM Account where Id in : paramAccounts];
        for(Account acc : accounts){
            acc.Number_of_Contacts__c = acc.contacts.size();
        }
        update accounts;
    }
    
}