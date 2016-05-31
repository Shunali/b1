trigger EmpTrigger on Employees__c (after insert, after update, before insert, before update,before delete,after delete,after undelete) {

 if(trigger.isBefore )
 {
   if(trigger.isinsert )
   {
   
   system.debug(trigger.new +'@@@i');
   system.debug(trigger.old +'###i');
   system.debug(trigger.newmap+'%%%%i');
   system.debug(trigger.oldmap+'^^^^i');
   
   
  }
  
  if(trigger.isupdate)
  {
  system.debug(trigger.new +'@@@u');
   system.debug(trigger.old +'###u');
   system.debug(trigger.newmap+'%%%%u');
   system.debug(trigger.oldmap+'^^^^u');
  
  }
 
 if(trigger.isdelete)
  {
   system.debug(trigger.new +'@@@d');
   system.debug(trigger.old +'###d');
   system.debug(trigger.newmap+'%%%%d');
   system.debug(trigger.oldmap+'^^^^d');
  
  
  }
  if(trigger.isundelete)
  {
   system.debug(trigger.new +'@@@ud');
   system.debug(trigger.old +'###ud');
   system.debug(trigger.newmap+'%%%%ud');
   system.debug(trigger.oldmap+'^^^^ud');
  
  
  }
 
 }
 
 
 
 if(trigger.isAfter )
 {
   if(trigger.isinsert )
   {
   
  system.debug(trigger.new +'@@@ai');
   system.debug(trigger.old +'###ai');
   system.debug(trigger.newmap+'%%%%ai');
   system.debug(trigger.oldmap+'^^^ai^');
   
  }
  
  if(trigger.isupdate)
  {
   system.debug(trigger.new +'@@@au');
   system.debug(trigger.old +'###au');
   system.debug(trigger.newmap+'%%%%au');
   system.debug(trigger.oldmap+'^^^^au');
  
  
  }
 
 if(trigger.isdelete)
  {
   system.debug(trigger.new +'@@@ad');
   system.debug(trigger.old +'###ad');
   system.debug(trigger.newmap+'%%%%ad');
   system.debug(trigger.oldmap+'^^^^ad');
  
  
  }
  if(trigger.isundelete)
  {
   system.debug(trigger.new +'@@@aud');
   system.debug(trigger.old +'###aud');
   system.debug(trigger.newmap+'%%%%aud');
   system.debug(trigger.oldmap+'^^^^aud');
  
  
  }
 
 }
 }