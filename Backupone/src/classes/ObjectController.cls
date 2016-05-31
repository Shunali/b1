Public with sharing class ObjectController{

    public String getSelectedObject() {
        return null;
    }


 Public List<Opportunity> optyList {get;set;}
 Public List<contact> conList{get;set;}
 Public List<account> accList{get;set;}
 Public List<Lead>LeadList {get; set;}
 Public String searchStr{get;set;}
   Public ObjectController(){
   system.debug('22334' );

   }

  Public void ObjectController_method(){
 
 system.debug('@@@22334' );
  optyList = New List<Opportunity>();
  conList = New List<contact>();
  accList = New List<account>();
  LeadList= New List<Lead>();
  
   if(searchStr.length() > 1){
    
    system.debug('-->'+searchStr );
     String searchStr1 = '*'+searchStr+'*';
         system.debug('-->$$$$'+searchStr1 );
     String searchQuery = 'FIND \'' + searchStr1 + '\' IN ALL FIELDS RETURNING  Account (Id,Name,Website,type),Contact(FirstName,LastName,email),Opportunity(name,StageName),Lead(FirstName,LastName,Company)';

    List<List <sObject>> searchList = search.query(searchQuery);

    accList = ((List<Account>)searchList[0]);

    conList = ((List<contact>)searchList[1]);

    optyList = ((List<Opportunity>)searchList[2]);
    system.debug('@@@'+optyList );
    LeadList= ((List<Lead>)searchList[3]);
 
   if(accList.size() == 0 && conList.size() == 0 && optyList.size() == 0 && LeadList.size()==0){

        ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'No results found');
                ApexPages.addMessage(msg); 
     

   }

   }

   else{

       ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'enter atleast 2 characters');
                ApexPages.addMessage(msg); 


   }

  }

}