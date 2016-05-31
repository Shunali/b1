@isTest
public class AccountControllerTest {   // Test Class

       

 @isTest
static void testAccountControllerTest() {   // test class method 1
        
       
        account accountObj = new account(Name='ankan',Website='www.baniya.com',type='Prospect');
        insert accountObj ;
        system.debug('-->'+accountObj );
        Id Pageid =accountObj .id;
        
        PageReference pageRef = Page.ManageAccount; // Adding VF page Name here
        pageRef.getParameters().put('id',Pageid );//for page reference
        Test.setCurrentPage(pageRef);
        
        ApexPages.StandardController sc = new ApexPages.standardController(accountObj );   // constructor of standard controller
        AccountController obj = new AccountController(sc);             
        String nextPage=obj.save().getUrl();
        system.assertequals('https://ap2.salesforce.com/apex/accountPage3?id='+Pageid,nextPage);
 
    }
    

}