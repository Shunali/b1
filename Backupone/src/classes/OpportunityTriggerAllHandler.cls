public class OpportunityTriggerAllHandler {   // Handler class for Opportunity Trigger

     public void onAfterInsert(){   

            new OpportunityTriggerHelper().OpportunityOnAInsert(); 

     }//end of onAfterInsert Method   
     
      public void onBeforeUpdate(){   

            new OpportunityTriggerHelper().OpportunityOnBUpdate();   

     }//end of onBeforeUpdate Method 
     
        public void onAfterUpdate(){
           
            new OpportunityTriggerHelper().OpportunityOnAUpdate(); 
     }//end of onAfterUpdate Method 

 }