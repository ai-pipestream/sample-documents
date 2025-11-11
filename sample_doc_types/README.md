# Sample Document Types for Tika Parser Testing

This directory contains sample documents for testing our comprehensive Tika parser metadata extraction across all 14 supported document types.

## 🎯 Purpose

Test and validate the complete protobuf metadata mapping for every document type supported by our Tika parser implementation. Each folder corresponds to one of our 14 document type protobuf structures.

## 📁 Directory Structure

```
sample_doc_types/
├── office/              # Office documents (.docx, .xlsx, .pptx, .odt)
├── pdf/                 # PDF documents (.pdf)
├── image/               # Image files (.jpg, .png, .tiff, .gif, .bmp)
├── email/               # Email files (.eml, .msg, .mbox)
├── media/               # Media files (.mp4, .mp3, .flac, .wav)
├── html/                # HTML documents (.html, .htm)
├── rtf/                 # Rich Text Format (.rtf)
├── database/            # Database files (.mdb, .accdb)
├── font/                # Font files (.ttf, .afm, .otf)
├── epub/                # EPUB books (.epub)
├── warc/                # Web archives (.warc, .arc)
├── climate_forecast/    # NetCDF files (.nc)
├── creative_commons/    # CC licensed files (various formats)
└── generic/             # Miscellaneous formats (.wpd, .qpw, .pst)
```

## 🧪 Testing Strategy

### Phase 1: Sample Collection
- [ ] Gather representative sample files for each document type
- [ ] Ensure samples have rich metadata for comprehensive testing
- [ ] Include both modern and legacy format versions
- [ ] Add edge cases (encrypted, corrupted, minimal metadata)

### Phase 2: Parser Integration Testing
- [ ] Test each document type against our protobuf structures
- [ ] Validate metadata extraction completeness
- [ ] Verify struct-based flexible metadata capture
- [ ] Test TikaBaseFields integration

### Phase 3: Service Integration
- [ ] Update parser service to handle all 14 document types
- [ ] Implement proper routing to correct metadata structures
- [ ] Test oneof document_metadata selection logic
- [ ] Validate JSON serialization of struct fields

## 🔧 Implementation Notes

### Protobuf Mapping
Each document type maps to its corresponding protobuf structure:
- `office/` → `io.pipeline.parsed.data.office.v1.OfficeMetadata`
- `pdf/` → `io.pipeline.parsed.data.pdf.v1.PdfMetadata`
- `image/` → `io.pipeline.parsed.data.image.v1.ImageMetadata`
- `email/` → `io.pipeline.parsed.data.email.v1.EmailMetadata`
- `media/` → `io.pipeline.parsed.data.media.v1.MediaMetadata`
- `html/` → `io.pipeline.parsed.data.html.v1.HtmlMetadata`
- `rtf/` → `io.pipeline.parsed.data.rtf.v1.RtfMetadata`
- `database/` → `io.pipeline.parsed.data.database.v1.DatabaseMetadata`
- `font/` → `io.pipeline.parsed.data.tika.font.v1.FontMetadata`
- `epub/` → `io.pipeline.parsed.data.epub.v1.EpubMetadata`
- `warc/` → `io.pipeline.parsed.data.warc.v1.WarcMetadata`
- `climate_forecast/` → `io.pipeline.parsed.data.climate.v1.ClimateForcastMetadata`
- `creative_commons/` → `io.pipeline.parsed.data.creative_commons.v1.CreativeCommonsMetadata`
- `generic/` → `io.pipeline.parsed.data.generic.v1.GenericMetadata`

### Service Updates Needed
1. **Document Type Detection**: Enhance MIME type detection and routing
2. **Metadata Mapping**: Implement mappers from Tika Metadata to protobuf structures
3. **Struct Population**: Handle flexible metadata in `google.protobuf.Struct` fields
4. **Error Handling**: Graceful fallback to GenericMetadata for unknown types

## 🚀 Getting Started

1. **Add Sample Files**: Place representative files in each document type folder
2. **Run Tests**: Execute parser tests against each document type
3. **Validate Output**: Verify protobuf structures are populated correctly
4. **Iterate**: Refine metadata mapping based on test results

## 📊 Success Metrics

- [ ] All 14 document types parse successfully
- [ ] Strongly-typed fields are populated with correct data
- [ ] Struct fields capture unmapped metadata
- [ ] TikaBaseFields contain parser information
- [ ] JSON serialization works for all structures
- [ ] Performance is acceptable for all document types

## 🔍 Testing Checklist

### Per Document Type:
- [ ] Sample files added and documented
- [ ] Parser correctly identifies document type
- [ ] Metadata extraction populates protobuf fields
- [ ] Struct fields capture additional metadata
- [ ] No parsing errors or exceptions
- [ ] Output validates against protobuf schema

### Integration Testing:
- [ ] Service routes to correct metadata structure
- [ ] oneof document_metadata selection works
- [ ] Dublin Core metadata is extracted
- [ ] TikaBaseFields are populated
- [ ] Error handling works for corrupted files
- [ ] Performance meets requirements

---

**Next Steps**: Start adding sample files to each folder and begin implementing the parser service integration to handle all 14 document types with our new protobuf structures.
