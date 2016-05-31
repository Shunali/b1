/*
* calloutWeb used to call web services to pass query to google search engine.
by sending the url with google API key and Custom Search Engine Key and getting 
response back in JSon format. 
* 
* Functionality :
* 1)Deserialized the JSon Format response.
* 
* 2)Extracting out the required Link, Title and Snippet from that JSon response
received from there. 
*
* 3)Once the required Output is extracted out create record in DetailRecord Object 
*
* Version         Author                  Date                Description 
*  36.0        Shunali Singh Mehra       4/21/2016            Initial Draft
*
*/


public class calloutWeb {
	   @future (callout=true)       // Handle through future handler
	   public static void webinfo(List<Id>QueryID) {
	       String ID ;
	       String Body;
	       String url = 'https://www.googleapis.com/customsearch/v1?key=AIzaSyCsXS7g_w2eAOOJ7BktWj2HYroPLzq8JgA&cx=014551880959506527055:zwpq_gfwsoa&q=';
	       List<Object> Title = new List<Object>();   
	       List<Object> Link = new List<Object>(); 
	       List<Object> Snippet = new List<Object>(); 
	       List<CustomEmailObj__c> CusEmail=new List<CustomEmailObj__c>([SELECT id, BodyTxt__c,SubjectTxt__c
	                                                                     FROM CustomEmailObj__c
	                                                                     where id IN:QueryID]);
	       List<DetailRecord__c> detailRec = new List<DetailRecord__c>();
	       
	       for(CustomEmailObj__c C : CusEmail){    //Iterating the CustomEmailObj list
		      	Body=C.BodyTxt__c;   
	            ID=C.Id;
	            String Bodyurl = body.replace(' ','+');
	            url += Bodyurl;    
                //String encoded = EncodingUtil.urlEncode(url, 'UTF-8');
	            // Building the callout Process
	    
			    Http h = new Http();
				HttpRequest req = new HttpRequest();
				req.setEndpoint(url);
				req.setMethod('GET');
				req.setHeader('charset','UTF8');
				req.setHeader('Content-Type', 'application/json');
				req.setHeader('accept','application/json');
		        HttpResponse res = h.send(req);
		        String JsonString =res.getBody();  
				Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());   
				List<Object> itemList = (List<Object>)results.get('items');
				Object[] aryItems = (Object[]) results.get('items');
		        if(!aryItems.isEmpty()) {
					for (Object item : aryItems) {Map<String, Object> itemAttributes = (Map<String, Object>)item;
			                      
			                 for (String attributeName : itemAttributes.keyset()) { 
			                 	
			                    if(attributeName == 'title')
			                    {  
			                        Title.add(itemAttributes.get(attributeName));
			                    }
			                    
			                    if(attributeName == 'link')
			                    {
			                        Link.add(itemAttributes.get(attributeName));
			                    }
			                     if(attributeName == 'snippet')
			                    {
			                        Snippet.add(itemAttributes.get(attributeName));
			                    }
			                    
			                 }
			     		}
			   
			         for(Integer i=0; i<Title.size();i++){    // Creatibg the records according to number of response
						   DetailRecord__c deRec= new DetailRecord__c();
						   deRec.Title__c=String.ValueOf(Title.get(i));
						   deRec.Link__c=String.ValueOf(Link.get(i));
						   deRec.Snippet__c=String.ValueOf(Snippet.get(i));
						   deRec.RelatedLink__c=ID;   // master detail relationship with customObject
						   detailRec.add(deRec);
			         }
			         insert detailRec;
	           }
	   }
    }
}