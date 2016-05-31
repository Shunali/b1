public class TriggerOppVisionHandler {   // Handler class for Vision Opportunity Trigger

     public void onBeforeInsert(){   

            new TriggerOppVisionHelper().OpportunityOnABInsert(); 

     }//end of onBeforeInsert Method   
     
      public void onBeforeUpdate(){   

            new TriggerOppVisionHelper().OpportunityOnABInsert();   

     }//end of onBeforeUpdate Method 
     

 }