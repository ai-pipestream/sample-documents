# How to Create New Sample Document Collections

This guide documents the process for adding new sample document collections to the `sample-documents` repository.

## Overview

The `sample-documents` repository contains test data for validating document parsing, chunking, and processing pipelines. Sample documents are organized in the `sample_doc_types/` directory, with each subdirectory representing a specific document type or test data collection.

## Project Structure

```
sample-documents/
├── sample_doc_types/           # Main directory for sample collections
│   ├── office/                 # Office documents (.docx, .xlsx, etc.)
│   ├── pdf/                    # PDF documents
│   ├── image/                  # Image files
│   ├── double-chunked-pipedocs/    # Double-chunked protobuf samples
│   ├── parsed-parser-pipedocs/     # Parsed protobuf samples
│   └── ...                     # Other document types
├── test-documents/             # Legacy test documents
└── README.md                   # Repository documentation
```

## Steps to Add New Sample Documents

### Step 1: Identify the Source Data

First, identify where your sample data is coming from. This could be:
- An external repository (e.g., ai-pipestream/module-chunker)
- Generated test data
- Curated real-world samples

**Example (for double-chunked-pipedocs and parsed-parser-pipedocs):**
```bash
# Clone the source repository
cd /tmp
git clone https://github.com/ai-pipestream/module-chunker.git

# Locate the sample data
ls -la /tmp/module-chunker/src/test/resources/
```

### Step 2: Understand the Existing Structure

Before adding new samples, examine the existing collections to understand the naming conventions and organization:

```bash
# Navigate to the repository
cd /home/user/sample-documents

# Review existing sample types
ls -la sample_doc_types/

# Examine an existing README for the template pattern
cat sample_doc_types/pdf/README.md
```

Each collection should have:
- A descriptive directory name (use kebab-case: `my-sample-type`)
- Sample files appropriate to the collection type
- A `README.md` file documenting the purpose and contents

### Step 3: Create the New Directory

Create a new subdirectory in `sample_doc_types/` with a descriptive name:

```bash
# Use kebab-case for directory names
mkdir -p sample_doc_types/your-sample-type-name
```

**Naming Conventions:**
- Use lowercase with hyphens (kebab-case)
- Be descriptive but concise
- Examples: `double-chunked-pipedocs`, `parsed-parser-pipedocs`, `office`, `pdf`

### Step 4: Copy Sample Files

Copy the sample files from your source location to the new directory:

```bash
# Example: Copying from module-chunker repository
cp -r /tmp/module-chunker/src/test/resources/double_chunked_pipedocs/* \
    sample_doc_types/double-chunked-pipedocs/

# Verify the files were copied
ls -lh sample_doc_types/double-chunked-pipedocs/
```

### Step 5: Create a README.md

Every sample collection must include a `README.md` file documenting:
1. Purpose of the collection
2. Expected file types
3. Test coverage
4. Sample file listing
5. Source attribution
6. Usage information

**README Template:**

```markdown
# [Collection Name] Test Samples

This folder contains [description] for testing [purpose].

## Purpose
[Detailed explanation of what these samples are used for]

## Expected File Types:
- **[Type]**: .[extension] ([description])

## Test Coverage:
- [Coverage item 1]
- [Coverage item 2]
- [Coverage item 3]

## Sample Files:
[Description of the files in this directory]
- `file_001.ext` - [description]
- `file_002.ext` - [description]

## Source
These files were sourced from [source attribution with links].

## Usage
These files are used to test:
1. [Use case 1]
2. [Use case 2]
3. [Use case 3]
```

### Step 6: Verify the Structure

Verify that your new collection follows the project structure:

```bash
# Check directory structure
tree sample_doc_types/your-sample-type-name/

# Verify README exists
cat sample_doc_types/your-sample-type-name/README.md

# Count files
ls -1 sample_doc_types/your-sample-type-name/ | wc -l
```

### Step 7: Update Documentation (if needed)

If your new collection represents a new category or has special requirements:

1. Update the main `README.md` in the repository root if needed
2. Update `sample_doc_types/README.md` if it needs to reference your new collection
3. Document any special handling or dependencies

### Step 8: Commit and Push Changes

Once everything is ready, commit your changes:

```bash
# Check git status
git status

# Add the new directory
git add sample_doc_types/your-sample-type-name/

# Create a descriptive commit message
git commit -m "Add [collection-name] sample documents

- Added [X] sample files for [purpose]
- Includes README documenting usage and source
- Sourced from [repository/source]"

# Push to your branch
git push -u origin your-branch-name
```

## Example: Adding double-chunked-pipedocs and parsed-parser-pipedocs

Here's the actual process used to add these two collections:

### 1. Clone the source repository:
```bash
cd /tmp
git clone https://github.com/ai-pipestream/module-chunker.git
```

### 2. Create the directories:
```bash
cd /home/user/sample-documents
mkdir -p sample_doc_types/double-chunked-pipedocs
mkdir -p sample_doc_types/parsed-parser-pipedocs
```

### 3. Copy the sample files:
```bash
# Copy double-chunked samples (18 files, ~111KB total)
cp -r /tmp/module-chunker/src/test/resources/double_chunked_pipedocs/* \
    sample_doc_types/double-chunked-pipedocs/

# Copy parsed parser samples (103 files, ~3MB total)
cp -r /tmp/module-chunker/src/test/resources/parser_pipedoc_parsed/* \
    sample_doc_types/parsed-parser-pipedocs/
```

### 4. Created README.md files:
- `sample_doc_types/double-chunked-pipedocs/README.md`
- `sample_doc_types/parsed-parser-pipedocs/README.md`

### 5. Verify the structure:
```bash
ls -lh sample_doc_types/double-chunked-pipedocs/
ls -lh sample_doc_types/parsed-parser-pipedocs/
```

### 6. Commit and push:
```bash
git add sample_doc_types/double-chunked-pipedocs/
git add sample_doc_types/parsed-parser-pipedocs/
git add HOW_TO_CREATE_NEW_SAMPLE_DOCS.md
git commit -m "Add chunker and parser protobuf sample collections

- Added double-chunked-pipedocs with 18 sample .pb files
- Added parsed-parser-pipedocs with 103 sample .pb files
- Both sourced from module-chunker test resources
- Includes comprehensive README files for each collection
- Added HOW_TO_CREATE_NEW_SAMPLE_DOCS.md documentation"

git push -u origin claude/add-module-chunker-sample-data-01AitSBEhriUAWrmVs69yMHq
```

## Best Practices

### File Organization
- Keep related files together in a single collection directory
- Use consistent naming patterns within a collection
- Document any special file naming conventions in the README

### Documentation
- Always include a README.md
- Be specific about the purpose and usage
- Attribute sources with links
- Document any dependencies or special requirements

### File Sizes
- Be mindful of repository size
- Large files (>10MB) may require Git LFS
- Document file size distributions in the README

### Testing
- Verify files can be read and processed
- Test that downstream services can consume the samples
- Document expected behavior in the README

## Troubleshooting

### Issue: Files not copying correctly
```bash
# Check source directory exists
ls -la /path/to/source/

# Verify permissions
ls -l /path/to/source/files

# Use verbose copy to see what's happening
cp -v source/* destination/
```

### Issue: Directory already exists
```bash
# Check if directory exists
ls -la sample_doc_types/your-directory/

# Remove and recreate if needed (BE CAREFUL)
rm -rf sample_doc_types/your-directory/
mkdir -p sample_doc_types/your-directory/
```

### Issue: Git won't track files
```bash
# Check .gitignore
cat .gitignore

# Force add if needed (after verifying .gitignore is correct)
git add -f sample_doc_types/your-directory/
```

## Related Documentation

- Main Repository README: `/README.md`
- Sample Doc Types Overview: `/sample_doc_types/README.md`
- Test Plan: `/sample_doc_types/TEST_PLAN.md`

## Questions or Issues?

If you encounter issues or have questions about adding sample documents:
1. Review existing sample collections for examples
2. Check the repository's README.md
3. Consult the project documentation
4. Reach out to the team

---

**Last Updated:** November 14, 2025
**Author:** Claude Code
**Related Commits:** Initial documentation for protobuf sample collections
