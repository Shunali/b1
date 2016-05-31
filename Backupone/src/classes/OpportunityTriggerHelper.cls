public class  OpportunityTriggerHelper{

    public void OpportunityOnAInsert(){
       
        if(checkRecursive.runOnce()){    // to stop recursion

            List<Opportunity> lstoppo = new List<Opportunity>();
            ID rtId1 = [SELECT Id FROM RecordType WHERE Name = 'Donation'].Id;    
            ID rtId2=[select Id from RecordType where Name = 'Installment' and SobjectType = 'Opportunity'].Id;
           
            for(Opportunity a : (List<Opportunity>)Trigger.new){ 
          
                if(a.RecordTypeId == rtId1){

                    if(a.Frequency_del__c=='One-Time'){
          
                        Opportunity t = new Opportunity(); // inserting Installment record
                        t.Installments__c=a.Id;
                        t.OwnerID = a.OwnerID;
                        t.RecordTypeId =rtId2;
                        t.Name=a.Name;
                        t.Amount=a.Amount;
                        t.CloseDate=Date.valueOf('2016-05-28');
                        t.Status__c = 'Open';
                        t.StageName='Prospecting';
                        //Add any other fields you need.
                        lstoppo .add(t);      
                    }
                          
                    else if(a.Frequency_del__c=='Quarterly'){ 
         
                        Decimal s = a.No_of_Year__c*4;     
                        for(Decimal i=1;i<=s;i++){
                          
                            Opportunity t = new Opportunity();   // inserting Installment record
                            t.Installments__c=a.Id;
                            t.OwnerID = a.OwnerID;
                            t.RecordTypeId =rtId2;
                            t.Name='abc'+i;
                            t.Amount=a.Amount;
                            t.CloseDate=Date.valueOf('2016-11-28');
                            t.Status__c = 'Open';
                            t.StageName=a.StageName;
                            //Add any other fields you need.
                            lstoppo .add(t);      
                                }
       
                    }
       
                    else if(a.Frequency_del__c=='Half-Yearly'){
       
                        Decimal s = a.No_of_Year__c*2; 
                        for(Decimal i=1;i<=s;i++) {
               
                            Opportunity t = new Opportunity();     // inserting Installment record
                            t.Installments__c=a.Id;
                            t.OwnerID = a.OwnerID;
                            t.RecordTypeId =rtId2;
                            t.Name='Installment'+i;
                            t.Amount=a.Amount;
                            t.CloseDate=Date.valueOf('2016-11-28');
                            t.Status__c = 'Open';
                            t.StageName=a.StageName;
                            //Add any other fields you need.
                            lstoppo .add(t);       
                        }
     
                    }
      
                    else if(a.Frequency_del__c=='Monthly') {
       
                        Decimal s = a.No_of_Year__c*12;     
                        for(Decimal i=1;i<=s;i++) {
                                  
                            Opportunity t = new Opportunity();
                            t.Installments__c=a.Id;
                            t.OwnerID = a.OwnerID;
                            t.RecordTypeId =rtId2;
                            t.Name='Installment'+i;
                            t.Amount=a.Amount;
                            t.CloseDate=Date.valueOf('2016-11-28');
                            t.Status__c = 'Open';
                            t.StageName=a.StageName;
                            //Add any other fields you need.
                            lstoppo .add(t);      
                        }
                    } 
                }
            }
          
            insert lstoppo ;
        }
  
    }


   
    
    public void OpportunityOnBUpdate(){
       
        List<Opportunity> lstChildoppo = new List<Opportunity>();
        ID rtId1 = [SELECT Id FROM RecordType WHERE Name = 'Installment'].Id;

        for(Opportunity a : (List<Opportunity>)Trigger.new){ 
     
            if(a.RecordTypeId == rtId1){
           
                a.Remaining_Amount__c=a.Amount-a.Amount_Paid__c;
                if(a.Remaining_Amount__c==0){
                
                    a.Status__c='Completed';
               
                }
                
                else if (a.Amount_Paid__c==0){
                
                    a.Status__c='Open';
                
                }
                
                else{
                
                    a.Status__c='Pending'; 
                
                }
            }
        }
    
    }

   
    public void OpportunityOnAUpdate(){
     
        if(checkRecursive.runOnce1()){
            
            Id ParentOppo; 
            Integer count=0;
            for(Opportunity a : (List<Opportunity>)Trigger.new){ 

                ParentOppo= a.Installments__c;
                 
            }
        
  
            list<Opportunity> oplst1=[Select id,Status__c from Opportunity where Id=:ParentOppo];
            list<Opportunity > oplst2=[Select id,Status__c from Opportunity where Installments__c=:ParentOppo];
          
            for (Opportunity b:oplst2){
        
                if(b.Status__c=='Completed')
                {
                
                count++;
                 
                }
            }
                
            if(count==oplst2.size()){
                    
                oplst1.get(0).Status__c='Completed';
                update oplst1;
            }
                
            else if(count!=0){
                   
                oplst1.get(0).Status__c='Pending';
                update oplst1;
            }
            
            else{
                     
                oplst1.get(0).Status__c='Open';
                update oplst1;
            }

        }
     
    }
         
        
   
}