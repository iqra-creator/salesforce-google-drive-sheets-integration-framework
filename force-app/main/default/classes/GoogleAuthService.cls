/**
 * Author: Iqra Masood
 * Description: Handles OAuth token retrieval for Google APIs
 */
public with sharing class GoogleAuthService {

    public static String getAccessToken() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Google_OAuth_Named_Credential');
        req.setMethod('POST');

        Http http = new Http();
        HttpResponse res = http.send(req);

        Map<String, Object> tokenData =
            (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

        return (String) tokenData.get('access_token');
    }
}
