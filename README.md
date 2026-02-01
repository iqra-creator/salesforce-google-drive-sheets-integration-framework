# Google Drive & Sheets Integration Framework

A secure and scalable Salesforce integration with Google Drive and Google Sheets using OAuth 2.0 and Apex callouts.  
This framework enables Salesforce users to fetch both owned and shared Google Drive files and read Google Sheets data directly inside Salesforce.

## Key Features

- OAuth 2.0 authentication using Salesforce Named Credentials
- Fetch Google Drive files (Owned + Shared)
- Read Google Sheets data by range
- Clean service-based Apex architecture
- Lightning-ready (Aura / LWC compatible)
- Secure, extensible, and production-oriented design

## Use Cases

- Sync Google Drive documents into Salesforce records
- Read Google Sheets for reporting or automation
- Admin utilities for file visibility
- Data ingestion pipelines from Google Sheets
- CRM enrichment with external documents

## Authentication Setup (Required)

1. Create a Google Cloud Project
2. Enable:
   - Google Drive API
   - Google Sheets API
3. Configure OAuth 2.0 credentials
4. Create a **Named Credential** in Salesforce:
   - Type: OAuth 2.0
   - Auth Provider: Google
   - Scope:
     ```
     https://www.googleapis.com/auth/drive.readonly
     https://www.googleapis.com/auth/spreadsheets.readonly

## Author
Iqra Masood - Salesforce Administrator & Developer


