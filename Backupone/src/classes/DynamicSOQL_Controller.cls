public class DynamicSOQL_Controller
{

    
    public String getVar() {
        return null;
    }


    public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    public boolean var {get; set;}
   // public String ObjectFields{get; set;}
  //  public String SelectedRecordNumbers{get; set;}
    public String selectedObject {get; set;}
    public String selectedField {get; set;}
    public String RecordNumber {get; set;}
   // public Boolean viewSection;
    public String QueryString {get; set;}
    String sorts=null;
     String country = null;
     
    Public DynamicSOQL_Controller()
    {   
        selectedObject = 'None';
       var= false;
        
    }
           public String getSorts() {
        return sorts;
    }
      public void setSorts(String sorts) { this.sorts = sorts; }    
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('Ascending','Ascending')); 
        options.add(new SelectOption('Descending','Descending')); 
        return options; 
    }
                   
   
  public PageReference Execute() {
  var=true;
        return null;
    }


    public String getDebugSoql() {
       return QueryString+ ' order by ' + ' ' + sorts  ; 
     
       
    }
    public List<SelectOption> getObjectNames() 
    {
        List<SelectOption> objNames = new List<SelectOption>();
        List<String> entities = new List<String>(schemaMap.keySet());
        entities.sort();
        objNames.add(new SelectOption('','--------Select--------'));
        for(String name : entities)
        {
            objNames.add(new SelectOption(name,name));
        }
        return objNames;
     }

     public List<SelectOption> getObjectFields() 
     {
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
            List<SelectOption> fieldNames = new List<SelectOption>();
            for (String fieldName: fieldMap.keySet()) 
            {  
                fieldNames.add(new SelectOption(fieldName,fieldName));
            }
            system.debug('33333'+fieldNames);
            return fieldNames;
      }  
      
      
     public List<SelectOption> getSelectedRecordNumbers() 
    {
        List<SelectOption> RecordNumber = new List<SelectOption>();
        
            RecordNumber .add(new SelectOption('500','500'));
            RecordNumber .add(new SelectOption('1000','1000'));
            RecordNumber .add(new SelectOption('5000','5000'));
            RecordNumber .add(new SelectOption('50000','50000'));
        system.debug('33333'+RecordNumber );
        return RecordNumber;
     }

 
       public String getgenerateQueryString()
       {   
         QueryString= 'Select ' + selectedField + ' From ' +selectedObject;
         return QueryString;
       }
}