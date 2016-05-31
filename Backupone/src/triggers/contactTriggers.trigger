trigger contactTriggers on Contact (before insert) {
if (Trigger__c.getInstance(System.UserInfo.getUserId()).TriggerRun__c){
DomainTriggerHandler  oDomainTriggerHandler = new DomainTriggerHandler();
if(trigger.isBefore && trigger.isInsert )
{
oDomainTriggerHandler.onBeforeInsert(trigger.new);
}
}
}