@isTest
public class RecieveMailTest {

    
	@isTest
	static void testRecieveMailTestOne() {   // test class method 1
	   // create new contact
	   Contact ConObj=new Contact(FirstName='Shunali',LastName='Mehra',Email='user@acme.com');  
	   insert ConObj;
	   
	    // Create a new email, envelope object and Header
	    Messaging.InboundEmail email = new Messaging.InboundEmail();
	    Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
		envelope.toAddress = 'checktesting@2tewd04thoj3xvggpiuhqvowzhnvrawlxfhin9bivi3yp81how.28-1fpxbeag.ap2.apex.salesforce.com';
	    envelope.fromAddress = 'user@acme.com';
	    email.fromAddress = 'user@acme.com';
	    email.subject = 'Please contact me';
	    email.fromName = 'Test From ';
	    email.plainTextBody = 'Google';
	    receivemail catcher = new receivemail();
	    // calling inbound message method for email
	    Messaging.InboundEmailResult result = catcher.handleInboundEmail(email, envelope);   
	    system.assert(result.success);
	    
	    Contact contact = [select id, firstName, lastName, email 
	                       from contact
	                       where firstName = 'Shunali' and lastName = 'Mehra'];
	    System.assertEquals(contact.firstName,'Shunali');
	    System.assertEquals(contact.lastName,'Mehra');
	    List<CustomEmailObj__c> cusObj= new List<CustomEmailObj__c>([select id, SubjectTxt__c, BodyTxt__c 
	                                                                 from CustomEmailObj__c]);
	    system.assertEquals(1,cusObj.size());
	    list<Id>lstId=new List<Id>();
	    for(CustomEmailObj__c cusId:cusObj)
	    {
	        lstId.add(cusId.Id);
	        
	    }
	    test.startTest();
	    //calling the web services class generating the fake response through mock class
	    Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorResponse());
	    calloutWeb.webinfo(lstId);
	    test.stopTest();
	
	}
    
    @isTest
    static void testRecieveMailTestSecond() {   // test class method 2
	    
	    // create new contact
	    Contact ConObj=new Contact(FirstName='Shunali',LastName='Mehra',Email='Shunali@gmail.com');
	    insert ConObj;
	    
	    // Create a new email, envelope object and Header
	    Messaging.InboundEmail email = new Messaging.InboundEmail();
	    Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
		envelope.toAddress = 'checktesting@2tewd04thoj3xvggpiuhqvowzhnvrawlxfhin9bivi3yp81how.28-1fpxbeag.ap2.apex.salesforce.com';
	    envelope.fromAddress = 'user@acme.com';
	    email.fromAddress = 'user@acme.com';
	    email.subject = 'Please contact me';
	    email.fromName = 'Test From ';
	    email.plainTextBody = 'Google';
	    receivemail catcher = new receivemail();
	    // calling inbound message method for email
	    Messaging.InboundEmailResult result = catcher.handleInboundEmail(email, envelope);
	    system.assert(result.success);
	    
	    List<CustomEmailObj__c> cusObj= new List<CustomEmailObj__c>([select id, SubjectTxt__c, BodyTxt__c from CustomEmailObj__c]);
	    system.assertEquals(1,cusObj.size());
	    list<Id>lstId=new List<Id>();
	    for(CustomEmailObj__c cusId:cusObj)
	    {
	        lstId.add(cusId.Id);
	        
	    }
	    test.startTest();
	    //calling the web services class generating the fake response through mock class
	    Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorResponse());
	    calloutWeb.webinfo(lstId);
	    test.stopTest();
	    
	    List<DetailRecord__c> c= new List<DetailRecord__c> ([select id, Link__c, Title__c,Snippet__c,RelatedLink__c from DetailRecord__c where RelatedLink__c=:cusObj.get(0).Id]);
	    system.assertEquals(2,c.size());

    }
    
    @isTest
    static void testRecieveMailTestThird() {   // test class method 3
	    
	    // create new contact
	    Contact ConObj=new Contact(FirstName='Shunali',LastName='Mehra',Email='Shunali@gmail.com');
	    insert ConObj;
	    // Create a new email, envelope object and Header
	    Messaging.InboundEmail email = new Messaging.InboundEmail();
	    Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
		envelope.toAddress = 'checktesting@2tewd04thoj3xvggpiuhqvowzhnvrawlxfhin9bivi3yp81how.28-1fpxbeag.ap2.apex.salesforce.com';
	    envelope.fromAddress = 'user@acme.com';
	    email.fromAddress = 'user@acme.com';
	    email.subject = 'Please contact me';
	    email.fromName = 'Test From ';
	    email.plainTextBody = 'Google';
	    receivemail catcher = new receivemail();
	    // calling inbound message method for email
	    Messaging.InboundEmailResult result = catcher.handleInboundEmail(email, envelope);
	    system.assert(result.success);
	    List<CustomEmailObj__c> cusObj= new List<CustomEmailObj__c>([select id, SubjectTxt__c, BodyTxt__c from CustomEmailObj__c]);
	    system.assertEquals(1,cusObj.size());
	    list<Id>lstId=new List<Id>();
	    for(CustomEmailObj__c cusId:cusObj)
	    {
	        lstId.add(cusId.Id);
	        
	    }
	  
	    test.startTest();
	    //calling the web services class generating the fake response through mock class
	    Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorResponse());
	    calloutWeb.webinfo(lstId);
	    test.stopTest();
	    List<DetailRecord__c> c= new List<DetailRecord__c> ([select id, Link__c, Title__c,Snippet__c,RelatedLink__c from DetailRecord__c where RelatedLink__c=:cusObj.get(0).Id]);
	    system.assertEquals(2,c.size());
	    GoobleVFPageController objController= new GoobleVFPageController();
	    objController.FirstPage();
	    system.assertEquals(false,objController.nxt);
	    system.assertEquals(true,objController.prev);
	  
    }
    
   @isTest
   static void testRecieveMailTestFourth() {   // test class method 4
   	    // create new contact
	    Contact ConObj=new Contact(FirstName='Shunali',LastName='Mehra',Email='Shunali@gmail.com');
	    insert ConObj;
	    
	    // Create a new email, envelope object and Header
	    Messaging.InboundEmail email = new Messaging.InboundEmail();
	    Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
		envelope.toAddress = 'checktesting@2tewd04thoj3xvggpiuhqvowzhnvrawlxfhin9bivi3yp81how.28-1fpxbeag.ap2.apex.salesforce.com';
	    envelope.fromAddress = 'user@acme.com';
	    email.fromAddress = 'user@acme.com';
	    email.subject = 'Please contact me';
	    email.fromName = 'Test From ';
	    email.plainTextBody = 'Google';
	    receivemail catcher = new receivemail();
	     // calling inbound message method for email
	    Messaging.InboundEmailResult result = catcher.handleInboundEmail(email, envelope);
	    system.assert(result.success);
	    List<CustomEmailObj__c> cusObj= new List<CustomEmailObj__c>([select id, SubjectTxt__c, BodyTxt__c from CustomEmailObj__c]);
	    system.assertEquals(1,cusObj.size());
	    list<Id>lstId=new List<Id>();
	    for(CustomEmailObj__c cusId:cusObj)
	    {
	        lstId.add(cusId.Id);
	        
	    }
	    
	     test.startTest();
	     //calling the web services class generating the fake response through mock class
	     Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorResponse());
	     calloutWeb.webinfo(lstId);
	     test.stopTest();
	     List<DetailRecord__c> c= new List<DetailRecord__c> ([select id, Link__c, Title__c,Snippet__c,RelatedLink__c from DetailRecord__c where RelatedLink__c=:cusObj.get(0).Id]);
	     system.assertEquals(2,c.size());
	     GoobleVFPageController objController= new GoobleVFPageController();
	     objController.next();
	     system.assertEquals(false,objController.prev);
    }
    
        
    @isTest
    static void testRecieveMailTestFive() {   // test class method 5
    	// create new contact
	    Contact ConObj=new Contact(FirstName='Shunali',LastName='Mehra',Email='Shunali@gmail.com');
	    insert ConObj;
	    // Create a new email, envelope object and Header
	    Messaging.InboundEmail email = new Messaging.InboundEmail();
	    Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
		envelope.toAddress = 'checktesting@2tewd04thoj3xvggpiuhqvowzhnvrawlxfhin9bivi3yp81how.28-1fpxbeag.ap2.apex.salesforce.com';
	    envelope.fromAddress = 'user@acme.com';
	    email.fromAddress = 'user@acme.com';
	    email.subject = 'Please contact me';
	    email.fromName = 'Test From ';
	    email.plainTextBody = 'Google';
	    receivemail catcher = new receivemail();
	    // calling inbound message method for email
	    Messaging.InboundEmailResult result = catcher.handleInboundEmail(email, envelope);
	    system.assert(result.success);
	    List<CustomEmailObj__c> cusObj= new List<CustomEmailObj__c>([select id, SubjectTxt__c, BodyTxt__c from CustomEmailObj__c]);
	    system.assertEquals(1,cusObj.size());
	    list<Id>lstId=new List<Id>();
	    for(CustomEmailObj__c cusId:cusObj)
	    {
	        lstId.add(cusId.Id);
	        
	    }
	    
	     test.startTest();
	     //calling the web services class generating the fake response through mock class
	     Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorResponse());
	     calloutWeb.webinfo(lstId);
	     test.stopTest();
	     List<DetailRecord__c> c= new List<DetailRecord__c> ([select id, Link__c, Title__c,Snippet__c,RelatedLink__c from DetailRecord__c where RelatedLink__c=:cusObj.get(0).Id]);
	     system.assertEquals(2,c.size());
	     GoobleVFPageController objController= new GoobleVFPageController();
	     objController.LastPage();
	     system.assertEquals(true,objController.nxt);
	     objController.History();
	     system.assertEquals(true,objController.var);
    }
    
    @isTest
    static void testRecieveMailTestsix() {   // test class method 6
	    // create new contact	
	    Contact ConObj=new Contact(FirstName='Shunali',LastName='Mehra',Email='Shunali@gmail.com');
	    insert ConObj;
	    
	    // Create a new email, envelope object and Header
	    Messaging.InboundEmail email = new Messaging.InboundEmail();
	    Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
		envelope.toAddress = 'checktesting@2tewd04thoj3xvggpiuhqvowzhnvrawlxfhin9bivi3yp81how.28-1fpxbeag.ap2.apex.salesforce.com';
	    envelope.fromAddress = 'user@acme.com';
	    email.fromAddress = 'user@acme.com';
	    email.subject = 'Please contact me';
	    email.fromName = 'Test From ';
	    email.plainTextBody = 'Google';
	    receivemail catcher = new receivemail();
	     // calling inbound message method for email
	    Messaging.InboundEmailResult result = catcher.handleInboundEmail(email, envelope);
	    system.assert(result.success);
	    List<CustomEmailObj__c> cusObj= new List<CustomEmailObj__c>([select id, SubjectTxt__c, BodyTxt__c from CustomEmailObj__c]);
	    system.assertEquals(1,cusObj.size());
	      list<Id>lstId=new List<Id>();
	    for(CustomEmailObj__c cusId:cusObj)
	    {
	        lstId.add(cusId.Id);
	        
	    }
	    
	     test.startTest();
	     //calling the web services class generating the fake response through mock class
	     Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorResponse());
	     calloutWeb.webinfo(lstId);
	     test.stopTest();
	     List<DetailRecord__c> c= new List<DetailRecord__c> ([select id, Link__c, Title__c,Snippet__c,RelatedLink__c from DetailRecord__c where RelatedLink__c=:cusObj.get(0).Id]);
	     system.assertEquals(2,c.size());
	     GoobleVFPageController objController= new GoobleVFPageController();
	     objController.previous();
	     system.assertEquals(null,objController.nxt);
	     objController.getprev();
	     objController.getnxt();
	    
    }
    
    @isTest
    static  void testRecieveMailTestseven() {    // test class method 7
	    // create new contact    
	    Contact ConObj=new Contact(FirstName='Shunali',LastName='Mehra',Email='Shunali@gmail.com');
	    insert ConObj;
	    
	    // Create a new email, envelope object and Header
	    Messaging.InboundEmail email = new Messaging.InboundEmail();
	    Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
		envelope.toAddress = 'checktesting@2tewd04thoj3xvggpiuhqvowzhnvrawlxfhin9bivi3yp81how.28-1fpxbeag.ap2.apex.salesforce.com';
	    envelope.fromAddress = 'user@acme.com';
	    email.fromAddress = 'user@acme.com';
	    email.subject = 'Please contact me';
	    email.fromName = 'Test From ';
	    email.plainTextBody = 'Google';
	    receivemail catcher = new receivemail();
	     //calling the web services class generating the fake response through mock class
	    Messaging.InboundEmailResult result = catcher.handleInboundEmail(email, envelope);
	    system.assert(result.success);
	    List<CustomEmailObj__c> cusObj= new List<CustomEmailObj__c>([select id, SubjectTxt__c, BodyTxt__c from CustomEmailObj__c]);
	    system.assertEquals(1,cusObj.size());
	            list<Id>lstId=new List<Id>();
	    for(CustomEmailObj__c cusId:cusObj)
	    {
	        lstId.add(cusId.Id);
	        
	    }
	    
	     test.startTest();
	     //calling the web services class generating the fake response through mock class
	     Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorResponse());
	     calloutWeb.webinfo(lstId);
	     test.stopTest();
	     List<DetailRecord__c> c= new List<DetailRecord__c> ([select id, Link__c, Title__c,Snippet__c,RelatedLink__c from DetailRecord__c where RelatedLink__c=:cusObj.get(0).Id]);
	     system.assertEquals(2,c.size());   
	     emailResponseBatch ca = new emailResponseBatch();
	     Database.executeBatch(ca);
	     list<CustomEmailObj__c>cusols=[select id,name,ContactToEmail__c,ContactToEmail__r.email from CustomEmailObj__c where createddate = TODAY];
	     System.assertEquals(cusols.size(),1);
       
    }
    
      static testmethod void testRecieveMailTestEight() {    // test class method 8
        
        // create new contact    
	    Contact ConObj=new Contact(FirstName='Shunali',LastName='Mehra',Email='Shunali@gmail.com');
	    insert ConObj;
	    
	    // Create a new email, envelope object and Header
	    Messaging.InboundEmail email = new Messaging.InboundEmail();
	    Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
		envelope.toAddress = 'checktesting@2tewd04thoj3xvggpiuhqvowzhnvrawlxfhin9bivi3yp81how.28-1fpxbeag.ap2.apex.salesforce.com';
	    envelope.fromAddress = 'user@acme.com';
	    email.fromAddress = 'user@acme.com';
	    email.subject = 'Please contact me';
	    email.fromName = 'Test From ';
	    email.plainTextBody = 'Google';
	    receivemail catcher = new receivemail();
	    
	    Messaging.InboundEmailResult result = catcher.handleInboundEmail(email, envelope);
	    system.assert(result.success);
	    List<CustomEmailObj__c> cusObj= new List<CustomEmailObj__c>([select id, SubjectTxt__c, BodyTxt__c from CustomEmailObj__c]);
	    system.assertEquals(1,cusObj.size());
	            list<Id>lstId=new List<Id>();
	    for(CustomEmailObj__c cusId:cusObj)
	    {
	        lstId.add(cusId.Id);
	        
	    }
	    
	     String CRON_EXP = '0 0 0 15 3 ? 2022';
	     test.startTest();
	     //calling the web services class generating the fake response through mock class
	     Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorResponse());
	     calloutWeb.webinfo(lstId);
	     String jobId = System.schedule('ScheduleApexClassTest',
	                        CRON_EXP, 
	                        new EmailResponseSchedular());
	         
	      // Get the information from the CronTrigger API object
	     CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
	                       FROM CronTrigger 
	                       WHERE id = :jobId];
	
	      // Verify the expressions are the same
	     System.assertEquals(CRON_EXP, ct.CronExpression);
	
	      // Verify the job has not run
	     System.assertEquals(0, ct.TimesTriggered);
	
	      // Verify the next time the job will run
	     system.assertEquals('2022-03-15 00:00:00', 
	     String.valueOf(ct.NextFireTime));     
	     test.stopTest();
	     List<DetailRecord__c> c= new List<DetailRecord__c> ([select id, Link__c, Title__c,Snippet__c,RelatedLink__c from DetailRecord__c where RelatedLink__c=:cusObj.get(0).Id]);
	     system.assertEquals(2,c.size());   
	     emailResponseBatch ca = new emailResponseBatch();
	     Database.executeBatch(ca);
	     list<CustomEmailObj__c>cusols=[select id,name,ContactToEmail__c,ContactToEmail__r.email from CustomEmailObj__c where createddate = TODAY];
	     System.assertEquals(cusols.size(),1);
       
    }
    
}