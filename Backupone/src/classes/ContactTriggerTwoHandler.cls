public with sharing class ContactTriggerTwoHandler {

  public void onBeforeUpdate(){   
      
  /*     list<contact> conlist1= new list<contact>();
      for (Contact p1 :(List<Contact>)trigger.old){
         conlist1.add(p1);    
        }  
      update conlist1;
    System.debug('Trigger Two old:'+conlist1);
     }//end of onBeforeUpdate Method */
    
        list<contact> conlist2= new list<contact>();
      for (Contact p2 :(List<Contact>)trigger.new){
         conlist2.add(p2);    
        }  
      //update conlist2;
    System.debug('Trigger Two update new:'+conlist2);
     }//end of onBeforeUpdate Method   
}