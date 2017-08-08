global virtual with sharing class application1_dataController {
    
      global static applicationOneClass current;
    
      @RemoteAction  
      global static resultClass loadAlgo1() {
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_1();
          
          return result;
    
      }  
    
      @RemoteAction  
      global static resultClass loadAlgo2() {
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_2();
          
          return result;
    
      }  
    
      @RemoteAction
      global static resultClass loadAlgo3(){
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_3();
          
          return result;
      }
    
      @RemoteAction
      global static resultClass loadAlgo5(){
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_5();
          
          return result;
      }
      
      @RemoteAction
      global static resultClass loadAlgo6(){
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_6();
          
          return result;
      }
    @RemoteAction
      global static resultClass loadAlgo7(){
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_7();
          
          return result;
      }
    @RemoteAction
      global static resultClass loadAlgo8(){
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_8();
          
          return result;
      }
    @RemoteAction
      global static resultClass loadAlgo9(){
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_9();
          
          return result;
      }
    @RemoteAction
      global static resultClass loadAlgo10(){
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_10();
          
          return result;
      }
      
    @RemoteAction
      global static resultClass loadAlgo11(){
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_11();
          
          return result;
      }
    
    @RemoteAction
      global static resultClass loadAlgo12(){
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_12();
          
          return result;
      }
    
    @RemoteAction
      global static resultClass loadAlgo13(){
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_13();
          
          return result;
      }
    
    @RemoteAction
      global static resultClass loadAlgo14(){
          
          current = applicationOneClass.getObject();
          resultClass result = current.algo_14();
          
          return result;
      }

}