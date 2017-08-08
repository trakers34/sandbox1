@isTest
private class TestRestrictContactByName {
    static testMethod void testMethod1(){
        Test.startTest();
        Contact c = new Contact(LastName='InvalidName');
        Database.SaveResult result = Database.Insert(c,false);
        //Database.InsertR result = Database.Insert(acc, false);
        System.assertEquals(1, result.getErrors().size());
        Test.stopTest();

    }
}