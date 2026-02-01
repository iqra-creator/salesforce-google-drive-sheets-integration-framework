
```mermaid
flowchart TD
    A[Lightning UI / Flow] --> B[GoogleIntegrationController]
    B --> C[GoogleAuthService]
    B --> D[GoogleDriveService]
    B --> E[GoogleSheetService]

    C --> F[Google OAuth 2.0]
    D --> G[Google Drive API]
    E --> H[Google Sheets API]
