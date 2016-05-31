@isTest
//This class is used as the utility class for the testclasses.
public class TestDataUtilityVisionClass {
    
    //This method returns List of opportunity with all default required fields populated.
    public static List<Opportunity> createOpportunity(Integer recordCount,String stage,Date closingDate,Decimal opportunityAmount){
    List<Opportunity> testOpportunity=new List<Opportunity>();
    for(Integer counter=0;counter<recordCount;counter++){
      Opportunity objOpportunity=new Opportunity();
      objOpportunity.Name='Opportunity'+counter;
      objOpportunity.StageName=stage;
      objOpportunity.CloseDate=closingDate;
      objOpportunity.Amount=opportunityAmount;
      testOpportunity.add(objOpportunity);
    }
    return testOpportunity;
    }
    
    //This method returns the list of products with the provided parameters.
    public static List<Product2> createProduct(Integer recordCount){
      List<Product2> testProducts=new List<Product2>();
      for(Integer counter=0;counter<recordCount;counter++){
        Product2 objProduct=new Product2();
        objProduct.Name='Product'+counter;
        objProduct.ProductCode='Code'+counter;
        objProduct.isActive=true;
        testProducts.add(objProduct);
      }
      return testProducts;
    } 
    
    //This method returns the list of pricebook entries.
    public static List<PriceBookEntry> createPriceBookEntry(Integer recordCount,Decimal unit,Boolean standardPriceUse){
      List<PriceBookEntry> testPriceBookEntries=new List<PriceBookEntry>();
      for(Integer counter=0;counter<recordCount;counter++){
      PriceBookEntry objPriceBookEntry=new PriceBookEntry();
      objPriceBookEntry.UnitPrice=unit;
      objPriceBookEntry.UseStandardPrice=standardPriceUse;
      objPriceBookEntry.IsActive=true;
      testPriceBookEntries.add(objPriceBookEntry);        
      }
      return testPriceBookEntries;
    }
    
    //This method returns the list of Opportunity line items.
    public static List<OpportunityLineItem> createOpportunityLineItem(Integer recordCount,Id opportunityIdParam,Id priceBookEntryIdParam,Double quantityParam,Decimal unitPriceParam){
    List<OpportunityLineItem> testOpportunityLineItems=new List<OpportunityLineItem>();
    for(Integer counter=0;counter<recordCount;counter++){
      OpportunityLineItem objLineItem=new OpportunityLineItem();
      objLineItem.OpportunityId=opportunityIdParam;
      objLineItem.PricebookEntryId=priceBookEntryIdParam;
      objLineItem.Quantity=quantityParam;
      objLineItem.UnitPrice=unitPriceParam;
      testOpportunityLineItems.add(objLineItem);      
    }   
    return testOpportunityLineItems;   
    }
    
    
    
    
    //This method returns the list of vision opportunity object records.
    public static List<Vision_Opportunity__c> createVisionOpportunity(Integer recordCount,Id customerId,String visionName){
      List<Vision_Opportunity__c> testVisionOpportunities=new List<Vision_Opportunity__c>();
      for(Integer counter=0;counter<recordCount;counter++){
        Vision_Opportunity__c objVisionOpportunity=new Vision_Opportunity__c();
    //    objVisionOpportunity.Amount__c=amountParam;
    //    objVisionOpportunity.Close_Date__c=closingDate;
        objVisionOpportunity.Customer_Id__c=customerId;
    //    objVisionOpportunity.Stage_Name__c=stage;
        objVisionOpportunity.Name  =visionName+counter;
        testVisionOpportunities.add(objVisionOpportunity);
      }
      return testVisionOpportunities;
    }
  
    
    //This method returns the list of account records.
    public static List<Account> createAccount(Integer recordCount,String accName){
      List<Account> testAccounts=new List<Account>();
      for(Integer counter=0;counter<recordCount;counter++){
        Account objAccount=new Account();
        objAccount.Name=accName;
        testAccounts.add(objAccount);
      }
      return testAccounts;
    }
    
    //This method returns the list of contact records.
    public static List<Contact> createContact(Integer recordCount,String contactFirstName,String contactLastName){
    List<Contact> testContacts=new List<Contact>();
    for(Integer counter=0;counter<recordCount;counter++){
      Contact objContact=new Contact();
      objContact.FirstName=contactFirstName;
      objContact.LastName=contactLastName;
      testContacts.add(objContact);
    }      
    return testContacts;
    }
}