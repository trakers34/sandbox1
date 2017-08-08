global class AnimalLocatorMock implements HttpCalloutMock{
	global HTTPResponse respond(HTTPRequest request){
            HttpResponse response = new HttpResponse();
        		response.setHeader('Content-Type', 'application/json');
        		response.setBody('{"animal":{"id":0,"name":"test","eats":"","says":""}}');
        		response.setStatusCode(200);
        	return response; 
        }
}