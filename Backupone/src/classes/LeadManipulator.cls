@RestResource(urlMapping='/Lead/*')
global with sharing class LeadManipulator{

    //inserting Lead Record 
    @HttpPost
    global static String doPost(String firstName, String lastName, String email, String phone, String company) {
        RestRequest objRestReq = RestContext.request;
        RestResponse objRestRes = RestContext.response;
        LWrapper objRes = new LWrapper();
        
        if (!String.isEmpty(firstName) && !String.isEmpty(lastName) && !String.isEmpty(email) && !String.isEmpty(phone)) {
            List<Lead> listLead = new List<Lead>();
            Lead objLead = new Lead();
            objLead.FirstName = firstName;
            objLead.LastName = lastName;
            objLead.Email = email;
            objLead.Phone = phone;
            objLead.Company = company;
            listLead.add(objLead);
        
            try{
                insert listLead;
            }
            catch(exception e){
                objRes.isSuccess = False;
                objRes.status = e.getMessage();
                objRes.idLead = null;
                 string str = JSON.serialize(objRes);
                return str;
            }
            
            objRes.isSuccess = True;
            objRes.status = 'Success';
            objRes.idLead = listLead.get(0).Id;
            string str = JSON.serialize(objRes);
            return str;
        }
        else {
            objRes.isSuccess = False;
            objRes.status = 'Error : You must provide a FirstName, LastName, Email and Phone for your Insert.';
            string str = JSON.serialize(objRes);
            return str;
        }
    }

    // Updating Lead Record 
    @HttpPatch
    global static String doPatch(String firstName, String lastName, String email, String phone) {
        RestRequest objRestReq = RestContext.request;
        RestResponse objRestRes = RestContext.response;
        String ID = objRestReq.params.get('Id');
        LWrapper objRes = new LWrapper();        
       
        if (!String.isEmpty(firstName) && !String.isEmpty(lastName) && !String.isEmpty(email) && !String.isEmpty(phone)) {
            List<Lead> listLead = new List<Lead>();
            
            listLead = [
                SELECT Id, Email, 
                Phone, FirstName, 
                LastName 
                FROM Lead 
                WHERE FirstName = :firstName 
                AND LastName = :lastName AND Id=:ID 
            ];
           system.debug(listLead );
            if(listLead.isEmpty())
            {                     // to Catch Exception if no Records Found
                objRes.isSuccess = False;
                objRes.status = 'List has no rows for assignment to SObject';
                objRes.idLead = null;
                 string str = JSON.serialize(objRes);
                return str;
            }
            else {
                listLead.get(0).Email = email;
                listLead.get(0).Phone = phone;
                system.debug(listLead.get(0).Email);
            }
            
            try{
              //delete listLead.get(1);
                update listLead;
            }
            catch(exception e){                   
                objRes.isSuccess = False;
                objRes.status = e.getMessage();
                objRes.idLead = listLead.get(0).Id;
                 string str = JSON.serialize(objRes);
                return str;
            }
            objRes.isSuccess = True;
            objRes.status = 'Success';
            objRes.idLead = listLead.get(0).Id;
            string str = JSON.serialize(objRes);
            return str;
        }
        else {                                         
            objRes.isSuccess = False;
            objRes.status = 'Error : You must provide a FirstName, LastName, Email and Phone for your Update.';
             string str = JSON.serialize(objRes);
                return str;
        }
        
    }

    // Deleting Lead Record 
    @HttpDelete
    global static String doDelete() {
        RestRequest objRestReq = RestContext.request;
        RestResponse objRestRes = RestContext.response;
        String firstName = objRestReq.params.get('FirstName');
        String lastName = objRestReq.params.get('LastName');
        String email = objRestReq.params.get('Email');
        String phone = objRestReq.params.get('Phone');
        LWrapper objRes = new LWrapper();
        if(!String.isEmpty(firstName) && !String.isEmpty(lastName) && !String.isEmpty(email) && !String.isEmpty(phone)) {

            List<Lead> listLead = new List<Lead>();
            
            listLead = [SELECT Id, FirstName, LastName FROM Lead WHERE FirstName = :firstName AND LastName = :lastName AND Email = :email AND Phone = :phone LIMIT 1];
            if(listLead.isEmpty())
            {
                objRes.isSuccess = False;
                objRes.status = 'ERROR : RECORD_NOT_FOUND'; 
                string str = JSON.serialize(objRes);
                return str;
            }
            else
            {
                objRes.isSuccess = True;
                objRes.status = 'Success';
                objRes.idLead = FirstName + ' ' + LastName;
                delete listLead; 
            }
            string str = JSON.serialize(objRes);
            return str;
        }
        else {                                     
            objRes.isSuccess = False;
            objRes.status = 'Error : You must provide a FirstName, LastName, Email and Phone for your Delete.';
            string str = JSON.serialize(objRes);
                return str;
        }
        
    }

    // Wrapper Class For Response Purpose
    global class LWrapper {
        public String status;
        public Boolean isSuccess;
        public String idLead;
    }
}