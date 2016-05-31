@isTest
public class OpportunitytriggerTestclass {
    
    @isTest  
    Static void UnitTest1(){   // test method 1
    
        // inserting records in opportunity
        ID rtId1 = [SELECT Id FROM RecordType WHERE Name = 'Donation'].Id; 
        list<Opportunity> parentList = new list<Opportunity>();
        Opportunity donation1 = new Opportunity();
        donation1.name = 'NGO Donation';
        donation1.No_of_Year__c= 2;
        donation1.Frequency_del__c= 'Monthly';
        donation1.amount = 4000;
        donation1.closeDate = Date.newInstance(2012,02,30);
        donation1.StageName = 'Open';
        donation1.recordTypeId = rtId1;
        parentList.add(donation1);
 
        Opportunity donation2 = new Opportunity();
        donation2.name = 'NGO Donation';
        donation2.No_of_Year__c= 2;
        donation2.Frequency_del__c= 'One-Time';
        donation2.amount = 4000;
        donation2.closeDate = Date.newInstance(2012,02,30);
        donation2.StageName = 'Open';
        donation2.recordTypeId = rtId1;
        parentList.add(donation2);
        
        Opportunity donation3 = new Opportunity();
        donation3.name = 'NGO Donation';
        donation3.No_of_Year__c= 2;
        donation3.Frequency_del__c= 'Half-Yearly';
        donation3.amount = 4000;
        donation3.closeDate = Date.newInstance(2012,02,30);
        donation3.StageName = 'Open';
        donation3.recordTypeId = rtId1;
        parentList.add(donation3);          
        
        Opportunity donation4 = new Opportunity();
        donation4.name = 'NGO Donation';
        donation4.No_of_Year__c= 2;
        donation4.Frequency_del__c= 'Quarterly';
        donation4.amount = 4000;
        donation4.closeDate = Date.newInstance(2012,02,30);
        donation4.StageName = 'Open';
        donation4.recordTypeId = rtId1;
        parentList.add(donation4);
        
        Test.startTest();
        insert(parentList);
        Test.stopTest();
        
        list<Opportunity> insertedOppo = [Select id from Opportunity where recordTypeID =:rtId1];
        list<Opportunity> allOppo = [Select id from Opportunity];        
        system.assertEquals(4,insertedOppo.size(),'Failed');
        system.assertEquals(41,allOppo.size(),'Failed');
        
     
        delete insertedOppo;
        insertedOppo = [Select id from Opportunity where recordTypeID =:rtId1];
        system.assertEquals(0,insertedOppo.size());

    }
    
    
    
    @isTest  
    Static void UnitTest2(){
        ID rtId1 = [SELECT Id FROM RecordType WHERE Name = 'Donation'].Id;  
        ID rtId2 = [SELECT Id FROM RecordType WHERE Name = 'Installment'].Id;  
        Opportunity donation1 = new Opportunity();
        donation1.name = 'NGO Donation';
        donation1.No_of_Year__c= 2;
        donation1.Frequency_del__c= 'Half-Yearly';
        donation1.amount = 4000;
        donation1.closeDate = Date.newInstance(2012,02,30);
        donation1.StageName = 'Open';
        donation1.recordTypeId = rtId1 ;
     
        Test.startTest();
        insert donation1;
        Test.stopTest();
        
        list<Opportunity> insertedOppo1 = [Select id,Amount_Paid__c  from Opportunity where recordTypeID=:rtId2 ]; 
        for(Opportunity opp:insertedOppo1 )
        {
          opp.Amount_Paid__c =600; 
        }
        update insertedOppo1;
        
        list<Opportunity> insertedOppo = [Select id,Remaining_Amount__c from Opportunity where recordTypeID =:rtId2 ];
        system.assertequals(3400,insertedOppo.get(0).Remaining_Amount__c);
    }
    
    @isTest  
    Static void UnitTest3()
    {
         ID rtId1 = [SELECT Id FROM RecordType WHERE Name = 'Donation'].Id;  
        ID rtId2 = [SELECT Id FROM RecordType WHERE Name = 'Installment'].Id; 
        Opportunity donation1 = new Opportunity();
        donation1.name = 'NGO Donation';
        donation1.No_of_Year__c= 2;
        donation1.Frequency_del__c= 'Half-Yearly';
        donation1.amount = 4000;
        donation1.closeDate = Date.newInstance(2012,02,30);
        donation1.StageName = 'Open';
        donation1.recordTypeId = rtId1 ;

        Test.startTest();
        insert donation1;
        Test.stopTest();
       
      
        list<Opportunity> insertedOppo1 = [Select id,Amount_Paid__c  from Opportunity where recordTypeID =:rtId2 ];
        for(Opportunity opp:insertedOppo1 )
        {
          opp.Amount_Paid__c =4000;
        }
        update insertedOppo1;
        list<Opportunity> insertedOppo2 = [Select id,Remaining_Amount__c,Status__c from Opportunity where recordTypeID =:rtId2 ];
        system.assertequals(0.00,insertedOppo2.get(0).Remaining_Amount__c);
        system.assertequals('Completed',insertedOppo2.get(0).Status__c);
    }
}