@isTest
global class AnimalLocatorTest {
	
    static testmethod void testMethod1(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        System.assertEquals('test',AnimalLocator.getAnimalNameById(0));
    }
    
}