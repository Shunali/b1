trigger TriggerOppVision  on Vision_Opportunity__c (Before Insert,Before update) {

        if(trigger.isBefore) {      

            if(trigger.isinsert){

                        new TriggerOppVisionHandler().onBeforeInsert();  
                         
                    }//end of if   
            if(trigger.isupdate){         
                        
                        new TriggerOppVisionHandler().onBeforeUpdate();

            }//end of if 
        }

}