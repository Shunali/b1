/*
*Schedular for the batch class to send email  
*
* Functionality :
* 1)Through Cron Expression schedule the email response back result to
the user on daily basis

* Revision History: 
*
* Version          Author                   Date                  Description 
*  1.0        Shunali Singh Mehra        4/26/2016               Initial Draft
*
*/



global class EmailResponseSchedular implements Schedulable{

    public static String cronExpression ='0 8 19 * * * *';      // Defining the cron expression
   /* global static String scheduleMe() {
        
        EmailResponseSchedular SC = new EmailResponseSchedular(); 
        return System.schedule('My batch Job', cronExpression, SC);
    }*/

    global void execute(SchedulableContext sc) {        // schedular method

        emailResponseBatch b1 = new emailResponseBatch();
        ID batchprocessid = Database.executeBatch(b1,50);           
    }
}