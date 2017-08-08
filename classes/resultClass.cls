global class resultClass {
	
    public List<Map<String, String>> var_string; 
    public List<Map<String, Integer>> var_integer; 
    public List<Map<String, Decimal>> var_decimal;
    public List<Map<String, bouncedObject>> var_bounced; 
    
    public resultClass(){
		this.var_string = new List<Map<String, String>>();  
    	this.var_integer = new List<Map<String, Integer>>();
        this.var_decimal = new List<Map<String, Decimal>>();
        this.var_bounced = new List<Map<String, bouncedObject>>();
      
    }
    
}