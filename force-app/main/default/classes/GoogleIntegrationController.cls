/**
 * Author: Iqra Masood
 *
 * Description:
 * Central controller class that exposes Google Drive and Google Sheets
 * integration methods to Lightning (Aura / LWC).
 *
 * This controller does NOT handle authentication or API logic directly.
 * It delegates responsibilities to dedicated service classes to ensure:
 *  - Clean architecture
 *  - Testability
 *  - Easy maintenance
 *
 * Used By:
 *  - Lightning Components
 *  - Admin utilities
 *  - Future automation (Flows / Batch jobs)
 */

public with sharing class GoogleIntegrationController {

    /**
     * Fetch Google Drive files (Owned + Shared)
     *
     * @return List of files with metadata (Id, Name, MimeType)
     */
    @AuraEnabled(cacheable=true)
    public static List<GoogleDriveFileDTO> getDriveFiles() {

        List<Map<String, Object>> rawFiles =
            GoogleDriveService.fetchFiles();

        List<GoogleDriveFileDTO> result = new List<GoogleDriveFileDTO>();

        for (Map<String, Object> file : rawFiles) {
            result.add(new GoogleDriveFileDTO(
                (String) file.get('id'),
                (String) file.get('name'),
                (String) file.get('mimeType')
            ));
        }

        return result;
    }

    /**
     * Fetch data from a Google Sheet
     *
     * @param sheetId Google Spreadsheet Id
     * @param range   Sheet range (e.g. Sheet1!A1:D20)
     * @return Tabular data from Google Sheet
     */
    @AuraEnabled
    public static List<List<Object>> getSheetData(String sheetId, String range) {

        if (String.isBlank(sheetId) || String.isBlank(range)) {
            throw new AuraHandledException('Sheet Id and range are required.');
        }

        return GoogleSheetService.fetchSheetData(sheetId, range);
    }

    /**
     * Data Transfer Object (DTO) for Google Drive Files
     * Keeps UI clean and avoids exposing raw API responses
     */
    public class GoogleDriveFileDTO {

        @AuraEnabled public String fileId;
        @AuraEnabled public String fileName;
        @AuraEnabled public String mimeType;

        public GoogleDriveFileDTO(String fileId, String fileName, String mimeType) {
            this.fileId   = fileId;
            this.fileName = fileName;
            this.mimeType = mimeType;
        }
    }
}
