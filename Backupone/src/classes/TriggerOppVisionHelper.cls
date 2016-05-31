public class  TriggerOppVisionHelper{

    public void OpportunityOnABInsert(){
        Integer count1,count2;
        // intializing list and Map
        List<OpportunityLineItem> newOppLineItemLst = new List<OpportunityLineItem>();
        List<Account>accLst=new List<Account>([select Id, Name, Customer_Id__c from Account ]);
        Opportunity oppObj=new Opportunity ();
        list<Opportunity>lstopp1= new List<Opportunity>();
        Opportunity [] accsToClone = new Opportunity []{};
        Opportunity [] accsToSave = new Opportunity []{};
        Map<String,list<Opportunity> > reloppoMap = new Map<String,list<Opportunity> >();
        ID rtId1 = [SELECT Id FROM RecordType WHERE Name = 'Vision Opportunity'].Id;    
        list<Opportunity>lstopp= new List<Opportunity>([select Name,CustomerOpp_Id__c,Invoice_Number__c,CloseDate,StageName,Vision_Opportunity__c from Opportunity where StageName !='Closed Won' and RecordTypeId =:rtId1]);
        Map<String,List<OpportunityLineItem> > listitemloppoMap = new Map<String,List<OpportunityLineItem>>();
        Set<Id> parentOpportunityIdSet= new Set<Id>();
             
        for(Opportunity opty: lstopp){                
                
            parentOpportunityIdSet.add(opty.Id);   
                    
        } 
      
        for(Opportunity itemp :[SELECT Id,(Select Id,Quantity,OpportunityId,LastModifiedDate,LastModifiedById, CreatedDate,TotalPrice,PricebookEntryId From OpportunityLineItems) from Opportunity Where Id IN: parentOpportunityIdSet]){
              
            listitemloppoMap .put(itemp.Id,itemp.OpportunityLineItems);   // insert key and value in Opportunity id and ListitemProduct related to it
             
        }
    
    

        for(opportunity item :lstopp){       // Map between invoice number and its related opportunity

            if(!(reloppoMap.containsKey(item.Invoice_Number__c))){
           
                reloppoMap.put(item.Invoice_Number__c, New List<Opportunity> {item});
            }
        
            else{
           
                reloppoMap.get(item.Invoice_Number__c).add(item);
            }
      
        }

   
        for(Vision_Opportunity__c a : (List<Vision_Opportunity__c>)Trigger.new){    // Iterating trigger
     
            count1=0;
            count2=0;
            if(reloppoMap.containsKey(a.InvoiceNumber__c)== true){

                for(Opportunity opp : reloppoMap.get(a.InvoiceNumber__c)){   // if invoice number for in opportunity record
                   count1=1;
                    accsToClone.add(opp);
                    if (accsToClone.size() > 0){
                      
                        if(checkRecursive.runOnce()){    // to stop recursion 
                           
                            for (Opportunity record:accsToClone){
                                 
                                Opportunity theClone = record.clone(false,false);
                                theClone.Name= theClone.Name+ ' Partner'; 
                                theClone.CloseDate=theClone.CloseDate;
                                theClone.Amount=theClone.Amount;
                                theClone.StageName= 'Closed Won';
                                theClone.Installments__c=record.Id;
                                theClone.Vision_Opportunity__c=false;
                                accsToSave.add(theClone);
                     
                            }
                              
                        }
                             
                    }
                      
                    opp.CloseDate=Date.newInstance(2012,02,30);
                    opp.StageName='Value Proposition';
                    opp.Invoice_Number__c=a.InvoiceNumber__c;
                    opp.CustomerOpp_Id__c=a.Customer_Id__c;
                    opp.Name=a.Name;
                    lstopp1.add(opp);
                    
         
                }
                 
            }   
     
     
            else if(reloppoMap.containsKey(a.InvoiceNumber__c)==  false){   // if invoice number is not there in opportunity record
                
                    for(account acc:accLst){
                    
                        if(acc.Customer_Id__c==a.Customer_Id__c){
                              count2=1;           
                            //  oppObj.Account=acc.Name;
                            oppObj.RecordTypeId =rtId1;
                            oppObj.Name= a.Name; 
                            oppObj.CloseDate=Date.newInstance(2012,02,30);
                            oppObj.StageName= 'Value Proposition';
                            oppObj.CustomerOpp_Id__c=a.Customer_Id__c;
                            oppObj.Invoice_Number__c = a.InvoiceNumber__c;
                        
                        
                    }
     
               
                }   
               
               
                
            }

        }
        
        if(count1==1){
        
            insert accsToSave;
            update lstopp1;  
        
        }
        else if(count2==1){
        
            insert oppObj;
        
        }

        for(Opportunity oTemp : accsToSave){ //to clone lineitems of opportunity
                   
            if(listitemloppoMap .containsKey(oTemp.Installments__c) == true){
                               
                for (OpportunityLineItem lstoppo :  listitemloppoMap .get(oTemp.Installments__c) ){
                                           
                    OpportunityLineItem  olt1 =lstoppo.clone(false, true, true, true);
                    olt1.OpportunityId=oTemp .id;
                    newOppLineItemLst.add(olt1 ) ;
                                         
                }   
                                           
                                     
            }
        }    
        
        insert  newOppLineItemLst;
 
 
 
    }
}