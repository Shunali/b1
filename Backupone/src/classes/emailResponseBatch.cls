/*
* emailReponsebatch used to call response back the result in batch after scheduling 
it at particular time 
* 
* Functionality :
* 1)Query on DetailRecord object which is created today
* 
* 2)Created one email template which is called from the execute method. 
*
* Version         Author                  Date                Description 
*  1.0        Shunali Singh Mehra       4/24/2016            Initial Draft
*
*/

global with sharing class emailResponseBatch implements Database.Batchable<sObject>,Database.Stateful {
    
    EmailTemplate emailTemplate = [select id ,name , body 
                                   from EmailTemplate 
                                   where name = 'ResponseEmail']; // EmailTemplate
    
    public Database.QueryLocator start(Database.BatchableContext BC){    //Batch Start method
        return Database.getQueryLocator('select id,name,ContactToEmail__c,ContactToEmail__r.email from CustomEmailObj__c where createddate = TODAY');
    }
    
    public void execute(Database.BatchableContext BC,List<CustomEmailObj__c> CusList){    // Batch execute method
        
        list<String> emailAddresses = new list<String>();
        for(CustomEmailObj__c EmailObj : CusList)
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setTemplateId(emailTemplate.Id);
            email.setTargetObjectId(EmailObj.ContactToEmail__c);
            email.setToAddresses(new list<String> {EmailObj.ContactToEmail__r.email});
            email.setWhatId(EmailObj.id);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});    
        }   
    }
    
    public void finish(Database.BatchableContext BC){       // Batch finish method
    } 
    
   

}