public class bouncedObject {
	//////////////////////////////////////////
	//
	//////////////////////////////////////////
	
    //List of var
    public String accountId;
    public Double numberNameBounced;
    public Double numberNameTotal;
    public Decimal probability;
    public Double amount;
    public String stageName;
    public String name;
    public String mailingState;
    public Double AnnualRevenue;
    public Double missedRevenue;
    public String LeadSource;
    
    
    // Method
    
    
    public bouncedObject(String accountId){
        this.accountId = accountId;
        this.numberNameTotal = 0;
        this.numberNameBounced = 0;
        this.amount=0;
        this.probability=0;
        this.AnnualRevenue=0;
        this.missedRevenue = 0;
    }
    
    
    
    
}