@isTest
private class ParkLocatorTest {
    public static testmethod void testmethod1(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> result = ParkLocator.country('Germany');
        System.assertEquals(3, result.size());
    }
}