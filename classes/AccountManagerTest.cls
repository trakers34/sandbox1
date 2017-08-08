@isTest
private class AccountManagerTest {
	
    public static testmethod void testMethod1(){
        Account acc = new Account(Name='testAccount');
        insert acc;
        List<Contact> temp = RandomContactFactory.generateRandomContacts(5,'guigui',acc);
        insert temp;
        RestRequest request = new RestRequest();
        request.requestUri = System.URL.getSalesforceBaseUrl()+'/services/apexrest/Accounts/'+acc.Id+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account result = AccountManager.getAccount();
        System.assert(result != null);
        System.assertEquals('testAccount',result.Name);

    }
}