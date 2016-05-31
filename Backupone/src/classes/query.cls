public with sharing class query {

public void acc()
{
List<account> record =[select id from account where Persons_account__c = false ];
for (account a : record)
{
System.debug(a);
}

for (integer i=0; i<record.size();i++)
{
System.debug(record[i]);
}
}


public void opp()
{
List<Opportunity> record =[select Id, Name FROM Opportunity where Account.name !=null and DeliveryInstallationStatus__c= 'In progress'];

System.debug(record);


set<account> sets = new set<account>();
List <account>L=([select id  from account]);
for (account a: L)
{
    sets.add(a);
    System.debug(sets);
}


Map<Id,Opportunity> B = new Map<Id,Opportunity>([SELECT Id,AccountId FROM Opportunity]);
System.debug(B);

}
}