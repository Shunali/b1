trigger OpportunityTriggerAll on Opportunity (after insert, before update,after update) {
if (Trigger__c.getInstance(System.UserInfo.getUserId()).TriggerRun__c){
        if(trigger.isAfter) {      

            if(trigger.isinsert){

                        new OpportunityTriggerAllHandler().onAfterInsert();  
                         
                    }//end of if   
            if(trigger.isupdate){         
                        
                        new OpportunityTriggerAllHandler().onAfterUpdate();

            }//end of if 
            }
    
        else{
 
         if(trigger.isupdate){

               new OpportunityTriggerAllHandler().onBeforeUpdate();   

    }                 } 
    
}
  }//end of trigger