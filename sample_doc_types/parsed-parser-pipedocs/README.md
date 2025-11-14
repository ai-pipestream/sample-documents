# Parsed Parser PipeDocs Test Samples

This folder contains parsed protobuf documents for testing parser module output.

## Purpose
These are protobuf (.pb) files representing documents that have been parsed by the parser service. They serve as test samples for validating the parser output and downstream processing of parsed documents.

## Expected File Types:
- **Protobuf**: .pb (Protocol Buffer binary files)

## Test Coverage:
- Parsed document structure
- Metadata extraction
- Content parsing accuracy
- Various document types and formats
- Edge cases and complex documents

## Sample Files:
This directory contains 103 protobuf files representing parsed documents:
- `parsed_document_001.pb` through `parsed_document_103.pb`
- Files range in size from small metadata-only documents to large complex documents (up to 1MB+)

## Source
These files were sourced from the [module-chunker](https://github.com/ai-pipestream/module-chunker) repository, specifically from `src/test/resources/parser_pipedoc_parsed/`.

## Usage
These files are used to test:
1. Parser module functionality
2. Document processing pipelines
3. Metadata extraction and validation
4. Integration testing with downstream services
5. Performance and scalability testing

## File Size Distribution:
- Small files (~340 bytes): Basic metadata
- Medium files (~1-10 KB): Standard documents
- Large files (>50 KB): Complex documents with rich content
- Very large files (>1 MB): Comprehensive test cases for performance
