# Email Sample Files

This directory contains sample email files for testing the Parser Module's email parsing capabilities.

## Files Included

### EML Format (.eml)
- **simple_text.eml** - Basic plain text email
- **html_email.eml** - HTML formatted email with markup
- **multipart_email.eml** - Multipart email with text, HTML, and attachment
- **unicode_email.eml** - Email with Unicode characters, emojis, and international text

### MSG Format (.msg)
- **outlook_message.msg** - Microsoft Outlook MSG format email

## Testing Coverage

These samples test:
- Plain text content extraction
- HTML content parsing and cleanup
- Multipart message handling
- Attachment detection
- Unicode and international character support
- Email metadata extraction (headers, dates, addresses)
- Microsoft Outlook compatibility

## Usage

These files are used by the Parser Module tests to verify Apache Tika's email parsing capabilities across different formats and content types.