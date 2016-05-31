public with sharing class CustomSettingsListcontroller {

    public String getCitiesSelectList() {
        return null;
    }


    public String countriesSelectList { get; set; }


public String City { get; set; }
public String Country{ get; set;}

Map<String, Country__c> c = Country__c.getall();
Map<String, City__c> c1 = City__c.getall();

  public list<selectoption> getCityList() {
    
    list<selectoption> options= new list<selectoption> ();
     Map<String, City__c> allcities = City__c.getAll();

        
     Map<String, City__c> Cities = new Map<String, City__c>();
            for(City__c s : allCities.values()) {
                if (s.Country__c == this.country) {

                    Cities.put(s.name, s);
                }
            }
            // Sort the Cities based on their names
            List<String> CNames = new List<String>();
            CNames.addAll(Cities.keySet());
            CNames.sort();
             

            // If no Cities are found, just say not required in the dropdown.
            if (options.size() > 0) {
                options.add(0, new SelectOption('', '-- Select One --'));
            } else {
                options.add(new SelectOption('', 'Not Required'));
            }
            return options;
        } 
       
       public List<SelectOption> getCountrylist() {
        
        List<SelectOption> country = new List<SelectOption>();
        Country.add(new selectoption('India','---SELECT ONE---'));
        list<string> countryname= new list<string>();
        countryname.addall(c.keyset());

        for(string s : countryname){
            country.add(new selectoption(s,s));
                 }
            return Country;
        }


}