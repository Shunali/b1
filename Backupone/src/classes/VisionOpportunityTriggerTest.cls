//This test class tests the code for vision opportunity trigger handler.
@isTest
private class VisionOpportunityTriggerTest{
    
    //This testmethod tests the case where vision opportunity has the same invoice number as one of the opportunity.
    @isTest
    static  void testSameInvoiceNumberForInsertion() {
  
            // creating and inserting Opportunity test data.
        list<Opportunity> oppoList = new list<Opportunity>();
        Opportunity visiopp1 = new Opportunity();
        visiopp1.name = 'prachi';
        visiopp1.closeDate = Date.newInstance(2012,02,30);
        visiopp1.StageName = 'Open';
        visiopp1.recordTypeId = '01228000000lRJt';
        visiopp1.Invoice_Number__c='INV-00003';
        visiopp1.CustomerOpp_Id__c='CS-001';
        oppoList.add(visiopp1);
        insert oppoList;
         
        //creating and inserting product test data.
        List<Product2> testProductRecord= new List<Product2>() ;
        Product2 objProduct=new Product2();
        objProduct.Name='Product1';
        objProduct.ProductCode='Code';
        objProduct.isActive=true;
        testProductRecord.add(objProduct);
        insert testProductRecord;
     
        //creating and inserting pricebookentry test data.
        List<PriceBookEntry> testPriceBookEntryRecord=new List<PriceBookEntry>() ;
        PriceBookEntry objPriceBookEntry=new PriceBookEntry();
        objPriceBookEntry.UnitPrice=200;
        objPriceBookEntry.UseStandardPrice=false;
        objPriceBookEntry.IsActive=true;
        testPriceBookEntryRecord.add(objPriceBookEntry); 
        testPriceBookEntryRecord[0].Pricebook2Id=Test.getStandardPricebookId();
        testPriceBookEntryRecord[0].Product2Id=testProductRecord[0].Id;  
        insert testPriceBookEntryRecord;
       
        //creating and inserting opportunity line item test data.
        List<OpportunityLineItem> testOpportunityLineItemRecord=new List<OpportunityLineItem>() ;
        OpportunityLineItem objLineItem=new OpportunityLineItem();
        objLineItem.OpportunityId=oppoList[0].Id;
        objLineItem.PricebookEntryId= testPriceBookEntryRecord[0].Id;
        objLineItem.Quantity=2;
        objLineItem.UnitPrice=100;
        testOpportunityLineItemRecord.add(objLineItem);   
        insert testOpportunityLineItemRecord;

        //creating and inserting Vision opportunity line item test data.
        List<Vision_Opportunity__c> testVisionOpportunities=new List<Vision_Opportunity__c>();
        Vision_Opportunity__c objVisionOpportunity=new Vision_Opportunity__c();
        objVisionOpportunity.Customer_Id__c='CS-001';
        objVisionOpportunity.InvoiceNumber__c='INV-00003';
        objVisionOpportunity.Name='Robin';
        testVisionOpportunities.add(objVisionOpportunity);
        Test.startTest();
        insert testVisionOpportunities;
        Test.stopTest();
        
        
        List<Opportunity> clonedRecords=[SELECT Id
                                          FROM Opportunity 
                                          WHERE StageName='Closed Won'];
        List<Opportunity> newCreatedRecords=[SELECT Id
                                                  , Invoice_Number__c
                                               FROM Opportunity
                                              WHERE Invoice_Number__c='INV-00003'];
        system.assertEquals(1,clonedRecords.size());   // Assert for testing
        system.assertEquals(2,newCreatedRecords.size());
        
        
    }  
    
    //This testmethod tests the case where vision opportunity does not same invoice number as one of the opportunity.
    @isTest
    static void testCustomerHavingAccount() {
      
                // creating and inserting Opportunity test data.
        list<Opportunity> oppoList = new list<Opportunity>();
        Opportunity visiopp1 = new Opportunity();
        visiopp1.name = 'prachi';
        visiopp1.closeDate = Date.newInstance(2012,02,30);
        visiopp1.StageName = 'Open';
        visiopp1.recordTypeId = '01228000000lRJt';
        visiopp1.Invoice_Number__c='INV-00003';
        visiopp1.CustomerOpp_Id__c='CS-001';
        oppoList.add(visiopp1);
        insert oppoList;
         
        //creating and inserting product test data.
        List<Product2> testProductRecord= new List<Product2>() ;
        Product2 objProduct=new Product2();
        objProduct.Name='Product1';
        objProduct.ProductCode='Code';
        objProduct.isActive=true;
        testProductRecord.add(objProduct);
        insert testProductRecord;
   
        //creating and inserting pricebookentry test data.
        List<PriceBookEntry> testPriceBookEntryRecord=new List<PriceBookEntry>() ;
        PriceBookEntry objPriceBookEntry=new PriceBookEntry();
        objPriceBookEntry.UnitPrice=200;
        objPriceBookEntry.UseStandardPrice=false;
        objPriceBookEntry.IsActive=true;
        testPriceBookEntryRecord.add(objPriceBookEntry); 
        testPriceBookEntryRecord[0].Pricebook2Id=Test.getStandardPricebookId();
        testPriceBookEntryRecord[0].Product2Id=testProductRecord[0].Id;  
        insert testPriceBookEntryRecord;
        
        //creating and inserting opportunity line item test data.
        List<OpportunityLineItem> testOpportunityLineItemRecord=new List<OpportunityLineItem>() ;
        OpportunityLineItem objLineItem=new OpportunityLineItem();
        objLineItem.OpportunityId=oppoList[0].Id;
        objLineItem.PricebookEntryId= testPriceBookEntryRecord[0].Id;
        objLineItem.Quantity=2;
        objLineItem.UnitPrice=100;
        testOpportunityLineItemRecord.add(objLineItem);   
        insert testOpportunityLineItemRecord;
       
        //creating and inserting Account line item test data.      
        List<Account> testAccounts=new List<Account>();
        Account objAccount=new Account();
        objAccount.Name='Rajni';
        objAccount.Customer_Id__c='CS-001';
        testAccounts.add(objAccount);
        Test.startTest();
        insert testAccounts;
        Test.stopTest();
        
        //creating and inserting Vision opportunity line item test data.
        List<Vision_Opportunity__c> testVisionOpportunities=new List<Vision_Opportunity__c>();
        Vision_Opportunity__c objVisionOpportunity=new Vision_Opportunity__c();
        objVisionOpportunity.Customer_Id__c='CS-001';
        objVisionOpportunity.InvoiceNumber__c='INV-00001';
        objVisionOpportunity.Name='Robin';
        testVisionOpportunities.add(objVisionOpportunity);
        insert testVisionOpportunities;
        
        List<Opportunity> clonedRecords=[SELECT Id
                                          FROM Opportunity 
                                          WHERE StageName='Closed Won'];
        List<Opportunity> newCreatedRecords=[SELECT Id
                                                  , Invoice_Number__c
                                               FROM Opportunity
                                              WHERE Invoice_Number__c='INV-00001'];
        system.assertEquals(0,clonedRecords.size());                // Assert for testing
        system.assertEquals(1,newCreatedRecords.size());

      }
      
    //This testmethod tests the case where vision opportunity is updated with different same invoice number.  
    @isTest
    static void testCustomerHavingupdate() {
      
                // creating and inserting Opportunity test data.  
        list<Opportunity> oppoList = new list<Opportunity>();
        Opportunity visiopp1 = new Opportunity();
        visiopp1.name = 'prachi';
        visiopp1.closeDate = Date.newInstance(2012,02,30);
        visiopp1.StageName = 'Open';
        visiopp1.recordTypeId = '01228000000lRJt';
        visiopp1.Invoice_Number__c='INV-00003';
        visiopp1.CustomerOpp_Id__c='CS-001';
        oppoList.add(visiopp1);
        insert oppoList;

        //creating and inserting product test data.
        List<Product2> testProductRecord= new List<Product2>() ;
        Product2 objProduct=new Product2();
        objProduct.Name='Product1';
        objProduct.ProductCode='Code';
        objProduct.isActive=true;
        testProductRecord.add(objProduct);
        insert testProductRecord;
       
        //creating and inserting pricebookentry test data.
        List<PriceBookEntry> testPriceBookEntryRecord=new List<PriceBookEntry>() ;
        PriceBookEntry objPriceBookEntry=new PriceBookEntry();
        objPriceBookEntry.UnitPrice=200;
        objPriceBookEntry.UseStandardPrice=false;
        objPriceBookEntry.IsActive=true;
        testPriceBookEntryRecord.add(objPriceBookEntry); 
        testPriceBookEntryRecord[0].Pricebook2Id=Test.getStandardPricebookId();
        testPriceBookEntryRecord[0].Product2Id=testProductRecord[0].Id;  
        insert testPriceBookEntryRecord;
        
        //creating and inserting opportunity line item test data.
        List<OpportunityLineItem> testOpportunityLineItemRecord=new List<OpportunityLineItem>() ;
        OpportunityLineItem objLineItem=new OpportunityLineItem();
        objLineItem.OpportunityId=oppoList[0].Id;
        objLineItem.PricebookEntryId= testPriceBookEntryRecord[0].Id;
        objLineItem.Quantity=2;
        objLineItem.UnitPrice=100;
        testOpportunityLineItemRecord.add(objLineItem);   
        insert testOpportunityLineItemRecord;
        
        //creating and inserting Account line item test data.   
        List<Account> testAccounts=new List<Account>();
        Account objAccount=new Account();
        objAccount.Name='Rajni';
        objAccount.Customer_Id__c='CS-001';
        testAccounts.add(objAccount);
        insert testAccounts;

        //creating and inserting Vision opportunity line item test data.
        List<Vision_Opportunity__c> testVisionOpportunities=new List<Vision_Opportunity__c>();
        Vision_Opportunity__c objVisionOpportunity=new Vision_Opportunity__c();
        objVisionOpportunity.Customer_Id__c='CS-001';
        objVisionOpportunity.InvoiceNumber__c='INV-00003';
        objVisionOpportunity.Name='Robin';
        testVisionOpportunities.add(objVisionOpportunity);
        insert testVisionOpportunities;
        
       
        
        List<Opportunity> clonedRecords=[SELECT Id
                                          FROM Opportunity 
                                          WHERE StageName='Closed Won'];
        List<Opportunity> newCreatedRecords=[SELECT Id
                                                  , Invoice_Number__c
                                               FROM Opportunity
                                              WHERE Invoice_Number__c='INV-00001'];
        system.assertEquals(0,clonedRecords.size());
        system.assertEquals(1,newCreatedRecords.size());    // Assert for testing
        
        // Updating the record of vision opportunity
        testVisionOpportunities[0].InvoiceNumber__c='INV-00001';
        Test.startTest();
        update testVisionOpportunities[0];
        Test.stopTest();
        
        List<Opportunity> newCreatedRecords1=[SELECT Id
                                                  , Invoice_Number__c
                                               FROM Opportunity
                                              WHERE Invoice_Number__c='INV-00001'
                                                 OR Invoice_Number__c='INV-00003'];
        system.assertEquals(2,newCreatedRecords1.size());
        

    }
    
    }