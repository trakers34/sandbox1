@isTest
private class TestVerifyDate {

    static testMethod void testMethod_1() {
        Date result = VerifyDate.CheckDates(Date.newInstance(2016, 3, 1),Date.newInstance(2016, 3, 10));
        system.assertEquals(Date.newInstance(2016, 3, 10),result);
    }
    
    static testMethod void testMethod_2() {
        Date result = VerifyDate.CheckDates(Date.newInstance(2016, 3, 1),Date.newInstance(2016, 4, 10));
        system.assertEquals(Date.newInstance(2016, 3, 31),result);
    }
}