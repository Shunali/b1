@isTest
public class ObjectControllerTest {   // Test Class

       

 @isTest
static void testObjectControllerTestOne() {   // test class method 1
        
        List<Opportunity> optyList = new list<Opportunity>();
        for(integer i=0; i<10;i++)
        {
        Opportunity opportunityObj = new Opportunity(name='Test'+i,StageName='Qualification', CloseDate=Date.valueOf('2008-04-28'));
        optyList.add(opportunityObj );
        }
        insert optyList;
        system.debug('-->'+optyList);
        
        List<contact> conList= new list<contact>();
         for(integer i=0; i<10;i++)
        {
        contact contactObj = new contact(FirstName='abf'+i,LastName='fc',email='ankan@yahoo.com');
        conList.add(contactObj );
        }
        insert conList;
        system.debug('-->'+conList);
        
        List<account> accList=new list<account>();
          for(integer i=0; i<10;i++)
        {
        account accountObj = new account(Name='ankan'+i,Website='www.baniya.com',type='Prospect');
        accList.add(accountObj );
        }
        insert accList;
        system.debug('-->'+accList );
        
        
        List<Lead>LeadList = new list<Lead>();
          for(integer i=0; i<10;i++)
        {
        Lead LeadObj = new Lead(FirstName='sss'+i,LastName='ankan',Company='tcs');
        LeadList.add(LeadObj );
        }
        insert LeadList ;
        system.debug('-->'+LeadList );


        
        ObjectController obj = new ObjectController();           
        obj.searchStr='ankan';
        obj.ObjectController_method();
        system.assertEquals(10,LeadList.size());
        system.assertEquals(10,accList.size());
        system.assertEquals(10,conList.size());
        system.assertEquals(0,optyList.size());
        
        
        
    }
    
    
@isTest
static void testObjectControllerTestTwo() {   // test class method 2
        
        List<Opportunity> optyList = new list<Opportunity>();
        for(integer i=0; i<10;i++)
        {
        Opportunity opportunityObj = new Opportunity(name='Test'+i,StageName='Qualification', CloseDate=Date.valueOf('2008-04-28'));
        optyList.add(opportunityObj );
        }
        insert optyList;
        system.debug('-->'+optyList);
        
        List<contact> conList= new list<contact>();
         for(integer i=0; i<10;i++)
        {
        contact contactObj = new contact(FirstName='abf'+i,LastName='fc',email='ankan@yahoo.com');
        conList.add(contactObj );
        }
        insert conList;
        system.debug('-->'+conList);
        
        List<account> accList=new list<account>();
          for(integer i=0; i<10;i++)
        {
        account accountObj = new account(Name='ankan'+i,Website='www.baniya.com',type='Prospect');
        accList.add(accountObj );
        }
        insert accList;
        system.debug('-->'+accList );
        
        
        List<Lead>LeadList = new list<Lead>();
          for(integer i=0; i<10;i++)
        {
        Lead LeadObj = new Lead(FirstName='sss'+i,LastName='ankan',Company='tcs');
        LeadList.add(LeadObj );
        }
        insert LeadList ;
        system.debug('-->'+LeadList );


        
        ObjectController obj = new ObjectController();           
        obj.searchStr='a';
        obj.ObjectController_method();
        List<Apexpages.Message> msg = ApexPages.getMessages();
        boolean b = false;
        for(Apexpages.Message msgs:msg){
            if (msgs.getDetail().contains('enter atleast 2 characters'))
                     b = true;
                        }
        system.assert(b);
        
        
        
    }

 @isTest
static void testObjectControllerTestThree() {   // test class method 3
        
        List<Opportunity> optyList = new list<Opportunity>();
        for(integer i=0; i<10;i++)
        {
        Opportunity opportunityObj = new Opportunity(name='Test'+i,StageName='Qualification', CloseDate=Date.valueOf('2008-04-28'));
        optyList.add(opportunityObj );
        }
        insert optyList;
        system.debug('-->'+optyList);
        
        List<contact> conList= new list<contact>();
         for(integer i=0; i<10;i++)
        {
        contact contactObj = new contact(FirstName='abf'+i,LastName='fc',email='ankan@yahoo.com');
        conList.add(contactObj );
        }
        insert conList;
        system.debug('-->'+conList);
        
        List<account> accList=new list<account>();
          for(integer i=0; i<10;i++)
        {
        account accountObj = new account(Name='ankan'+i,Website='www.baniya.com',type='Prospect');
        accList.add(accountObj );
        }
        insert accList;
        system.debug('-->'+accList );
        
        
        List<Lead>LeadList = new list<Lead>();
          for(integer i=0; i<10;i++)
        {
        Lead LeadObj = new Lead(FirstName='sss'+i,LastName='ankan',Company='tcs');
        LeadList.add(LeadObj );
        }
        insert LeadList ;
        system.debug('-->'+LeadList );


        
        ObjectController obj = new ObjectController();           
        obj.searchStr='Sanna';
        obj.ObjectController_method();
        List<Apexpages.Message> msg = ApexPages.getMessages();
        boolean b = false;
        for(Apexpages.Message msgs:msg){
            if (msgs.getDetail().contains('No results found'))
                     b = true;
                        }
        system.assert(b);
        
        
        
    }
    


}