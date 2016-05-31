trigger ContactTriggerOne on Contact (before update) {
if (Trigger__c.getInstance(System.UserInfo.getUserId()).TriggerRun__c){
  if(trigger.isBefore) {      

            if(trigger.isUpdate){

                        new ContactTriggerOneHandler().onBeforeUpdate();   

                    }//end of if       

            }//end of if 
    
        
}
}