# Comprehensive Document Type Testing Plan

## 🎯 Objective
Validate our complete Tika parser metadata extraction system across all 14 document types with the new struct-based protobuf architecture.

## 📋 Test Phases

### Phase 1: Sample File Collection ⏳
**Goal**: Gather representative sample files for each document type

#### Priority 1 - Core Document Types (Start Here)
1. **PDF** - Most common, well-defined metadata
2. **Office** - Word/Excel/PowerPoint with rich properties
3. **Image** - JPEG with EXIF data for immediate visual validation
4. **HTML** - Simple web pages with meta tags

#### Priority 2 - Specialized Formats
5. **Email** - EML files with headers and attachments
6. **Media** - MP3/MP4 with ID3/metadata tags
7. **EPUB** - E-books with structural metadata (critical for chunking)
8. **Font** - TTF files with font metrics

#### Priority 3 - Advanced/Niche Formats
9. **WARC** - Web archive files (your preservarca use case!)
10. **RTF** - Rich text documents
11. **Database** - Access MDB files
12. **ClimateForcast** - NetCDF scientific data

#### Priority 4 - Edge Cases
13. **CreativeCommons** - Files with CC licensing metadata
14. **Generic** - Unusual formats (WordPerfect, PST, etc.)

### Phase 2: Parser Service Integration 🔧
**Goal**: Update the parser service to handle all document types

#### Service Updates Required:
1. **Document Type Router**: 
   ```java
   // Detect document type from MIME type and route to correct metadata builder
   DocumentType detectDocumentType(String mimeType, Metadata tikaMetadata)
   ```

2. **Metadata Builders**: Create builders for each document type
   ```java
   OfficeMetadata.Builder buildOfficeMetadata(Metadata tikaMetadata)
   PdfMetadata.Builder buildPdfMetadata(Metadata tikaMetadata)
   // ... for all 14 types
   ```

3. **Struct Population**: Handle flexible metadata
   ```java
   Struct buildAdditionalMetadata(Metadata tikaMetadata, Set<String> mappedFields)
   TikaBaseFields buildBaseFields(String parserClass, String tikaVersion)
   ```

4. **Response Assembly**: Build final TikaResponse with oneof selection
   ```java
   TikaResponse.Builder response = TikaResponse.newBuilder()
       .setDocId(docId)
       .setContent(content)
       .setDublinCore(dublinCore);
   
   // Set appropriate document_metadata oneof field
   switch(documentType) {
       case OFFICE: response.setOffice(officeMetadata); break;
       case PDF: response.setPdf(pdfMetadata); break;
       // ... etc
   }
   ```

### Phase 3: Integration Testing 🧪
**Goal**: Validate end-to-end parsing with real sample files

#### Test Categories:

##### 3.1 Happy Path Testing
- [ ] Each document type parses successfully
- [ ] Strongly-typed fields are populated correctly
- [ ] Struct fields capture unmapped metadata
- [ ] TikaBaseFields contain parser info
- [ ] JSON serialization works

##### 3.2 Edge Case Testing
- [ ] Empty/minimal metadata files
- [ ] Corrupted or malformed files
- [ ] Very large files (performance)
- [ ] Password-protected/encrypted files
- [ ] Legacy format versions

##### 3.3 Metadata Completeness Testing
- [ ] All Tika interface fields are mapped
- [ ] Additional metadata captured in struct
- [ ] No data loss from original Tika extraction
- [ ] Dublin Core fields populated when available

##### 3.4 Architecture Validation
- [ ] Correct oneof field selection
- [ ] Package structure works (`io.pipeline.parsed.data.*`)
- [ ] Struct-based flexibility functions
- [ ] TikaBaseFields integration

## 🔧 Implementation Strategy

### Step 1: Start with PDF (Easiest)
1. Add `simple.pdf` to `pdf/` folder
2. Create `PdfMetadataBuilder` class
3. Test PDF parsing and protobuf population
4. Validate JSON output

### Step 2: Add Office Documents
1. Add Word/Excel samples to `office/` folder
2. Create `OfficeMetadataBuilder` class
3. Test complex metadata extraction
4. Validate struct population for unmapped fields

### Step 3: Expand to Images
1. Add JPEG with EXIF to `image/` folder
2. Create `ImageMetadataBuilder` class
3. Test rich EXIF metadata extraction
4. Validate GPS and camera data

### Step 4: Continue Through All Types
- Follow same pattern for remaining 11 document types
- Test each type individually before moving to next
- Build comprehensive test suite

## 📊 Success Criteria

### Per Document Type:
- ✅ Sample files parse without errors
- ✅ Strongly-typed fields populated with correct data types
- ✅ Struct fields contain unmapped metadata as key-value pairs
- ✅ TikaBaseFields show parser class and version
- ✅ JSON output is valid and complete

### Overall System:
- ✅ All 14 document types supported
- ✅ Automatic document type detection works
- ✅ oneof document_metadata selection is correct
- ✅ Performance is acceptable (< 5 seconds per document)
- ✅ Memory usage is reasonable
- ✅ Error handling is graceful

## 🚨 Potential Challenges

### 1. Document Type Detection
**Challenge**: Accurate MIME type detection for routing
**Solution**: Use Tika's built-in detection + fallback logic

### 2. Metadata Mapping Complexity
**Challenge**: 1,330+ fields across 14 types
**Solution**: Start simple, iterate, use reflection/annotation-based mapping

### 3. Struct Population
**Challenge**: Deciding what goes in struct vs strongly-typed fields
**Solution**: Map known Tika interface fields to strongly-typed, rest to struct

### 4. Performance
**Challenge**: Large files or complex documents
**Solution**: Streaming where possible, memory monitoring, timeouts

### 5. Edge Cases
**Challenge**: Corrupted, encrypted, or unusual files
**Solution**: Graceful fallback to GenericMetadata, comprehensive error handling

## 📝 Test Documentation

### For Each Document Type:
1. **Sample File Inventory**: List of test files and their characteristics
2. **Expected Metadata**: What fields should be populated
3. **Test Results**: Actual vs expected output
4. **Issues Found**: Problems and their resolutions

### Overall Documentation:
1. **Performance Benchmarks**: Parse times for different file sizes
2. **Coverage Report**: Which Tika fields are mapped vs unmapped
3. **Error Catalog**: Common errors and handling strategies
4. **Integration Guide**: How to add new document types

---

**Ready to Start**: Begin with Phase 1 - adding sample PDF and Office documents, then implement the basic parser service integration for these core types.
