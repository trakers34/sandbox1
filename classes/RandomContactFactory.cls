public class RandomContactFactory {
	
    public static List<Contact> generateRandomContacts(Integer paramFirst,String paramSecond){
        List<Contact> returned = new List<Contact>();
        for(Integer i = 0; i < paramFirst; i++){
            Contact temp = new Contact(LastName=paramSecond,FirstName=String.valueOf(i));
            returned.add(temp);
        }
        
        return returned;
    }
    
    public static List<Contact> generateRandomContacts(Integer paramFirst,String paramSecond,Account acc){
        List<Contact> returned = new List<Contact>();
        for(Integer i = 0; i < paramFirst; i++){
            Contact temp = new Contact(AccountId=acc.Id,LastName=paramSecond,FirstName=String.valueOf(i));
            returned.add(temp);
        }
        
        return returned;
    }
}