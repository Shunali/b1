trigger ContactTriggerTwo on Contact (before update) {
if (Trigger__c.getInstance(System.UserInfo.getUserId()).TriggerRun__c){
 if(trigger.isBefore) {      

            if(trigger.isUpdate){

                        new ContactTriggerTwoHandler().onBeforeUpdate();   

                    }//end of if       

            }//end of if 
} }