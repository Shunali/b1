/*
*Trigger for CustomEmailObj  
*
* Functionality :
* 1)It will run on after insert of Custom Email.
* 
* 2)On insert of Custom Email.Take the body from the 
*   object and append to the google api url and then parse the json response.
*
*
* Revision History: 
*
* Version          Author                   Date                  Description 
*  1.0        Shunali Singh Mehra        4/20/2016               Initial Draft
*
*/

trigger searchResult on CustomEmailObj__c (after insert) {
	
	   for(CustomEmailObj__c cusObj:trigger.new){
   
          if(cusObj.BodyTxt__c != null){      // check body should not be null
		       List<id>lstId=new List<id>();
		       lstId.add(cusObj.Id);
		       calloutWeb.webinfo(lstId);   // passing CustomObjectID to callout Service
          }
        }
}