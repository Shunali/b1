/*
*Mock test class for webservice. 
*
* Functionality :
* 1)It will create fake response for the web service class whenever 
testing perform on the test class
*   
* 2)Need to setbody by the dummy json
*   
* Revision History: 
*
* Version          Author                   Date                  Description 
*  1.7        Shunali Singh Mehra        4/27/2016               Initial Draft
*
*/


@isTest
global class MockHttpResponseGeneratorResponse implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('https://www.googleapis.com/customsearch/v1?key=AIzaSyCsXS7g_w2eAOOJ7BktWj2HYroPLzq8JgA&cx=014551880959506527055:zwpq_gfwsoa&q=Google', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"kind": "customsearch#search",'+
                         '"url": {'+
                          '"type": "application/json",'+
                         '"template": "https://www.googleapis.com/customsearch/v1?q={searchTerms}&num={count?}&start={startIndex?}&lr={language?}&safe={safe?}&cx={cx?}&cref={cref?}&sort={sort?}&filter={filter?}&gl={gl?}&cr={cr?}&googlehost={googleHost?}&c2coff={disableCnTwTranslation?}&hq={hq?}&hl={hl?}&siteSearch={siteSearch?}&siteSearchFilter={siteSearchFilter?}&exactTerms={exactTerms?}&excludeTerms={excludeTerms?}&linkSite={linkSite?}&orTerms={orTerms?}&relatedSite={relatedSite?}&dateRestrict={dateRestrict?}&lowRange={lowRange?}&highRange={highRange?}&searchType={searchType}&fileType={fileType?}&rights={rights?}&imgSize={imgSize?}&imgType={imgType?}&imgColorType={imgColorType?}&imgDominantColor={imgDominantColor?}&alt=json"'+
                        ' },'+
                         '"queries": {'+
                         ' "nextPage": ['+
                          ' {'+
                           ' "title": "Google Custom Search - google",'+
                           ' "totalResults": "802000000",'+
                            '"searchTerms": "google",'+
                            '"count": 10,'+
                            '"startIndex": 11,'+
                            '"inputEncoding": "utf8",'+
                            '"outputEncoding": "utf8",'+
                            '"safe": "off",'+
                            '"cx": "014551880959506527055:zwpq_gfwsoa"'+
                           '}'+
                          '],'+
                          '"request": ['+
                          '{'+
                            '"title": "Google Custom Search - google",'+
                            '"totalResults": "802000000",'+
                            '"searchTerms": "google",'+
                            '"count": 10,'+
                            '"startIndex": 1,'+
                            '"inputEncoding": "utf8",'+
                            '"outputEncoding": "utf8",'+
                            '"safe": "off",'+
                            '"cx": "014551880959506527055:zwpq_gfwsoa"'+
                           '}'+
                          ']'+
                         '},'+
                         '"context": {'+
                          '"title": "Ap2.salesforce"'+
                         '},'+
                         '"searchInformation": {'+
                          '"searchTime": 0.355041,'+
                          '"formattedSearchTime": "0.36",'+
                          '"totalResults": "802000000",'+
                          '"formattedTotalResults": "802,000,000"'+
                         '},'+
                        ' "items": ['+
                          '{'+
                           '"kind": "customsearch#result",'+
                           '"title": "Google",'+
                           '"htmlTitle": "\\u003cb\\u003eGoogle\\u003c/b\\u003e",'+
                           '"link": "https://www.google.com/",'+
                           '"displayLink": "www.google.com",'+
                           '"snippet": "Search the worlds information, including webpages, images, videos and more. \\nGoogle has many special features to help you find exactly what youre looking ...",'+
                           '"htmlSnippet": "Search the world&#39;s information, including webpages, images, videos and more. \\u003cbr\\u003e\\n\\u003cb\\u003eGoogle\\u003c/b\\u003e has many special features to help you find exactly what you&#39;re looking&nbsp;...",'+
                           '"cacheId": "y14FcUQOGl4J",'+
                           '"formattedUrl": "https://www.google.com/",'+
                           '"htmlFormattedUrl": "https://www.\\u003cb\\u003egoogle\\u003c/b\\u003e.com/",'+
                           '"pagemap": {'+
                            '"cse_image": ['+
                             '{'+
                              '"src": "http://www.google.com/logos/doodles/2016/earth-day-2016-5741289212477440.4-thp.png"'+
                             '}'+
                            '],'+
                            '"cse_thumbnail": ['+
                             '{'+
                              '"width": "401",'+
                              '"height": "126",'+
                              '"src": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfWAQgXTEktXPEiIvuLG8EtqBqbQu19x5QVYlo6AoZ9QEuyOnD5g-WoQ"'+
                             '}'+
                            '],'+
                            '"webpage": ['+
                             '{'+
                              '"image": "/logos/doodles/2016/earth-day-2016-5741289212477440.2-5643440998055936-ror.jpg"'+
                             '}'+
                            '],'+
                            '"metatags": ['+
                             '{'+
                              '"og:description": "Happy Earth Day! #GoogleDoodle",'+
                              '"og:image": "http://www.google.com/logos/doodles/2016/earth-day-2016-5741289212477440.4-thp.png",'+
                             ' "og:image:width": "700",'+
                             ' "og:image:height": "220"'+
                             '}'+
                            ']'+
                           '}'+
                          '}'+
                         ']'+
                        '}');
        res.setStatusCode(200);
        return res;
    }
}