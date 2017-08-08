public with sharing class applicationOneClass {
    
   
    // List of query result
	public List<AggregateResult> result;
    public List<AggregateResult> query1;
    public List<Opportunity> query2;
    public List<Opportunity> query2B;
    public List<Opportunity> query2C;
    public List<AggregateResult> query4;
    public List<AggregateResult> query6;
    public List<Opportunity> query5;
    public List<Account> query7;
    public List<AggregateResult> query9;
    public List<AggregateResult> query10;
    public List<AggregateResult> query11;
    public List<AggregateResult> query12;
    public List<AggregateResult> query13;
    public List<AggregateResult> query15;
    public List<AggregateResult> query16;
     public List<AggregateResult> query17;
    // List of bouncedObject
    public List<bouncedObject> listOfBouncedObject_query1;
    public List<bouncedObject> listOfBouncedObject_query2;
    public List<bouncedObject> listOfBouncedObject_query2B;
    public List<bouncedObject> listOfBouncedObject_query2C;
    public List<bouncedObject> listOfBouncedObject_query4;
    public List<bouncedObject> listOfBouncedObject_query6;
    public List<bouncedObject> listOfBouncedObject_query5;
    public List<bouncedObject> listOfBouncedObject_query7;
    public List<bouncedObject> listOfBouncedObject_query9;
    public List<bouncedObject> listOfBouncedObject_query10;
    public List<bouncedObject> listOfBouncedObject_query11;
    public List<bouncedObject> listOfBouncedObject_query12;
    public List<bouncedObject> listOfBouncedObject_query13;
    public List<bouncedObject> listOfBouncedObject_query15;
    public List<bouncedObject> listOfBouncedObject_query16;
    public List<bouncedObject> listOfBouncedObject_query17;
    
    // Main method
	private applicationOneClass(){
        this.preloadingQuery();
    }
    
    private static applicationOneClass obj;
    
    public static applicationOneClass GetObject() // instead of creating new operator, declare a method and that will create object and return it.
    {
        if (obj == null) 
        {
            obj = new applicationOneClass();
        }
        return obj;
    }
    
    // Method to preload the query to decrease the number of SOQL request
    private void preloadingQuery(){
        //Load list
        query1 = query1();
        query2 = query2();
        query2B = query2B();
        query2C = query2C();
        query4 = query4();
        query6 = query6();
        query5 = query5();
        query7 = query7();
        query9 = query9();
        query10 = query10();
        query11 = query11();
        query12 = query12();
        query13 = query13();
        query15 = query15();
        query16 = query16();
        query17 = query17();
/*      // Transform list to List of BouncedObject
        listOfBouncedObject_query1 = loadObject('query1');
        listOfBouncedObject_query2 = loadObject('query2');
        listOfBouncedObject_query2B = loadObject('query2B');
        listOfBouncedObject_query2C = loadObject('query2C');
        listOfBouncedObject_query4 = loadObject('query4');
        listOfBouncedObject_query6 = loadObject('query6');
        listOfBouncedObject_query5 = loadObject('query5');
        listOfBouncedObject_query7 = loadObject('query7');
        listOfBouncedObject_query9 = loadObject('query9');
        listOfBouncedObject_query10 = loadObject('query10');
        listOfBouncedObject_query11 = loadObject('query11');
        listOfBouncedObject_query12 = loadObject('query12');
        listOfBouncedObject_query13 = loadObject('query13');
        listOfBouncedObject_query15 = loadObject('query15');
        listOfBouncedObject_query16 = loadObject('query16');
        listOfBouncedObject_query17 = loadObject('query17');
*/
    }
    // For query_1 => list of bouncedObject
    private List<bouncedObject> loadObject(String option){
        List<bouncedObject> objectList = new List<bouncedObject>{};
        
            if(option == 'query1'){
                for(AggregateResult r : query1){
                    bouncedObject o = new bouncedObject((String)r.get('AccountId'));
                    o.numberNameBounced=(Integer)r.get('totalBounced');
                    o.numberNameTotal=(Integer)r.get('total');                    objectList.add(o);
                }
                
            }else if(option == 'query2'){
                for(Opportunity r : query2){
                    bouncedObject o = new bouncedObject((String)r.get('AccountId'));
                    o.probability=(Decimal)r.get('probability')/100;
                    o.amount=(Double)r.get('Amount');
                    o.stageName=(String)r.get('stageName');
                    objectList.add(o);
                }
            }else if(option == 'query2B'){
                for(Opportunity r : query2B){
                    bouncedObject o = new bouncedObject((String)r.get('AccountId'));
                    o.probability=(Decimal)r.get('probability')/100;
                    o.amount=(Double)r.get('Amount');
                    o.stageName=(String)r.get('stageName');
                    objectList.add(o);
                }
            }else if(option == 'query2C'){
                for(Opportunity r : query2C){
                    bouncedObject o = new bouncedObject((String)r.get('AccountId'));
                    o.probability=(Decimal)r.get('probability')/100;
                    o.amount=(Double)r.get('Amount');
                    o.stageName=(String)r.get('stageName');
                    objectList.add(o);
                }
            }else if(option == 'query4'){
                for(AggregateResult r : query4){
                    bouncedObject o = new bouncedObject((String)r.get('AccountId'));
                    o.numberNameTotal=(Integer)r.get('total');
                    objectList.add(o);
                }
            }else if(option == 'query6'){
                for(AggregateResult r : query6){
                    bouncedObject o = new bouncedObject((String)r.get('AccountId'));
                    o.numberNameTotal=(Integer)r.get('total');
                    objectList.add(o);
                }
            }else if(option == 'query5'){
                //System.debug(logginglevel.ERROR, '/////////// size:'+listOfOpenOpportunityLatence.size());
                for(Opportunity r : query5){
                    bouncedObject o = new bouncedObject((String)r.get('AccountId'));
                    o.probability=(Decimal)r.get('probability')/100;
                    o.amount=(Double)r.get('Amout');
                    o.stageName=(String)r.get('stageName');
                    objectList.add(o);
                }
            }else if(option =='query7'){
                 for(Account r : query7){
                    bouncedObject o = new bouncedObject((String)r.get('Id'));
                    o.name=(String)r.get('name');
                    objectList.add(o);
                }
				
            }else if(option =='query9'){
                 for(AggregateResult r : query9){
                    bouncedObject o = new bouncedObject('total');
                    o.numberNameTotal=(Integer)r.get('total');
                    objectList.add(o);
                }
				
            }else if(option =='query10'){
                 for(AggregateResult r : query10){
                    bouncedObject o = new bouncedObject('total');
                    o.numberNameTotal=(Integer)r.get('total');
                    objectList.add(o);
                }
				
            }else if(option =='query11'){
                 for(AggregateResult r : query11){
                    bouncedObject o = new bouncedObject('total');
                    o.numberNameBounced=(Integer)r.get('total');
                    o.LeadSource=(String)r.get('LeadSource');
                    objectList.add(o);
                }
				
            }else if(option =='query12'){
                 for(AggregateResult r : query12){
                    bouncedObject o = new bouncedObject('total');
                    o.numberNameBounced=(Integer)r.get('total');
                    o.name=(String)r.get('Title');
                    objectList.add(o);
                }
				
            }else if(option =='query13'){
                 for(AggregateResult r : query13){
                    bouncedObject o = new bouncedObject('total');
                    o.numberNameBounced=(Integer)r.get('total');
                    o.mailingState=(String)r.get('MailingState');
                    objectList.add(o);
                }
				
            }else if(option == 'query15'){
                for(AggregateResult r : query15){
                    bouncedObject o = new bouncedObject((String)r.get('AccountId'));
                    o.numberNameTotal = (Integer)r.get('totalName');
                    o.numberNameBounced = (Integer)r.get('totalBounce');
                    objectList.add(o);
                }
            }else if(option == 'query16'){
                for(AggregateResult r : query16){
                    bouncedObject o = new bouncedObject('total');
                    o.numberNameTotal = (Integer)r.get('totalName');
                    objectList.add(o);
                }
            }else if(option == 'query17'){
                for(AggregateResult r : query17){
                    bouncedObject o = new bouncedObject('Amount');
                    if((Double)r.get('total') == null){
                        o.amount = 0;
                    }else{
                        o.amount = (Double)r.get('total');
                    }

                    objectList.add(o);
                }
            }
        
        
        return objectList;
        
    }
    
/////////////////////////////////////////    
/// Method of the algorithm number 1 ///
///////////////////////////////////////  
	public resultClass algo_1() {
          List<bouncedObject> o = loadObject('query1');
      
          Double finalTotal = 0;
          Double totalEmail = 0; 
        
          for(bouncedObject r : o){
              finalTotal += r.numberNameBounced;
          }
         List<AggregateResult> total = [SELECT COUNT(Email) total FROM Contact];
         totalEmail = (Integer)total[0].get('total');
        
        resultClass result = new resultClass();
        Map<String, Decimal> resultMap = new Map<String,Decimal>();
        resultMap.put('total',finalTotal);
        if(totalEmail != 0){
            resultMap.put('percentage',(finalTotal/totalEmail)*100);
        }else{
            resultMap.put('percentage',0);
        }
        result.var_decimal.add(resultMap);
       
        
        
        
        return result;
     }  
    
/////////////////////////////////////////    
/// Method of the algorithm number 2 ///
///////////////////////////////////////
    public resultClass algo_2(){
        List<bouncedObject> o1 = loadObject('query1');
        List<bouncedObject> o2 = loadObject('query2');
        	
        Double finalTotal = 0;
        Map<String, bouncedObject> currentMap = new Map<String, bouncedObject>();
        
        // Match accountId with bouncedObject
        for(bouncedObject r : o1){	
            currentMap.put(r.accountId,r);
        }
        // Check the query2
        for(bouncedObject r : o2){	
            if(currentMap.containsKey(r.accountId)){
                bouncedObject current = currentMap.get(r.accountId);
                current.amount = current.amount + (r.amount*r.probability);   
            }
        }
        
        Set<String> key = currentMap.keySet();
        
        // Calcul the Total
        for(String s : key){
            bouncedObject k = currentMap.get(s);
            Double s1 = k.numberNameBounced;
            Double s2 = k.numberNameTotal;
            if(s2 != 0){
                finalTotal= finalTotal + (s1/s2)*k.amount;
            }
            
        }
        // Total Email (Bounced + Not Bounced)
       // List<AggregateResult> total = [SELECT COUNT(Email) total FROM Contact];
       // Integer totalEmail = (Integer)total[0].get('total');
        
        resultClass result = new resultClass();
        Map<String, Decimal> resultMap = new Map<String,Decimal>();
        resultMap.put('total',finalTotal);
        result.var_decimal.add(resultMap);
       // result.var_decimal.put('percentage',finalTotal/totalEmail);
        
        return result;
    }
    
    
/////////////////////////////////////////    
/// Method of the algorithm number 3 ///
///////////////////////////////////////
    public resultClass algo_3(){
        List<bouncedObject> o = loadObject('query4');
        Double finalTotal = 0;
        for(bouncedObject r:o){
            finalTotal+=r.numberNameTotal;
        }
        
        // Total Email (Bounced + Not Bounced)
        List<AggregateResult> total = [SELECT COUNT(Email) total FROM Contact];
        Integer totalEmail = 0;
        if(total.size() != 0){
            totalEmail = (Integer)total[0].get('total');
        }
        
       
        resultClass result = new resultClass();
        Map<String, Decimal> resultMap = new Map<String,Decimal>();
        
        resultMap.put('total',finalTotal);
        if(totalEmail != 0){
            resultMap.put('percentage',(finalTotal/totalEmail)*100);
        }else{
            resultMap.put('percentage',0);
        }
        
        result.var_decimal.add(resultMap);
        return result;
        
    }
    
/////////////////////////////////////////    
/// Method of the algorithm number 4 ///
///////////////////////////////////////    
 /*   
     public resultClass algo_4(){
        List<bouncedObject> o1 = listOfBouncedObject_latent;
        List<bouncedObject> o2 = listOfBouncedObject_openOp;
        List<bouncedObject> o3 = listOfBouncedObject_OpportunityLatence;
         
         
        Double finalTotal = 0;
        Map<String, bouncedObject> currentMap = new Map<String, bouncedObject>();
        
        // Match accountId with bouncedObject
        for(bouncedObject r : o1){	
            currentMap.put(r.accountId,r);
        }
         
        // Check the query2
        for(bouncedObject r : o3){	
            if(currentMap.containsKey(r.accountId)){
                bouncedObject current = currentMap.get(r.accountId);
                if(current.probability < r.probability){
                    current.probability = r.probability;
                    current.amount = r.amount;
                    current.stageName = r.stageName;
                }else if(current.probability == r.probability){
                    // Else we check the Amount
                     //System.debug(logginglevel.ERROR, '/////////// current:'+current.amount+' r:'+r.amount);
                    if(current.amount < r.amount){
                        current.probability = r.probability;
                        current.amount = r.amount;
                        current.stageName = r.stageName;
                    }
                }
            }else{
                System.debug(logginglevel.ERROR,'What the fuck error');
            }
        }
       
        resultClass result = new resultClass();
        //result.var_decimal.put('total',finalTotal);
        
        return result;
        
    }
*/    
    
/////////////////////////////////////////    
/// Method of the algorithm number 5 ///
///////////////////////////////////////

    public resultClass algo_5(){
		resultClass result = new resultClass();
		List<bouncedObject> o1 = loadObject('query1');
        List<bouncedObject> o2 = loadObject('query7');
        List<bouncedObject> o3 = loadObject('query2B');
        
        
        Map<String, bouncedObject> currentMap = new Map<String, bouncedObject>();
        
        // Match accountId with bouncedObject
        for(bouncedObject r : o1){	
            if((Double)r.numberNameTotal != 0){
                r.probability = ((Double)r.numberNameBounced/(Double)r.numberNameTotal)*100;
            }else{
                r.probability = 0;
            }
            
            currentMap.put(r.accountId,r);
        }
        // We put the name of the company
        for(bouncedObject r : o2){	
            if(currentMap.containsKey(r.accountId)){
                bouncedObject current = currentMap.get(r.accountId);
                current.name = r.name;
                
            }
        }
        // We calcul the Customer Value
        for(bouncedObject r : o3){	
            if(currentMap.containsKey(r.accountId)){
                bouncedObject current = currentMap.get(r.accountId);
                current.amount += r.amount*r.probability;
                
            }
        }
		Set<String> key = currentMap.keySet();
        // Sort
        List<bouncedObject> listBeforeSort = new List<bouncedObject>{};
        List<bouncedObject> listAfterSort = new List<bouncedObject>{};
        // Calcul the Total
        
        for(String s : key){
            listBeforeSort.add(currentMap.get(s));
        }
        Integer i = 0;
        Integer totalSize = listBeforeSort.size();
		Double maximum = 0;
        Integer maximumPosition = 0;
        for(Integer j=0; j < totalSize; j++){
            if(j < 5 ){
                for(bouncedObject s : listBeforeSort){
                    if(s.amount> maximum){
                        maximum = s.amount;
                        maximumPosition = i;
                    }
                    i++;
                 }
                // Reset
            	i=0;maximum=0;
                // Save into new array and remove from the old one
                listAfterSort.add(listBeforeSort.get(maximumPosition));
                listBeforeSort.remove(maximumPosition);
            	
            }
        }	        
        i = 0;
        Map<String, bouncedObject> resultMap = new Map<String,bouncedObject>();
        for(bouncedObject s : listAfterSort){
         	resultMap.put(''+i,s);  
            i++;
        }
        result.var_bounced.add(resultMap);
        
		return result;        
    }
    
/////////////////////////////////////////    
/// Method of the algorithm number 6 ///
///////////////////////////////////////   
 
    public resultClass algo_6(){
        resultClass result = new resultClass();
        List<bouncedObject> o1 = loadObject('query9');
        List<bouncedObject> o2 = loadObject('query10');
        Map<String, Decimal> resultMap = new Map<String,Decimal>();
        
        if(o1.size() != 0){
            resultMap.put('BouncedPerYear',o1.get(0).numberNameTotal);
       		resultMap.put('BouncedPerMonth',o1.get(0).numberNameTotal/12);
        	resultMap.put('BouncedPerWeek',o1.get(0).numberNameTotal/52);
        }else{
            resultMap.put('BouncedPerYear',0);
       		resultMap.put('BouncedPerMonth',0);
        	resultMap.put('BouncedPerWeek',0);
        }
        
        if(o2.size() != 0){
            resultMap.put('ClientPerYear',o2.get(0).numberNameTotal);
        	resultMap.put('ClientPerMonth',o2.get(0).numberNameTotal/12);
        	resultMap.put('ClientPerWeek',o2.get(0).numberNameTotal/52);
        }else{
            resultMap.put('ClientPerYear',0);
        	resultMap.put('ClientPerMonth',0);
        	resultMap.put('ClientPerWeek',0);
        }
        
        
        
        result.var_decimal.add(resultMap);
        return result;
    }
    
    

/////////////////////////////////////////    
/// Method of the algorithm number 7 ///
///////////////////////////////////////   
 
 public resultClass algo_7(){    
    	resultClass result = new resultClass();
        List<bouncedObject> o1 = loadObject('query1');
        List<bouncedObject> o2 = loadObject('query2');
     
     
     	Map<String, bouncedObject> currentMap = new Map<String, bouncedObject>();
     	Map<String, Double> orderedMap = new Map<String, Double>();
     for(bouncedObject r : o1){
         currentMap.put(r.accountId,r);
     }
     
     for(bouncedObject r : o2){	
            if(currentMap.containsKey(r.accountId)){
                bouncedObject current = currentMap.get(r.accountId);
                current.probability = r.probability;
                current.stageName = r.stageName;
                current.amount = r.amount;
                if(current.numberNameTotal != 0)
                	current.missedRevenue = (current.numberNameBounced/current.numberNameTotal)*r.probability*r.amount;
                else
                    current.missedRevenue = 0;
                
                    if(!orderedMap.containsKey(r.stageName)){
                        orderedMap.put(r.stageName,current.missedRevenue);
                    }else{
                        Double a = orderedMap.get(r.stageName);
                        a = a + current.missedRevenue;
                    }
            }
      }
		Set<String> key = currentMap.keySet();
        Map<String, bouncedObject> resultMap = new Map<String,bouncedObject>();
        // Calcul the Total
        Integer i = 0;
        for(String s : key){
           
         resultMap.put(''+i,currentMap.get(s));  
            i++;
        }
     result.var_bounced.add(resultMap);
     
     return result;
 } 
    
    
/////////////////////////////////////////    
/// Method of the algorithm number 8 ///
///////////////////////////////////////   
 
	public resultClass algo_8(){    
    	resultClass result = new resultClass();
        List<bouncedObject> o1 = loadObject('query11');
        Integer i = 0;
        Map<String, bouncedObject> resultMap = new Map<String,bouncedObject>();
        for(bouncedObject r: o1){
            resultMap.put(''+i,r);
            i++;
        }
        result.var_bounced.add(resultMap);
    	return result;
    }    
/////////////////////////////////////////    
/// Method of the algorithm number 9 ///
///////////////////////////////////////   
 
	public resultClass algo_9(){    
    	resultClass result = new resultClass();
        List<bouncedObject> o1 = loadObject('query12');
        Map<String, Integer> orderedMap = new Map<String, Integer>();
        orderedMap.put('Analyst', (Integer)[SELECT COUNT(Email) total FROM Contact WHERE IsEmailBounced = true AND Title like '%analyst%'][0].get('total'));
        orderedMap.put('Manager', (Integer)[SELECT COUNT(Email) total FROM Contact WHERE IsEmailBounced = true AND Title like '%manager%'][0].get('total'));
        orderedMap.put('Director', (Integer)[SELECT COUNT(Email) total FROM Contact WHERE IsEmailBounced = true AND Title like '%director%'][0].get('total'));
        orderedMap.put('Vice President', (Integer)[SELECT COUNT(Email) total FROM Contact WHERE IsEmailBounced = true AND (Title like '%VP%' OR Title like '%vice president%' OR Title like '%vice-president%')][0].get('total'));
        orderedMap.put('CEO', (Integer)[SELECT COUNT(Email) total FROM Contact WHERE IsEmailBounced = true AND (Title like '%CEO%' OR Title like '%Chief Executive Officer%' or Title like '%Chief-Executive-Officer%')][0].get('total'));
        orderedMap.put('CTO', (Integer)[SELECT COUNT(Email) total FROM Contact WHERE IsEmailBounced = true AND (Title like '%CTO%' OR Title like '%Chief Technical Officer%' or Title like '%Chief-Technical-Officer%')][0].get('total'));
        orderedMap.put('CMO', (Integer)[SELECT COUNT(Email) total FROM Contact WHERE IsEmailBounced = true AND (Title like '%CMO%' OR Title like '%Chief Marketing Officer%' or Title like '%Chief-Marketing-Officer%')][0].get('total'));
        orderedMap.put('COO', (Integer)[SELECT COUNT(Email) total FROM Contact WHERE IsEmailBounced = true AND (Title like '%COO%' OR Title like '%Chief Operation Officer%' or Title like '%Chief-Operation-Officer%')][0].get('total'));
        orderedMap.put('CFO', (Integer)[SELECT COUNT(Email) total FROM Contact WHERE IsEmailBounced = true AND (Title like '%CFO%' OR Title like '%Chief Finance Officer%' OR Title like '%Chief Financial Officer%' or Title like '%Chief-Finance-Officer%')][0].get('total'));
        orderedMap.put('Developer', (Integer)[SELECT COUNT(Email) total FROM Contact WHERE IsEmailBounced = true AND Title like '%developer%'][0].get('total'));
        orderedMap.put('Engineer', (Integer)[SELECT COUNT(Email) total FROM Contact WHERE IsEmailBounced = true AND Title like '%engineer%'][0].get('total'));
       
       
        Integer i = 0;
        Set<String> key = orderedMap.keySet();
        Integer max = 0;
        String sMax = '';
        
		
        for(String r : key){
            Map<String, Integer> resultMap = new Map<String,Integer>();
            if(i < 5){
               for(String s : key){
                    if(orderedMap.get(s) > max){
                        max = orderedMap.get(s);
                        sMax = s;
                    }
           	   }
                if(sMax != ''){
                    orderedMap.remove(sMax);
           	        resultMap.put(sMax,max);
                    result.var_integer.add(resultMap);
                }
                
                sMax='';
                max = 0;
            }
            i++;
            
        }
        
            
    	return result;
    }  
/////////////////////////////////////////    
/// Method of the algorithm number 10 ///
///////////////////////////////////////   
 
	public resultClass algo_10(){    
    	resultClass result = new resultClass();
        List<bouncedObject> o1 = loadObject('query13');
        Map<String, Integer> orderedMap = new Map<String,Integer>();
		for(bouncedObject r : o1){
            orderedMap.put(r.MailingState,(Integer)r.numberNameBounced); 
        }
        
        Set<String> key = orderedMap.keySet();
        Integer i = 0;
        Integer max = 0;
        String sMax = '';
        
		
        for(String r : key){
            Map<String, Integer> resultMap = new Map<String,Integer>();
            if(i < 5){
               for(String s : key){
                    if(orderedMap.get(s) > max){
                        max = orderedMap.get(s);
                        sMax = s;
                    }
           	   }
                if(sMax != ''){
                    orderedMap.remove(sMax);
           	        resultMap.put(sMax,max);
                    result.var_integer.add(resultMap);
                }
                
                sMax='';
                max = 0;
            }
            i++;
            
        }
        
    	return result;
    } 
    
/////////////////////////////////////////    
/// Method of the algorithm number 11 ///
///////////////////////////////////////   
 
	public resultClass algo_11(){    
    	resultClass result = new resultClass();
        List<bouncedObject> o1 = loadObject('query1');
        
        List<bouncedObject> o2 = loadObject('query2C');
		List<AggregateResult > o3 = [SELECT stageName from Opportunity GROUP BY stageName];
        Map<String, bouncedObject> currentMap = new Map<String, bouncedObject>();
        
        // list of AccountId with their bounced total and name
        for(bouncedObject r : o1){	
            currentMap.put(r.accountId,r);
        }
        // Add total name and bounce to the opportunity
        for(bouncedObject r :o2){
            if(currentMap.containsKey(r.accountId)){
                 bouncedObject current = currentMap.get(r.accountId);
                 r.numberNameTotal = r.numberNameTotal + current.numberNameTotal;
                 r.numberNameBounced = r.numberNameBounced + current.numberNameBounced;
            }
        }
        // List of opportunity grouped by stageName
        Map<String, bouncedObject> lastMap = new Map<String, bouncedObject>();
     	// Group the opportunity by stageName
        for(bouncedObject r : o2){	
            if(lastMap.containsKey(r.stageName)){
                 bouncedObject current = lastMap.get(r.stageName); 
                 current.amount = current.amount + r.amount;
                 current.numberNameTotal = current.numberNameTotal + r.numberNameTotal;
                 current.numberNameBounced = current.numberNameBounced + r.numberNameBounced;
            }else{
               lastMap.put(r.stageName,r);
            }
        }
         // reorganise by stagename order
         for(AggregateResult  r:o3){
             String stagename = (String)r.get('stageName');
             if(lastMap.containsKey(stagename)){
                   Map<String, bouncedObject> resultMap = new Map<String,bouncedObject>();
                   resultMap.put(stagename,functionForAlgo11(lastMap.get(stagename),stagename));
               	   result.var_bounced.add(resultMap);
             }else{
                   bouncedObject t = new bouncedObject(stagename);
                   Map<String, bouncedObject> resultMap = new Map<String,bouncedObject>();
                   resultMap.put(stagename,t);
               	   result.var_bounced.add(resultMap);
             }
        }
        
        return result;
    } 
    		// Private function for the Algo11
            private bouncedObject functionForAlgo11(bouncedObject o, String name){
                bouncedObject t = new bouncedObject(name);
                if(o.numberNameTotal != 0){
                    Double top = o.numberNameBounced;
                    Double bot = o.numberNameTotal;
                    t.probability = top*100/bot;
                    t.numberNameBounced = top;
                }else{
                    t.probability = 0;
                    t.numberNameBounced = o.numberNameBounced;
                }
                    
                
                return t;
            }
      
/////////////////////////////////////////    
/// Method of the algorithm number 12 ///
///////////////////////////////////////   
 
	public resultClass algo_12(){    
    	resultClass result = new resultClass();
        List<bouncedObject> o1 = loadObject('query15');
        //List<bouncedObject> o2 = listOfBouncedObject_query16;
        Double totalName = 0;
        Double totalBounce = 0;
        Double percentage = 0;
        for(bouncedObject o : o1){
            totalName = totalName + O.numberNameTotal;
            totalBounce = totalBounce + O.numberNameBounced;
        }
        if(totalName != 0){
            percentage = (totalBounce/totalName)*100;
        }
        Map<String, Decimal> resultMap = new Map<String,Decimal>();
        resultMap.put('total',totalBounce); 
        resultMap.put('percentage',percentage); 
        result.var_decimal.add(resultMap);
    	return result;
    } 
    
/////////////////////////////////////////    
/// Method of the algorithm number 13 ///
///////////////////////////////////////   
 
	public resultClass algo_13(){    
    	resultClass result = new resultClass();
        List<bouncedObject> o1 = loadObject('query15'); 
        List<bouncedObject> o2 = loadObject('query2C'); 
        
       
        Double finalTotal = 0;
        Map<String, bouncedObject> currentMap = new Map<String, bouncedObject>();
        
        // Match accountId with bouncedObject
        for(bouncedObject r : o1){	
            currentMap.put(r.accountId,r);
        }
        // Check the query2
        for(bouncedObject r : o2){	
            if(currentMap.containsKey(r.accountId)){
                bouncedObject current = currentMap.get(r.accountId);
                current.amount = current.amount + (r.amount*r.probability);
            }
        }
        
        Set<String> key = currentMap.keySet();
        // Calcul the Total
        for(String s : key){
            bouncedObject k = currentMap.get(s);
            Double s1 = k.numberNameBounced;
            Double s2 = k.numberNameTotal;
            if(s2 != 0){
                finalTotal= finalTotal + (s1/s2)*k.amount;
            }
        }
        // Total Email (Bounced + Not Bounced)
       // List<AggregateResult> total = [SELECT COUNT(Email) total FROM Contact];
       // Integer totalEmail = (Integer)total[0].get('total');
       Map<String, Decimal> resultMap = new Map<String,Decimal>();
        resultMap.put('total',finalTotal);
        result.var_decimal.add(resultMap);
       // result.var_decimal.put('percentage',finalTotal/totalEmail);
        
        return result;
      
    } 

/////////////////////////////////////////    
/// Method of the algorithm number 14 ///
///////////////////////////////////////   
 
	public resultClass algo_14(){  
         resultClass result = new resultClass();
        
         resultClass r1 = this.algo_13();
         resultClass r2 = this.algo_1();
        
         List<bouncedObject> o1 = loadObject('query15');
         List<bouncedObject> o2 = loadObject('query16');
         List<bouncedObject> o3 = loadObject('query17');
        
        Double v = 0;
        if(r2.var_decimal.size() != 0){
             v = r2.var_decimal[0].get('percentage');
        }

        Double w = 0;
        Double x = 0;
        
            Double totalname = 0;
            Double totalbounced = 0;
            for(bouncedObject o : o1){
                totalname = totalname + o.numberNameTotal;
                totalbounced = totalbounced + o.numberNameBounced;
            }
        
        if(totalname != 0){
          w = (totalbounced/totalname)*100;
        }        
        
        if(r1.var_decimal.size() != 0 && o3.size() != 0){
           if((Double)o3.get(0).Amount != 0){
              x = 	r1.var_decimal[0].get('total')/(Double)o3.get(0).Amount;
            } 
        }
        
        
        Double vScore;
        if( 0 <= v && v <2){
            vScore=5;
        }else if(2 <= v && v <4){
            vScore=4;
        }else if(4 <= v && v <6){
            vScore=3;
        }else if(6 <= v && v <8){
            vScore=2;
        }else if(8 <= v && v <10){
            vScore=1;
        }else{
            vScore=0;
        }
        
        Double wScore;
        if( 0 <= w && w <1){
            wScore=5;
        }else if(1 <= w && w <3){
            wScore=4;
        }else if(3 <= w && w <5){
            wScore=3;
        }else if(5 <= w && w <7){
            wScore=2;
        }else if(7 <= w && w <9){
            wScore=1;
        }else{
            wScore=0;
        }
        
        Double xScore;
        if( 0 <= x && x <0.5){
            xScore=5;
        }else if(0.5 <= x && x <1){
            xScore=4;
        }else if(1 <= x && x <1.5){
            xScore=3;
        }else if(1.5 <= x && x <2){
            xScore=2;
        }else if(2 <= x && x <2.5){
            xScore=1;
        }else{
            xScore=0;
        }
        
        Double bouncedScore = (2*vScore + 3* wScore + 2*xScore)*100/35;
  
         Map<String, Decimal> resultMap = new Map<String,Decimal>();
         resultMap.put('score',bouncedScore);
         
       	result.var_decimal.add(resultMap);
        
        return result;
    }
/*********************************************************************************************************************/   
/****************************************   Method for Preloading functions  *****************************************/ 
/*********************************************************************************************************************/ 
    
	//Method for query1
    private List<AggregateResult> query1(){
            return [SELECT AccountId, COUNT(Name) total, COUNT(EmailBouncedDate) totalBounced FROM Contact GROUP BY AccountId HAVING COUNT(EmailBouncedDate) > 0];
        
    }
    
    
    // Method for query2
    private List<Opportunity> query2(){
          return [SELECT AccountId, Amount, probability, stageName FROM Opportunity  WHERE IsClosed = False AND AccountId IN (SELECT AccountId FROM Contact WHERE IsEmailBounced = true) order by AccountId];

    }  
    
    // Method for query2B
    private List<Opportunity> query2B(){
          return [SELECT AccountId, Amount, probability, stageName FROM Opportunity WHERE AccountId IN (SELECT AccountId FROM Contact WHERE IsEmailBounced = true)];

    }
    
    // Method for query2C
    private List<Opportunity> query2C(){
          return [SELECT AccountId, Amount, probability, stageName FROM Opportunity WHERE AccountId IN (SELECT AccountId FROM Contact WHERE IsEmailBounced = true)];

    } 
    
    // Method for query4
    private List<AggregateResult> query4(){
            return [SELECT COUNT(Name) total, AccountId FROM Contact WHERE LastActivityDate < LAST_N_DAYS:180 AND IsEmailBounced = false GROUP BY AccountId];
    }
    
    // Method for query6
    private List<AggregateResult> query6(){
        return[SELECT AccountId, COUNT(Name) total FROM Contact WHERE AccountId IN (SELECT AccountId FROM Opportunity WHERE IsClosed = False) GROUP BY AccountId];
    }
    
    // Method for query5
    private List<Opportunity> query5(){
        return[SELECT AccountId, Amount, probability, stageName FROM Opportunity  WHERE AccountId IN (SELECT AccountId FROM Contact WHERE LastActivityDate < LAST_N_DAYS:180 AND IsEmailBounced = false)];
    }
    
    // Method for query7
    private List<Account> query7(){
        return[SELECT Id, Name FROM Account WHERE Id IN (SELECT AccountId FROM Contact WHERE IsEmailBounced = true ) ORDER BY Name];
    }
    
    // Method for query9
    private List<AggregateResult> query9(){
        return[SELECT COUNT(Name) total  FROM Contact WHERE IsEmailBounced = true AND EmailBouncedDate > LAST_YEAR];
    }
    // Method for query10
    private List<AggregateResult> query10(){
        return[SELECT count(Name) total FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity WHERE IsWon=true AND CloseDate > LAST_YEAR)];
    }
    // Method for query11
    private List<AggregateResult> query11(){
        return[SELECT COUNT(Email) total, LeadSource FROM Contact WHERE IsEmailBounced = true AND LeadSource != '' GROUP BY LeadSource ORDER BY COUNT(Email) DESC LIMIT 5];
    }
    
    // Method for query12
    private List<AggregateResult> query12(){
        return[SELECT COUNT(Email) total, Title FROM Contact WHERE IsEmailBounced = true GROUP BY Title ORDER BY COUNT(Email) DESC];
    }
    
    // Method for query13
    private List<AggregateResult> query13(){
        return[SELECT COUNT(Email) total, MailingState FROM Contact WHERE IsEmailBounced = true AND MailingState != '' GROUP BY MailingState ORDER BY COUNT(Email) DESC LIMIT 5];
    }
    
    // Method for query15
    private List<AggregateResult> query15(){
        return [SELECT AccountId, COUNT(Name) totalName, COUNT(EmailBouncedDate) totalBounce FROM Contact WHERE AccountId IN (SELECT AccountId FROM Opportunity WHERE IsWon = true) GROUP BY AccountId HAVING COUNT(EmailBouncedDate) > 0];
    }
    
    // Method for query16
    private List<AggregateResult> query16(){
        return [SELECT COUNT(Email) totalName FROM Contact WHERE AccountId IN (SELECT AccountId FROM Opportunity WHERE IsWon = true AND CloseDate > LAST_YEAR)];
    }
 	
    // Method for query17
    private List<AggregateResult> query17(){
        return [SELECT SUM(Amount) total FROM Opportunity WHERE IsWon = true AND CloseDate > LAST_YEAR ];
    }
   
}