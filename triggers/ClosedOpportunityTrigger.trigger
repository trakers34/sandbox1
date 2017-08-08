trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
 		if(Trigger.isInsert  || Trigger.isUpdate){
            List<Task> taskList = new List<Task>();
            for (Opportunity opp : Trigger.New) {
                if(opp.StageName  == 'Closed Won'){
                    taskList.add(new Task(Subject='Follow Up Test Task',WhatId=opp.Id));
                }
            }
            
            insert taskList;
        }
}