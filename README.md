# sample-documents

A collection of test documents and sample files designed for testing document parsers and AI processing pipelines.

## Overview

This project provides curated test assets packaged as Maven artifacts, making it easy to include diverse document samples in your test suites. It's specifically designed for testing Pipestream AI parsers and similar document processing systems.

## What This Produces

This project builds and publishes **JAR artifacts** containing organized test documents:

### Artifacts

- **`test-documents`** - Comprehensive collection of 100+ test files organized by category
- **`sample-doc-types`** - Additional sample document types for testing
- **`bom`** - Bill of Materials for dependency management

All artifacts are published to Maven Central under `ai.pipestream.testdata`.

## Test Document Categories

The `test-documents` artifact includes samples organized into these categories:

- **sample_office_files** - Microsoft Office documents (DOCX, etc.)
- **sample_image** - Various image formats (JPG, PNG, progressive JPEG)
- **sample_video** - Video file samples
- **sample_audio** - Audio formats (MP3, WAV, FLAC, OGG, etc.)
- **sample_text** - Text documents
- **sample_archive_files** - Compressed archives (7z, tar)
- **sample_font_files** - Font files (TTF, OTF, WOFF)
- **sample_source_code** - Source code examples
- **sample_web_development_files** - Web assets
- **sample_geographical** - Geographic data files
- **sample_fav_icon_and_mobile_icon_examples** - Icon files
- **sample_variety** - Mixed file types including PDFs
- **sample_miscellaneous_files** - Other document types

## How to Use

### Maven Dependency

```xml
<dependency>
    <groupId>ai.pipestream.testdata</groupId>
    <artifactId>test-documents</artifactId>
    <version>${version}</version>
    <scope>test</scope>
</dependency>
```

### Gradle Dependency

```gradle
testImplementation 'ai.pipestream.testdata:test-documents:${version}'
```

### Accessing Files in Tests

The documents are packaged as resources in the JAR:

```java
InputStream stream = getClass().getResourceAsStream("/test-documents/sample_image/sample.jpg");
```

## Building Locally

Build all artifacts:
```bash
./gradlew buildAll
```

Publish to Maven Local:
```bash
./gradlew publishAllToMavenLocal
```

## License

MIT License - See [LICENSE](LICENSE) file for details.

## Purpose

These test documents are specifically curated for:
- Testing document parsers and extraction tools
- Validating AI document processing pipelines
- Ensuring format compatibility across different document types
- Providing consistent test data for CI/CD pipelines
- Benchmarking parser performance with real-world file formats
