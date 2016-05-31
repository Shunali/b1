public class StudentRegistrationPageExtension{
    private ApexPages.StandardController sc;
    public String languageCode {get;set;}
    public Boolean messageRender {get;set;}
        
    public StudentRegistrationPageExtension(ApexPages.StandardController sc){
        this.sc=sc;
        messageRender=false;
    }
    
    public List<SelectOption> getLanguageList(){
        List<SelectOption> languagePickValue=new List<SelectOption>();
        Map<String,Language__c> LanguageCustomSettingMap=Language__c.getAll();
        system.debug(LanguageCustomSettingMap);
        List<String> LanguageList=new List<String>();
        LanguageList.addAll(LanguageCustomSettingMap.keySet());
         system.debug(LanguageCustomSettingMap);
        LanguageList.sort();
        for(String LanguageName: LanguageList){
           languagePickValue.add(new SelectOption(LanguageCustomSettingMap.get(LanguageName).Language_Code__c,LanguageName)); 
        }
         system.debug(languagePickValue);
        return languagePickValue; 
    }
    
    
}