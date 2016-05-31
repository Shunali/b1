@isTest
public class TestBatchClass {

    static testmethod void testone() {
        
       List<Opportunity> pl = new List<Opportunity>();
       for (Integer i=0;i<10;i++) {
           Opportunity p = new Opportunity(
               Name='opport' + i,
              StageName='Closed Won',
               CloseDate=Date.valueOf('2008-04-28'),
               Amount= 577888788,
               IsAggregated__c= false);
          pl.add(p);
       }
       insert pl;

       Test.startTest();
       batchclassone c = new batchclassone();
       Database.executeBatch(c);
       Test.stopTest();

      list<Opportunity>oppols=[SELECT IsAggregated__c FROM Opportunity];
      for(Opportunity op:oppols){
       System.assertEquals(op.IsAggregated__c,true);
       }
    }
    
     static testmethod void testsec() {
        
       List<Opportunity> pl = new List<Opportunity>();
       for (Integer i=0;i<10;i++) {
           Opportunity p = new Opportunity(
               Name='opport' + i,
              StageName='Closed Won',
               CloseDate=Date.valueOf('2008-04-28'),
               Amount=10,
               IsAggregated__c= false);
          pl.add(p);
       }
       try{
       insert pl;
       }
        catch(DmlException e) 
               {
                    system.assert(e.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
            }

       
       }
   
    
}