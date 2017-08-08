@isTest
private class LeadProcessorTest {
    
    @testSetup static void methodName() {
		List<Lead> leadToInsert = new List<Lead>();
        for(Integer i = 0; i<200;i++){
            leadToInsert.add(new Lead(LastName='name-'+i,Company='comp-'+i));
        }
        insert leadToInsert;
    }
    
    public static testmethod void testMethod1(){
        Test.startTest();
        LeadProcessor te = new LeadProcessor();
        Id batchId = Database.executeBatch(te);
        Test.stopTest();

        System.assertEquals(200,[select id from Lead where LeadSource = 'Dreamforce'].size());
    }
}