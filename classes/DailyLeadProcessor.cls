global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx){
        List<Lead> listOfLead = [SELECT Id,LeadSource FROM Lead where LeadSource = null];
        
        for(Lead l : listOfLead){
            l.LeadSource = 'Dreamforce';
        }
        
        update listOfLead;
    }
}