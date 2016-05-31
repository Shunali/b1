trigger AccountTrigger on Account (after insert) {
 if (Trigger__c.getInstance(System.UserInfo.getUserId()).TriggerRun__c){
    List<Task> lstTasks = new List<Task>();
    for(Account a : Trigger.new){       
        Task t = new Task();
        t.OwnerID = a.OwnerID;
        t.Subject = 'Meeting with ' + a.Name;
        
        t.WhatID=a.Id;
        t.Status = 'Not Started';
        //Add any other fields you need.
        lstTasks.add(t);      
    }
    insert lstTasks;
    }
}