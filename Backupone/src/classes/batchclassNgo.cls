global class batchclassNgo implements Database.Batchable<sObject>,Database.Stateful{

    private static final String Heading = 'NGO Donation & Installments';
    public List<Opportunity> opportunityList; 
    public Map<Opportunity ,List<Opportunity>> oppParentChildMap;
   
    //constructor
    global batchclassNgo (){
        opportunityList = new List<opportunity>(); 
        oppParentChildMap= new Map<Opportunity , List<Opportunity>>();
    }
    global Database.QueryLocator start(Database.BatchableContext batchContext){  // batch start method
        return Database.getQueryLocator('SELECT id, name, Installments__c, Amount_Paid__c,  RecordType.Name, AMOUNT,status__c FROM Opportunity WHERE RecordType.Name IN (\'Installment\') AND Status__c = \'Open\' AND Installments__c!= NULL');
    }

    global void execute(Database.BatchableContext batchContext, List<Opportunity> opportunityList){   // batch execute method
        List<Opportunity> oppoInstallment = new List<opportunity>();
        List<Opportunity> childList = new List<Opportunity>();  
        Set<id> idParentOppSet = new Set<id>();
        for (Opportunity opportunityObj :opportunityList) {
            idParentOppSet.add(opportunityObj.Installments__c); 
        }
        
    
        Map<id, Opportunity> oppParentRecordsMap = new Map<id, Opportunity>([SELECT Amount, Name, status__c FROM Opportunity  WHERE Id in : idParentOppSet ]); 

        for(Opportunity opportunityObj :opportunityList){
           
            Opportunity parentOpportunity = oppParentRecordsMap.get(opportunityObj.Installments__c);
            if(oppParentChildMap.containsKey(parentOpportunity) == true){
           
                opportunityObj.Amount_Paid__c= opportunityObj.Amount ; 
                oppoInstallment.add(opportunityObj);
                oppParentChildMap.get(parentOpportunity).add(opportunityObj );
            }
                    
            else{
                opportunityObj.Amount_Paid__c= opportunityObj.Amount;
                oppoInstallment.add(opportunityObj);

                childList = new List<Opportunity>(); 
                childList.add(opportunityObj);
                oppParentChildMap.put(parentOpportunity ,childList );
              
            } 
        }
        try{
            if(oppoInstallment.size() > 0){
                update oppoInstallment;
            }
        }catch(DmlException dmlError){
            system.debug('DML Exception Raised' + dmlError.getMessage()); 
        }        
    }

    global void finish(Database.BatchableContext batchContext)
    {
        // batch finish method
        String emailData = Heading ;
        Decimal totalAmount;        
        List<String> emaildataList = new List<String>(); 
        List<Opportunity> donationList = new List<Opportunity>();
        List<Opportunity> childInstallmentList = new List<Opportunity>();
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        Id userId = UserInfo.getUserId();        
        String[] userEmail  = New String[]{UserInfo.getUserEmail()};
        email.setSubject(Heading);
        email.setToAddresses(userEmail);
        
        for(Integer oppParentRecord = 0; oppParentRecord < oppParentChildMap.keySet().size(); oppParentRecord++){
           
            totalAmount= 0 ; 
            donationList = new List<Opportunity>(oppParentChildMap.keySet());
            childInstallmentList = new List<Opportunity>(oppParentChildMap.values().get(oppParentRecord));            
            for(Integer oppChildRecord = 0; oppChildRecord < childInstallmentList.size(); oppChildRecord++){
                totalAmount= totalAmount+ oppParentChildMap.values().get(oppParentRecord).get(oppChildRecord).amount;
            }
             emailData += '\n\nDonation Name : '+ donationList.get(oppParentRecord).name + '\n' + 'Total Installments : '+ childInstallmentList.size()+ '\n'  + 'Total Amount Donated : '+totalAmount; 
             email.setPlainTextBody(emailData); 
             emaildataList.add(emailData);           
        }     
        Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
    }
    
    
}