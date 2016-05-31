public class CountryStatePicker {


// Variables to store country and state selected by user
    public String city { get; set; }
    public String country {get; set;}  

    public String getCountry() {
        return null;
    }
    
    public List<SelectOption> getCountriesSelectList() {
        List<SelectOption> country = new List<SelectOption>();
        country.add(new selectoption('India','---SELECT ONE---'));
        Map<String, Country__c> c = Country__c.getAll();  
        list<string> countryname= new list<string>();
        countryname.addall(c.keyset());
   System.debug('3333'+countryname);
        for(string s : countryname){
        country.add(new selectoption(s,s));

            }

            return country;

}

  // To generate the states picklist based on the country selected by user.
    public List<SelectOption> getCitiesSelectList() {
        List<SelectOption> options = new List<SelectOption>();
        
        Map<String, City__c> allCities = City__c.getAll();
        System.debug('3333'+allCities );
        // Filter states that belong to the selected country
        Map<String, City__c> Cities = new Map<String, City__c>();
       
        for(City__c City : allCities.values()) {
            if (City.Country__c == this.Country) {
                Cities.put(City.name, City);
            }
                System.debug('3333'+Cities ); 
        }
        
        // Sort the states based on their names
        List<String> CityNames = new List<String>();
        CityNames.addAll(Cities.keySet());
        CityNames.sort();
        System.debug('3333'+CityNames);
       
         
       // Generate the Select Options based on the final sorted list
        for (String CityName: CityNames) {
                  City__c City = Cities.get(CityName);
                  
                options.add(new SelectOption(City.Name, City.Name));
            //City.add(0,new SelectOption(C,C));
                 System.debug('3333'+City); }
        
        // If no states are found, just say not required in the dropdown.
        if (options.size() > 0) {
            options.add(0, new SelectOption('', '-- Select One --'));
        } else {
            options.add(new SelectOption('', 'Not Required'));
        }
        return options;
    }
 
}