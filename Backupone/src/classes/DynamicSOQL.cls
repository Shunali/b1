public class DynamicSOQL{

    public String getSelectedObjects() {
        return null;
    }


    public String getFields1() {
        return null;
    }


    public String getOdata() {
        return null;
    }

 
        public list<SelectOption> objects{set; get ;}
        public List<String>objlist {set; get;}
        public map<String,Schema.SObjectType>mapObj{set; get;}
        public Map<String,Schema.SobjectField> MapField;
        public List<SelectOption>fsoptions{set; get;}
        public List<SelectOption>fnsoptions{set; get;}
        public list<String>fields{set; get;}
        public set<String>fnotSelected{set; get;}
        public set<String>fSelected{set; get;}
        public String selectedobj {set; get;}
        public String objDescription{set; get ;}
        public list<String>sfields{set; get;}
        public list<String>rfields{set; get;}
        public  String query {set; get;}
        public List<Sobject> Odata;
        public List<String> Fields1;
        
        public DynamicSOQL(){
        
            Fields1= new List<String>();
            Odata= new List<Sobject>();
            objects=new List<SelectOption>();
            objlist=new List<String>();
            fields=new List<String>();
            sfields=new List<String>();
            rfields=new List<String>();
            fSelected=new Set<String>();
            fnotSelected=new Set<String>();
            fsoptions= new List<SelectOption>();
            fnsoptions= new List<SelectOption>();
            mapObj=Schema.getGlobalDescribe();
            objlist.addAll(mapObj.keyset());
            objlist.sort();
            SelectOption p = new SelectOption('None', '--NONE--');
            objects.add(p);
            for(String s : objlist)
            {
            SelectOption op = new SelectOption(s,s);
            objects.add(op);
            }
        }
        
        public void getDetails(){
        
            Schema.DescribeSObjectResult Mobj= mapObj.get(selectedobj).getDescribe();
            objDescription = ''+ Mobj;
            MapField=mapObj.get(selectedobj).getDescribe().fields.getMap();
            fields.addAll(MapField.keyset());
            fields.sort();
            fnotselected.addAll(fields);
            show();
        }
        
        public void show(){
        
            fsoptions.clear();
            fnsoptions.clear();
            for(String s:fnotselected) {
                SelectOption op = new SelectOption(s,s);
                fnsoptions.add(op);
            }
            
            for(String s1:fSelected) {
                SelectOption op1 = new SelectOption(s1,s1);
                fsoptions.add(op1);
            }
        
        }
        
         public void AddFields()
         {
              fnotSelected.removeAll(sfields);
              fSelected.addAll(sfields);
              show();
         }
         
         public void RemoveFields()
         {
             fnotSelected.addAll(rfields);
             fSelected.removeAll(rfields);
             show();
         }
         
         public void QueryData()
         {
             query='Select id';
             Fields1.addAll(fSelected);
             for(String s: fSelected)
             {
             query=query +' ,'+s;
             }
             query=query+' from '+ selectedobj;
             Odata=Database.query(query);
         }
          
        
}