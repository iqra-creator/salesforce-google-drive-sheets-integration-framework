/**
 * Author: Iqra Masood
 * Description: Reads data from Google Sheets
 */
public with sharing class GoogleSheetService {

    public static List<List<Object>> fetchSheetData(String sheetId, String range) {

        String token = GoogleAuthService.getAccessToken();

        HttpRequest req = new HttpRequest();
        req.setEndpoint(
            'https://sheets.googleapis.com/v4/spreadsheets/' +
            sheetId + '/values/' + range
        );
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + token);

        HttpResponse res = new Http().send(req);

        Map<String, Object> response =
            (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

        return (List<List<Object>>) response.get('values');
    }
}
