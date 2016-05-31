/*
* GoobleInboundMessage is the class for getting Subject and Body from the 
  received mail 
* Email services are automated processes that use Apex classes
* to process the contents, headers, and attachments of inbound
* email.

* Functionality :
* 1)Receive the mail and Check whether contact exist or not
* 
* 2)If contact exist then insert record in customobject 
*
* 3) If Contact does not exist create new contact and insert the customobject 
record 
*
* Version         Author                  Date                Description 
*  1.0        Shunali Singh Mehra       4/20/2016            Initial Draft
*
*/

global class receivemail implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
    	Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        String mail=email.fromAddress ; // email of the sender
        List<Contact>conList=new List<Contact>([Select Id ,Name,Email 
                                                from contact
                                                where Email =:mail]); 
        if(conList.size()!=0) {                                                   // Check whether contact exist or not
        }
        else{                                                                     //If no then create new contact
        	    Contact obj  = new Contact();
                String str =email.fromName;
                obj.FirstName=str.substring(0,str.indexOf(' '));
                obj.LastName=str.substring(str.indexOf(' ')+1);
                obj.Email=mail;
                insert obj;
            conList.add(obj);
                }
          
         CustomEmailObj__c customobject  = new CustomEmailObj__c  ();      // Create record of email Query
         customobject.ContactToEmail__c= conList.get(0).Id;
         customobject.SubjectTxt__c = email.subject;
         customobject.BodyTxt__c = email.plainTextBody ;
         insert customobject;
         return result;
    }
    
    
    
}