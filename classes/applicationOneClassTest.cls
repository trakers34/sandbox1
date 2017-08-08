@IsTest(SeeAllData=true)
public class applicationOneClassTest {
    static testMethod void applicationOneClassTest(){
        
        
        // Perform our data preparation.
	   

        
        applicationOneClass essai = applicationOneClass.getObject();
/////////////////////////////////////////    
/// Test of the algorithm number 1   ///
///////////////////////////////////////
      /*  List<bouncedObject> objectList1 = new List<bouncedObject>{};
        List<bouncedObject> objectList2 = new List<bouncedObject>{};
        //List<sObject> ls = Test.loadData(Account.sObjectType, 'testData');   
         for(Integer i = 0; i < 100; i++){
             bouncedObject o = new bouncedObject('hello'+i);
            	o.numberNameBounced=10;
            	o.numberNameTotal=20;
           	 	objectList1.add(o);
         }
        
        for(Integer i = 0; i < 50; i++){
             bouncedObject o1 = new bouncedObject('hello'+i);
             bouncedObject o2 = new bouncedObject('hello'+i);
             o1.probability = 0.7;
             o1.stageName = 'hello'+i;
             o1.amount = 50000;
            
             o2.probability = 0.6;
             o2.stageName = 'hello'+i;
             o2.amount = 500000;
           	 	objectList2.add(o1);
            	objectList2.add(o2);
         }
        for(Integer i = 50; i < 100; i++){
             bouncedObject o1 = new bouncedObject('hello'+i);
             bouncedObject o2 = new bouncedObject('hello'+i);
             o1.probability = 0.8;
             o1.stageName = 'hello'+i;
             o1.amount = 600000;
            
             o2.probability = 0.8;
             o2.stageName = 'hello'+i;
             o2.amount = 50000000;
           	 	objectList2.add(o1);
            	objectList2.add(o2);
         }
        essai.listOfBouncedObject_query1 = objectList1;
        essai.listOfBouncedObject_query2 = objectList2;
*/
        resultClass inte1 = essai.algo_1();
        
        
/////////////////////////////////////////    
/// Test of the algorithm number 2   ///
///////////////////////////////////////


        System.debug(logginglevel.ERROR, '/////////// '+inte1);
        resultClass inte2 = essai.algo_2();
        System.debug(logginglevel.ERROR, '/////////// Total loss:'+inte2);
        
/////////////////////////////////////////    
/// Test of the algorithm number 3   ///
///////////////////////////////////////


       /* List<bouncedObject> objectList3 = new List<bouncedObject>{};
        for(Integer i = 0; i < 100; i++){
             bouncedObject o1 = new bouncedObject('hello'+i);
             bouncedObject o2 = new bouncedObject('hello'+i);
             o1.numberNameTotal=5;
             o2.numberNameTotal=5;
           	 	objectList3.add(o1);
            	objectList3.add(o2);
         }
        essai.listOfBouncedObject_query4 = objectList3;*/
        resultClass inte3 = essai.algo_3();
        
/////////////////////////////////////////    
/// Test of the algorithm number 5   ///
///////////////////////////////////////

        
     /*   List<bouncedObject> objectList5 = new List<bouncedObject>{};
            
        for(Integer i = 0; i < 5; i++){
             bouncedObject o1 = new bouncedObject('hello'+i);
             o1.AnnualRevenue=50000;
             o1.name='name: hello'+i;
           	 	objectList5.add(o1);
         }
		
		 essai.listOfBouncedObject_query1 = objectList1;
		 essai.listOfBouncedObject_query7 = objectList5;    */
         resultClass inte5 = essai.algo_5();
        
/////////////////////////////////////////    
/// Test of the algorithm number 6   ///
///////////////////////////////////////
        
       /* List<bouncedObject> objectList6 = new List<bouncedObject>{};
        List<bouncedObject> objectList7 = new List<bouncedObject>{};
             bouncedObject o1 = new bouncedObject('total');
             o1.numberNameTotal=600;
           	 objectList6.add(o1);
         
             bouncedObject o2 = new bouncedObject('total');
             o2.numberNameTotal=600;
           	 objectList7.add(o2);
        essai.listOfBouncedObject_query9 = objectList6;
        essai.listOfBouncedObject_query10 = objectList7;
*/
         resultClass inte6 = essai.algo_6();
        
        
/////////////////////////////////////////    
/// Test of the algorithm number 7   ///
///////////////////////////////////////
       	 
         resultClass inte7 = essai.algo_7();
        
/////////////////////////////////////////    
/// Test of the algorithm number 8   ///
///////////////////////////////////////
       /* List<bouncedObject> objectList8 = new List<bouncedObject>{};
          bouncedObject o3 = new bouncedObject('number8');
             o3.numberNameTotal=600;
           	 objectList8.add(o3);    
             
         essai.listOfBouncedObject_query11 = objectList8;
       */
         resultClass inte8 = essai.algo_8();

/////////////////////////////////////////    
/// Test of the algorithm number 9   ///
///////////////////////////////////////
      /*  List<bouncedObject> objectList9 = new List<bouncedObject>{};
          
            for(Integer i=0; i<50; i++){
                bouncedObject o5 = new bouncedObject('number9-'+i);
                o5.name='name-'+i;
                o5.numberNameBounced=i;
           	 	objectList9.add(o5);
            }
                 
             
         essai.listOfBouncedObject_query12 = objectList9;
*/
         resultClass inte9 = essai.algo_9();

/////////////////////////////////////////    
/// Test of the algorithm number 10   ///
///////////////////////////////////////
        
         resultClass inte10 = essai.algo_10();        
        
        
/////////////////////////////////////////    
/// Test of the algorithm number 11   ///
///////////////////////////////////////
        
         resultClass inte11 = essai.algo_11();

  
/////////////////////////////////////////    
/// Test of the algorithm number 12   ///
///////////////////////////////////////
        
         resultClass inte12 = essai.algo_12();

/////////////////////////////////////////    
/// Test of the algorithm number 13   ///
///////////////////////////////////////
        
         resultClass inte13 = essai.algo_13();


/////////////////////////////////////////    
/// Test of the algorithm number 14   ///
///////////////////////////////////////
        
         resultClass inte14 = essai.algo_14();        
        
    }
}