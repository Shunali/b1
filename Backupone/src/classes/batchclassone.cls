global class batchclassone implements Database.Batchable<sObject>,Database.Stateful{
    global Decimal sum;
    String email;
    global  DateTime startDate;
    global  DateTime endDate;
    global batchclassone(){}
        /* Batch class constructor */
    //Start method
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
    startDate  = system.now();
        String query='SELECT id, Amount from Opportunity';
         return Database.getQueryLocator(query);
        }

    //Excute method
    
global void execute(Database.BatchableContext BC, List<Opportunity> OpportunityList)
{
  
    AggregateResult[] result= [SELECT SUM(Amount) opAmt FROM Opportunity where (StageName ='Closed Won') and (CreatedDate=TODAY) ];
  //  system.debug('11111'+result);
    for(AggregateResult aggRes:result){
        sum = (Decimal)aggRes.get('opAmt');
    //       system.debug('##'+sum );
     }
         List<Opportunity > objLst = new List<Opportunity >();
          for(Opportunity opp: OpportunityList){
            if(sum>0){
                        opp.IsAggregated__c = true;
                    }     
          objLst.add(opp);         
          }
       update objLst;
    }
    
      global void finish(Database.BatchableContext BC){
         endDate=system.now();
        Datetime newDateTime =startDate.addDays(0);
        Long millisec=(endDate.getTime()/1000)-(startDate.getTime()/1000);
        Double hours = millisec/3600000;
       system.debug('-->'+ hours );
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
         AsyncApexJob a = [SELECT Id,
                             Status,
                             NumberOfErrors,
                             JobItemsProcessed,
                             TotalJobItems,
                             CompletedDate,
                             ExtendedStatus,
                             ApexClass.name,
                             CreatedBy.Email,
                             CreatedBy.Name
                      FROM AsyncApexJob 
                      WHERE Id =:BC.getJobId()];
                      string [] toaddress= New string[]{'shunalism@gmail.com'};
                      email.setSubject('Daily Opportunity Amount Aggregator Job Complete');
                      email.setPlainTextBody('Start DateTime:'+startDate +'\nEnd DateTime:'+endDate+'\n Total Time (in Milli)'+ millisec+'\nTotal Duration (in Hours):'+hours +'\nNumber of Opportunities Closed Won Today :' +a.TotalJobItems +'\nTotal Opportunity Amount for today:'+sum );
                      email.setToAddresses(toaddress);
                      Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
       }
       

}