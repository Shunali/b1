public class PreferenceTriggerHelper {

    public void primaryPreferenceOnAInsert()
    {
 
    map<Id,String> RelatedAccounts = new map<Id,String>();
      set<Id> AccountIds = new set<Id>();

        for (Preference__c p :(List<Preference__c>)trigger.new){
         
         if(p.Primary_preference__c == true)
         {   AccountIds.add(p.Name__c );
         RelatedAccounts.put(p.Name__c,p.PreferenceName__c );
         }
        }


     list<account> acc=[Select id,Primary_preference__c from account where id=:AccountIds  ];
        //system.debug('-->4$$$$'+acc);
       list<account>UpdateAcc= new list<account>();
          for(Account acct : acc )
          {
          if(RelatedAccounts.containskey(acct.id))
          {
          
          acct.Primary_preference__c =RelatedAccounts.get(acct.id);
          UpdateAcc.add(acct);
          }
          
   
          }
          update UpdateAcc;
      
    }//end of primaryPreferenceOnAInsert
    
     public void primaryPreferenceOnBInsert(){
    
     String preferName;
     map<Id,String> RelatedAccounts = new map<Id,String>();
      set<Id> AccountIds = new set<Id>();
        for (Preference__c p :(List<Preference__c>)trigger.new){
            AccountIds.add(p.Name__c );
        }


          list<account> acc=[Select id,Primary_preference__c from account where id in : AccountIds];
     
          for(Account acct : acc )
          {

          for (Preference__c pre :(List<Preference__c>)trigger.new){
  
              if(acct.Primary_preference__c==null && pre.Primary_preference__c==false){
          
                          pre.PreferenceName__c.addError('Primary Preference is must');
          
                 } 
              else{ 
              
              if( acct.Primary_preference__c== pre.PreferenceName__c)
              {
             Pre.PreferenceName__c.addError('This preference is already assigned as Primary Preference'); 
                } 
         }
         } 
   
          }
    

      } 

}//end of class