trigger TestClone on Account (after insert) {

if (Trigger__c.getInstance(System.UserInfo.getUserId()).TriggerRun__c){
   Account [] accToSave = new Account[]{};
   
   if(checkRecursive.runOnce()){

        // query accounts and store by there name to lookup it up quickly
        Map<Id,Account> accountMap = new Map<Id,Account>([  Select  Id, Name, Description, Phone, Fax  
                                                        From Account 
                                                        Where Id IN: trigger.new]);

        // clone
        for (Account acc : trigger.new){   
            Account Clone = new Account();  
            Clone.Name =  acc.Name;
            Clone.Type =  acc.Type;
            Clone.Phone = acc.Phone;
            Clone.Fax =  acc.Fax;
            Clone.Description =  acc.Description;

            accToSave.add(Clone);
        }

        insert accToSave;

    }
} }