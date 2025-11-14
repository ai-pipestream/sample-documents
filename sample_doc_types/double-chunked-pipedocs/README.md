# Double-Chunked PipeDocs Test Samples

This folder contains double-chunked protobuf documents for testing chunker module output.

## Purpose
These are protobuf (.pb) files representing documents that have been chunked twice using the module-chunker service. They serve as test samples for validating the chunking process and downstream processing of chunked documents.

## Expected File Types:
- **Protobuf**: .pb (Protocol Buffer binary files)

## Test Coverage:
- Double-chunked document structure
- Chunk metadata preservation
- Sequential chunk ordering
- Content integrity after chunking
- Performance with various chunk sizes

## Sample Files:
This directory contains 18 protobuf files representing double-chunked documents:
- `double_chunked_001.pb` through `double_chunked_018.pb`

## Source
These files were sourced from the [module-chunker](https://github.com/ai-pipestream/module-chunker) repository, specifically from `src/test/resources/double_chunked_pipedocs/`.

## Usage
These files are used to test:
1. Chunker module functionality
2. Document processing pipelines
3. Chunk reassembly and validation
4. Integration testing with downstream services
