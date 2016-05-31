/*
*Controller for search History and its related records 
*
* Functionality :
* 1)Shows the related List of records.
*   
* 2) Data loading while searching the related list result
*   
* 3)  Pagination in the list
*
* Revision History: 
*
* Version          Author                   Date                  Description 
*  1.7        Shunali Singh Mehra        4/25/2016               Initial Draft
*
*/


public class GoobleVFPageController {

    

    private integer totalRecs = 0;
    private integer OffsetSize = 0;
    private integer LimitSize= 5;
    public string recid{get;set;}
    public Boolean prev{get; set;}
    public Boolean nxt{get; set;}
    public boolean var{get; set;}
    Public CustomEmailObj__c A;
    public List<DetailRecord__c> DeRecords {get; set;}
    public list<CustomEmailObj__c> Cuslst { get; set; }
    
    public GoobleVFPageController(){   // Controller Contructor 
       Cuslst= [select Id,BodyTxt__c from CustomEmailObj__c ];
       prev=true;
    }

    public void RelatedLinks() {
   
    var=true;
    totalRecs =[select count() from DetailRecord__c where RelatedLink__c=:recid ];
    DeRecords =[select Title__c, Link__c, Snippet__c from DetailRecord__c where RelatedLink__c=:recid LIMIT :LimitSize OFFSET :OffsetSize];
   
    }
    public void History() {
     var=true;  
    }


    public void FirstPage()
    {
        OffsetSize = 0;
        nxt=false;
        prev=true;
        RelatedLinks();
    }
    
    public void previous(){
        OffsetSize = OffsetSize - LimitSize;
        try{
        if(OffsetSize==0){
            prev=true;
            nxt=false;
            RelatedLinks();
        }
        }catch(exception e)
        {
            
            system.debug('$$$$');
        }
        
        
    }
    
    public void next(){
        OffsetSize = OffsetSize + LimitSize;
        prev=false;
        RelatedLinks();
    }
    
    public void LastPage() {
        nxt=true;
        prev=false;
        OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
        RelatedLinks();
    }
    public void getprev(){
    }
    
    public void getnxt(){
    }
}