# Parser PipeDoc Parsed Sample Data Module

This module contains sample protobuf files representing parsed documents for testing the parser module.

## Purpose
These are protobuf (.pb) files representing documents that have been parsed by the parser service. They serve as test samples for validating the parser output and downstream processing of parsed documents.

## Module Information
- **Group ID**: `ai.pipestream`
- **Artifact ID**: `parser-pipedoc-parsed`
- **Version**: `0.1.2-SNAPSHOT`

## Contents
This module contains 102 protobuf files in `src/main/resources/`:
- `parsed_document_001.pb` through `parsed_document_103.pb`
- Total size: ~3MB
- Files range in size from small metadata-only documents (~340 bytes) to large comprehensive test cases (>1 MB)

## Source
These files were sourced from the [module-chunker](https://github.com/ai-pipestream/module-chunker) repository, specifically from `src/test/resources/parser_pipedoc_parsed/`.

## Usage

### As a Maven/Gradle Dependency
Add this module as a dependency to access the sample data in your tests:

**Gradle:**
```gradle
testImplementation 'ai.pipestream:parser-pipedoc-parsed:0.1.2-SNAPSHOT'
```

**Maven:**
```xml
<dependency>
    <groupId>ai.pipestream</groupId>
    <artifactId>parser-pipedoc-parsed</artifactId>
    <version>0.1.2-SNAPSHOT</version>
    <scope>test</scope>
</dependency>
```

### Accessing the Files
Once included as a dependency, you can access the protobuf files from your classpath:
```java
InputStream stream = getClass().getClassLoader()
    .getResourceAsStream("parsed_document_001.pb");
```

## Building
```bash
./gradlew :parser-pipedoc-parsed:build
./gradlew :parser-pipedoc-parsed:publishToMavenLocal
```

## Test Coverage
These files are used to test:
- Parsed document structure
- Metadata extraction
- Content parsing accuracy
- Various document types and formats
- Edge cases and complex documents
- Performance and scalability testing

## File Size Distribution
- **Small files** (~340 bytes): Basic metadata
- **Medium files** (~1-10 KB): Standard documents
- **Large files** (>50 KB): Complex documents with rich content
- **Very large files** (>1 MB): Comprehensive test cases for performance
