# WARC Sample Files Collection

This directory contains 8 WARC.gz files of varying sizes, all under 11MB compressed, perfect for testing your pipeline engine.

## File Inventory

### Tiny Test Files (Perfect for Unit Testing)
1. **sample-tiny-566b.warc.gz** (566 bytes)
   - Hand-crafted with 3 simple records
   - Contains example.com pages with basic HTML
   - Perfect for initial development and debugging

### Small Test Files (Good for Integration Testing)
2. **sample-small-336kb.warc.gz** (336KB compressed, ~1.9MB uncompressed)
   - 110 complete WARC records from real Common Crawl data (Dec 2024)
   - Good for integration testing and development

3. **sample-medium-646kb.warc.gz** (646KB compressed, ~1.9MB uncompressed)
   - 65 complete WARC records from real Common Crawl data (Dec 2024)
   - Another good sample for testing different content

### Production-Size Test Files (~10MB each)
4. **sample-july-2024-10mb.warc.gz** (11MB compressed, ~46MB uncompressed)
   - 2,101 records from Common Crawl July 2024 data
   - Starting from beginning of crawl file

5. **sample-dec-2024-a-10mb.warc.gz** (11MB compressed, ~45MB uncompressed)
   - 1,901 records from Common Crawl December 2024 data (file A)
   - Starting from beginning of crawl file

6. **sample-dec-2024-b-10mb.warc.gz** (11MB compressed, ~51MB uncompressed)
   - 2,001 records from Common Crawl December 2024 data (file B)
   - Starting from beginning of crawl file

7. **sample-july-2024-mid-10mb.warc.gz** (11MB compressed, ~41MB uncompressed)
   - 1,701 records from Common Crawl July 2024 data
   - Starting from middle of crawl file (skipped first 2,000 records)

8. **sample-dec-2024-mid-10mb.warc.gz** (11MB compressed, ~45MB uncompressed)
   - 1,801 records from Common Crawl December 2024 data
   - Starting from middle of crawl file (skipped first 1,500 records)

## Content Diversity

- **Time Range**: July 2024 and December 2024 crawl data
- **Geographic Diversity**: Global web content from Common Crawl
- **Content Types**: HTML pages, CSS, JavaScript, images, and other web resources
- **Size Variety**: From tiny test files to production-sized samples
- **Record Counts**: From 3 records to 2,101 records per file

## Usage Recommendations

### Development Phase
```bash
# Start with the tiny file for basic functionality
./scripts/test-pipeline.sh ./tmp/warc-samples-10mb/sample-tiny-566b.warc.gz

# Move to small real data
./scripts/test-pipeline.sh ./tmp/warc-samples-10mb/sample-small-336kb.warc.gz
```

### Integration Testing
```bash
# Test with medium-sized real data
./scripts/test-pipeline.sh ./tmp/warc-samples-10mb/sample-medium-646kb.warc.gz
```

### Performance Testing
```bash
# Test with production-sized data
./scripts/test-pipeline.sh ./tmp/warc-samples-10mb/sample-july-2024-10mb.warc.gz
./scripts/test-pipeline.sh ./tmp/warc-samples-10mb/sample-dec-2024-a-10mb.warc.gz
```

### Batch Testing
```bash
# Test all files in sequence
for file in ./tmp/warc-samples-10mb/*.warc.gz; do
    echo "Testing $file..."
    ./scripts/test-pipeline.sh "$file"
done
```

## File Validation

All files are valid WARC 1.0/1.1 format and contain complete records:
- Each record has proper WARC headers
- Content-Length fields are accurate
- Records are properly terminated
- Files are properly gzip compressed

## Copyright and Usage

- All Common Crawl data is public domain and free to use
- Hand-crafted samples use example.com (reserved for documentation)
- Safe for commercial and research use
- No copyright restrictions

## Technical Details

- **Format**: WARC 1.0/1.1 (Web ARChive format)
- **Compression**: gzip
- **Encoding**: UTF-8 with error handling
- **Source**: Common Crawl Foundation (commoncrawl.org)
- **Extraction Method**: Complete records only (no truncation)
