global virtual with sharing class filePortal_dataController {
	
	@remoteAction
	global static List<User> getUserList(){
		return filePortal_main.getUserList();
	}
    
    @remoteAction
	global static List<User> getCurrentUser(){
		return filePortal_main.getCurrentUser();
	}
	
	
}