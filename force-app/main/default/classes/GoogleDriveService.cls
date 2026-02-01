/**
 * Author: Iqra Masood
 * Description: Fetches Google Drive owned and shared files
 */
public with sharing class GoogleDriveService {

    public static List<Map<String, Object>> fetchFiles() {

        String token = GoogleAuthService.getAccessToken();

        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://www.googleapis.com/drive/v3/files?q=trashed=false');
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + token);

        HttpResponse res = new Http().send(req);

        Map<String, Object> data =
            (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

        return (List<Map<String, Object>>) data.get('files');
    }
}
