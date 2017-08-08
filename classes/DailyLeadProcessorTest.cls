@isTest
private class DailyLeadProcessorTest {
	
    public static testmethod void testmethod1(){
        List<Lead> listOfLead = new List<Lead>();
        for(Integer i = 0; i< 200; i++){
            listOfLead.add(new Lead(LastName=String.valueOf(i),Company='Comp'+i));
        }
        insert listOfLead;
        String CRON_EXP = '0 0 0 * * ? ';
        Test.startTest();
         System.schedule('Schedule DailyLead Processor',CRON_EXP,new DailyLeadProcessor());
        Test.stopTest();
        
        System.assertEquals(200, [SELECT Id,LeadSource FROM Lead where LeadSource <> null].size());
    }
}