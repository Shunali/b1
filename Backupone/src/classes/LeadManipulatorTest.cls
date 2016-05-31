@isTest
private class LeadManipulatorTest {
    @isTest
    static void testCalloutInsertone() {   // test method 1 when lead is inserted
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String output= LeadManipulator.doPost('Shunali','Singh','tan.cool@email.email','23456','ibm');
        
        // Verify response received contains fake values
        list<Lead>ltlead= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals(ltlead.size(), 1);
    }
    
    @isTest 
    static void testCalloutInserttwo() {    // test method 2 when lead is inserted and required field is missing
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String output= LeadManipulator.doPost('Shunali',' ','tan.cool@email.email','23456','ibm');
        // Verify response received contains fake values
        list<Lead>ltlead= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals('{"status":"Insert failed. First exception on row 0; first error: REQUIRED_FIELD_MISSING, Required fields are missing: [LastName]: [LastName]","isSuccess":false,"idLead":null}',output);
    }
    
    @isTest 
    static void testCalloutInsertthree() {    // test method 3 when lead is inserted and fields are null
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String output= LeadManipulator.doPost('Shunali',null,null,null,'ibm');
         system.debug(output);
        // Verify response received contains fake values
        list<Lead>ltlead= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals('{"status":"Error : You must provide a FirstName, LastName, Email and Phone for your Insert.","isSuccess":false,"idLead":null}',output);
   
    }
    
    @isTest 
    static void testCalloutUpdateone() {    // test method 4 when lead is updated 
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.RestContext.request = new RestRequest();    // created request response for sending parameter in url
        System.RestContext.response = new RestResponse();
 
        String output1= LeadManipulator.doPost('Robin','Singh','abccool@email.email','2356','tcs');
        list<Lead>ltlead1= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals(ltlead1.size(), 1);
        
        String ID = ltlead1.get(0).Id;
        RestContext.request.requestURI = '/services/apexrest/Lead';
        RestContext.request.params.put('Id',ID);    // sending id as parameter in url
        string output2= LeadManipulator.doPatch('Robin','Singh','Tsh@gmail.com','2356');
        
        // Verify response received contains fake values
        list<Lead>ltlead2= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals(ltlead2.get(0).Email,'tsh@gmail.com');
    }
    
    @isTest 
    static void testCalloutUpdatetwo() {   // test method 5 when lead is updated and all field are updated to null
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.RestContext.request = new RestRequest();     // created request response for sending parameter in url
        System.RestContext.response = new RestResponse();
 
        String output1= LeadManipulator.doPost('Robin','Singh','abccool@email.email','2356','tcs');
        list<Lead>ltlead1= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals(ltlead1.size(), 1);
        String ID = ltlead1.get(0).Id;
        RestContext.request.requestURI = '/services/apexrest/Lead';
        RestContext.request.params.put('Id',ID);    // sending id as parameter in url
        String output2= LeadManipulator.doPatch(null,null,null,null);
        System.assertEquals('{"status":"Error : You must provide a FirstName, LastName, Email and Phone for your Update.","isSuccess":false,"idLead":null}',output2);
    }
    
    @isTest 
    static void testCalloutUpdatethree() {    // test method 6 when lead is updated and no row got matched
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.RestContext.request = new RestRequest();
        System.RestContext.response = new RestResponse();
 
        String output1= LeadManipulator.doPost('Robin','Singh','abccool@email.email','2356','tcs');
        list<Lead>ltlead1= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals(ltlead1.size(), 1);
        String ID = ltlead1.get(0).Id;
        String output2= LeadManipulator.doPatch('Robin','Singh','abccool@email.email','0000');
        System.assertEquals('{"status":"List has no rows for assignment to SObject","isSuccess":false,"idLead":null}',output2);
    }
    
   /*@isTest 
    static void testCalloutUpdatefour() {     // test method 7 when lead is updated and exception occur
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.RestContext.request = new RestRequest();
        System.RestContext.response = new RestResponse();
 
      String output1= LeadManipulator.doPost('Robin','Singh','abccool@email.email','2356','tcs');
     list<Lead>ltlead1= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
      System.assertEquals(ltlead1.size(), 1);
      String ID = ltlead1.get(0).Id;
        RestContext.request.requestURI = '/services/apexrest/Lead';
         RestContext.request.params.put('Id',ID);
         String output2= LeadManipulator.doPatch('Robin','abc','abccool@email.email','6767');
        system.debug(output2);
   //    System.assertEquals('{"status":"List has no rows for assignment to SObject","isSuccess":false,"idLead":null}',output2);
    }*/
    
    @isTest 
    static void testCalloutDeleteOne() {  // test method 7 when lead is delete 
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.RestContext.request = new RestRequest(); // created request response for sending parameter in url
        System.RestContext.response = new RestResponse();
 
        String output1= LeadManipulator.doPost('Robin','Singh','abccool@email.email','2356','tcs');
        list<Lead>ltlead1= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals(ltlead1.size(), 1);
        String ID = ltlead1.get(0).Id;
        RestContext.request.requestURI = '/services/apexrest/Lead';   // sending firstname,lastname,email.phone as parameter in url
        RestContext.request.params.put('FirstName','Robin');
        RestContext.request.params.put('LastName','Singh');
        RestContext.request.params.put('Email','abccool@email.email');
        RestContext.request.params.put('Phone','2356');
        String output2= LeadManipulator.doDelete();
        list<Lead>ltlead2= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals(ltlead2.size(), 0);
    } 
    
    @isTest 
    static void testCalloutDeleteTwo() {   // test method 8 when lead needs to deleted but none of the condition met
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.RestContext.request = new RestRequest();  // created request response for sending parameter in url
        System.RestContext.response = new RestResponse();
 
        String output1= LeadManipulator.doPost('Robin','Singh','abccool@email.email','2356','tcs');
        list<Lead>ltlead1= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals(ltlead1.size(), 1);
        String ID = ltlead1.get(0).Id;
        RestContext.request.requestURI = '/services/apexrest/Lead';     // sending firstname,lastname,email.phone as parameter in url
        RestContext.request.params.put('FirstName',null);
        RestContext.request.params.put('LastName',null);
        RestContext.request.params.put('Email','abccool@email.email');
        RestContext.request.params.put('Phone','2356');
        String output2= LeadManipulator.doDelete();
        list<Lead>ltlead2= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals('{"status":"Error : You must provide a FirstName, LastName, Email and Phone for your Delete.","isSuccess":false,"idLead":null}',output2);
    } 
    
    @isTest 
    static void testCalloutDeletethree() { // test method 9 when lead is deleted again and again
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.RestContext.request = new RestRequest();
        System.RestContext.response = new RestResponse();
 
        String output1= LeadManipulator.doPost('Robin','Singh','abccool@email.email','2356','tcs');
        list<Lead>ltlead1= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals(ltlead1.size(), 1);
        String ID = ltlead1.get(0).Id;
        RestContext.request.requestURI = '/services/apexrest/Lead';
        RestContext.request.params.put('FirstName','Robin');
        RestContext.request.params.put('LastName','Singh');
        RestContext.request.params.put('Email','abccool@email.email');
        RestContext.request.params.put('Phone','2356');
        String output2= LeadManipulator.doDelete();
        list<Lead>ltlead2= new List<Lead>([Select Id ,FirstName,LastName,Email,Phone from Lead]);
        System.assertEquals(ltlead2.size(), 0);
        RestContext.request.requestURI = '/services/apexrest/Lead';
        RestContext.request.params.put('FirstName','Robin');
        RestContext.request.params.put('LastName','Singh');
        RestContext.request.params.put('Email','abccool@email.email');
        RestContext.request.params.put('Phone','2356');
        String output3= LeadManipulator.doDelete();
        System.assertEquals('{"status":"ERROR : RECORD_NOT_FOUND","isSuccess":false,"idLead":null}',output3);
    } 
    
}