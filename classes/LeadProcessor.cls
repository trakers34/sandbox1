global class LeadProcessor implements Database.Batchable<sObject>{
	String query = 'SELECT Id,LeadSource  from lead';
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    	List<Lead> listToUpdate = (List<Lead>)scope;
        for(Lead l : listToUpdate){
            l.LeadSource = 'Dreamforce';
        }
        
        update listToUpdate;
    }
    
    global void finish(Database.BatchableContext BC){

    }
}