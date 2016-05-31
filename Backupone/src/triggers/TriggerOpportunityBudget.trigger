trigger TriggerOpportunityBudget on Opportunity ( after insert, after update) {

 set<String>BudgetLst= new set <String>();
 set<Id>AccId=new set<Id>();
 for(Opportunity Opp:(List<Opportunity>) trigger.new)
 {
 AccId.add(Opp.AccountId);
 }
System.debug('@@@@@'+AccId);   
list <Opportunity >opplist = new  List<Opportunity> ([select Budget__c from Opportunity where AccountId in: AccId]);
 
 for(Opportunity Opp:opplist ){
 
 BudgetLst.add(Opp.Budget__c);
 }       
System.debug('####'+BudgetLst);   
      
 /*map<id,string>(id,overall_budget) and iterate set   */       
list<account>Acclist=new list<account>([select Overall_Budget__c from account where Id in: AccId]);
System.debug('====accoverallbudget===='+Acclist);   
for(account acc:Acclist)
{
if(BudgetLst.contains(acc.Overall_Budget__c ))
{
System.debug('already exist');

}
else
{
System.debug('already not exist');
}
}
   
}