public class AddPrimaryContact implements Queueable {
    List<Account> listOfAccount = new List<Account>();
    List<Contact> listOfContact = new List<Contact>();
  	Contact cc;
    
    public AddPrimaryContact(Contact paramContact,String paramState){
        this.listOfAccount = [SELECT Id FROM Account WHERE BillingState =: paramState limit 200];
       	this.cc = paramContact;
    }
    
    public void execute(QueueableContext context){
        integer num = 0;
         for(Account acc : this.listOfAccount){
            Contact cloned = cc.clone(false,true,true,false);
             		cloned.AccountId = acc.id;
            listOfContact.add(cloned);
             num++;
        }
        
        insert listofContact;
    }
    
}