@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('https://ap2.salesforce.com/services/apexrest/Lead', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
      //  res.setHeader('Content-Type', 'application/json');
      //  res.setBody( '{"firstName" : "Shunali","lastName" : "Singh","email" : "tan.cool@email.email","phone" : "23456","company":"ibm"}');
      //  res.setStatusCode(200);
        return res;
    }

}