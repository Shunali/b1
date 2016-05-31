public class AnimalLocator {


public static String getAnimalNameById(Integer Id)
{
	String animal;
Http http=new Http();
HttpRequest request= new HttpRequest();
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+Id);
request.setMethod('GET');
HttpResponse response = http.send(request);
//Map<String, Object> animal= new Map<String, Object>();

            if (response.getStatusCode() == 200) {
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
      animal = (String)results.get('animal');
        }
return animal;
    
}
}