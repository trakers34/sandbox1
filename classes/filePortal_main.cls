public with sharing class filePortal_main {
	
	public static List<User> getUserList(){
		List<User> userList = [
		    Select Id, Name From User WHERE Id !=:UserInfo.getUserId() limit 100
		];
		return userList;
	}
	
    public static List<User> getCurrentUser(){
        List<User> userList = [
		    Select Id, Name From User WHERE Id =:UserInfo.getUserId() limit 1
		];
		return userList;
    }
}