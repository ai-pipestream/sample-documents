# Double-Chunked PipeDocs Sample Data Module

This module contains sample protobuf files representing double-chunked documents for testing the chunker module.

## Purpose
These are protobuf (.pb) files representing documents that have been chunked twice using the module-chunker service. They serve as test samples for validating the chunking process and downstream processing of chunked documents.

## Module Information
- **Group ID**: `ai.pipestream`
- **Artifact ID**: `double-chunked-pipedocs`
- **Version**: `0.1.2-SNAPSHOT`

## Contents
This module contains 18 protobuf files in `src/main/resources/`:
- `double_chunked_001.pb` through `double_chunked_018.pb`
- Total size: ~111KB

## Source
These files were sourced from the [module-chunker](https://github.com/ai-pipestream/module-chunker) repository, specifically from `src/test/resources/double_chunked_pipedocs/`.

## Usage

### As a Maven/Gradle Dependency
Add this module as a dependency to access the sample data in your tests:

**Gradle:**
```gradle
testImplementation 'ai.pipestream:double-chunked-pipedocs:0.1.2-SNAPSHOT'
```

**Maven:**
```xml
<dependency>
    <groupId>ai.pipestream</groupId>
    <artifactId>double-chunked-pipedocs</artifactId>
    <version>0.1.2-SNAPSHOT</version>
    <scope>test</scope>
</dependency>
```

### Accessing the Files
Once included as a dependency, you can access the protobuf files from your classpath:
```java
InputStream stream = getClass().getClassLoader()
    .getResourceAsStream("double_chunked_001.pb");
```

## Building
```bash
./gradlew :double-chunked-pipedocs:build
./gradlew :double-chunked-pipedocs:publishToMavenLocal
```

## Test Coverage
These files are used to test:
- Double-chunked document structure
- Chunk metadata preservation
- Sequential chunk ordering
- Content integrity after chunking
- Performance with various chunk sizes
