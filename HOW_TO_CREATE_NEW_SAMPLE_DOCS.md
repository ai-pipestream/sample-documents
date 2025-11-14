# How to Create New Sample Document Modules

This guide documents the process for adding new sample document modules to the `sample-documents` repository.

## Overview

The `sample-documents` repository contains test data for validating document parsing, chunking, and processing pipelines. The repository is structured as a multi-module Gradle project, where each module contains specific sample data that can be published and consumed as a Maven/Gradle dependency.

## Repository Structure

```
sample-documents/
├── settings.gradle              # Root Gradle settings defining all modules
├── gradlew, gradlew.bat        # Gradle wrapper scripts
├── gradle/                      # Gradle wrapper configuration
├── double-chunked-pipedocs/    # Module: Double-chunked protobuf samples
│   ├── build.gradle
│   ├── README.md
│   └── src/main/resources/     # Sample .pb files
├── parser-pipedoc-parsed/      # Module: Parsed protobuf samples
│   ├── build.gradle
│   ├── README.md
│   └── src/main/resources/     # Sample .pb files
├── sample_doc_types/           # Legacy: Sample document collections (non-module)
└── test-documents/             # Legacy: Test documents (non-module)
```

## Steps to Add a New Sample Module

### Step 1: Identify the Source Data

First, identify where your sample data is coming from:
- An external repository (e.g., ai-pipestream/module-chunker)
- Generated test data
- Curated real-world samples

**Example:**
```bash
# Clone the source repository
cd /tmp
git clone https://github.com/ai-pipestream/module-chunker.git

# Locate the sample data
ls -la /tmp/module-chunker/src/test/resources/
```

### Step 2: Create the Module Directory Structure

Create a new module directory at the repository root with the standard Maven/Gradle structure:

```bash
# Navigate to the repository
cd /home/user/sample-documents

# Create the module directory structure
mkdir -p my-sample-module/src/main/resources
```

**Naming Conventions:**
- Use lowercase with hyphens (kebab-case)
- Be descriptive but concise
- Examples: `double-chunked-pipedocs`, `parser-pipedoc-parsed`

### Step 3: Copy Sample Files to Resources

Copy the sample files to the module's resources directory:

```bash
# Example: Copying protobuf files
cp -r /tmp/module-chunker/src/test/resources/my_samples/* \
    my-sample-module/src/main/resources/

# Verify the files were copied
ls -lh my-sample-module/src/main/resources/
```

### Step 4: Create build.gradle

Create a `build.gradle` file for the module with publishing configuration:

**Template:**
```gradle
plugins {
    id 'java'
    id 'maven-publish'
}

group = 'ai.pipestream'
version = '0.1.2-SNAPSHOT'

java {
    sourceCompatibility = JavaVersion.VERSION_21
    targetCompatibility = JavaVersion.VERSION_21
}

repositories {
    mavenCentral()
    mavenLocal()
}

dependencies {
    // No dependencies needed - this is just a data module
}

// Package the resources into a jar
jar {
    from('src/main/resources') {
        include '**/*.pb'  // Adjust file patterns as needed
    }
}

// Publishing configuration
publishing {
    publications {
        maven(MavenPublication) {
            from components.java

            pom {
                name = 'My Sample Module Name'
                description = 'Description of what this module contains'
                url = 'https://github.com/ai-pipestream/sample-documents'

                licenses {
                    license {
                        name = 'MIT License'
                        url = 'https://opensource.org/licenses/MIT'
                    }
                }

                developers {
                    developer {
                        id = 'krickert'
                        name = 'Pipeline Engine Team'
                    }
                }

                scm {
                    connection = 'scm:git:git://github.com/ai-pipestream/sample-documents.git'
                    developerConnection = 'scm:git:ssh://github.com/ai-pipestream/sample-documents.git'
                    url = 'https://github.com/ai-pipestream/sample-documents'
                }
            }
        }
    }

    repositories {
        mavenLocal()
    }
}
```

### Step 5: Create README.md

Create a comprehensive README for the module:

**Template:**
```markdown
# [Module Name] Sample Data Module

Brief description of what this module contains.

## Purpose
Detailed explanation of the purpose and use cases.

## Module Information
- **Group ID**: `ai.pipestream`
- **Artifact ID**: `my-sample-module`
- **Version**: `0.1.2-SNAPSHOT`

## Contents
Description of the files in this module.

## Source
Attribution to the source of the sample data.

## Usage

### As a Maven/Gradle Dependency

**Gradle:**
```gradle
testImplementation 'ai.pipestream:my-sample-module:0.1.2-SNAPSHOT'
```

**Maven:**
```xml
<dependency>
    <groupId>ai.pipestream</groupId>
    <artifactId>my-sample-module</artifactId>
    <version>0.1.2-SNAPSHOT</version>
    <scope>test</scope>
</dependency>
```

### Accessing the Files
```java
InputStream stream = getClass().getClassLoader()
    .getResourceAsStream("my-file.pb");
```

## Building
```bash
./gradlew :my-sample-module:build
./gradlew :my-sample-module:publishToMavenLocal
```
```

### Step 6: Update settings.gradle

Add your new module to the root `settings.gradle` file:

```bash
# Edit settings.gradle
vi settings.gradle
```

Add the include statement:
```gradle
include 'my-sample-module'
```

**Complete settings.gradle example:**
```gradle
pluginManagement {
    repositories {
        gradlePluginPortal()
        mavenCentral()
    }
}

rootProject.name = 'sample-documents'

// Include all sample data modules
include 'double-chunked-pipedocs'
include 'parser-pipedoc-parsed'
include 'my-sample-module'  // Add your module here

dependencyResolutionManagement {
    repositories {
        mavenLocal()
        mavenCentral()
    }
}
```

### Step 7: Verify the Build

Test that your module builds successfully:

```bash
# List all modules
./gradlew projects

# Build your specific module
./gradlew :my-sample-module:build

# Publish to Maven Local for testing
./gradlew :my-sample-module:publishToMavenLocal
```

### Step 8: Update Repository Documentation

If needed, update the main README.md to reference your new module.

### Step 9: Commit and Push

```bash
# Check git status
git status

# Add the new module
git add my-sample-module/
git add settings.gradle

# Commit with descriptive message
git commit -m "Add my-sample-module with [description]

- Added [X] sample files
- Module group: ai.pipestream
- Includes comprehensive README and build configuration
- Sourced from [source]"

# Push to your branch
git push -u origin your-branch-name
```

## Example: Creating double-chunked-pipedocs and parser-pipedoc-parsed

Here's the actual process used to create these two modules:

### 1. Clone the source repository:
```bash
cd /tmp
git clone https://github.com/ai-pipestream/module-chunker.git
```

### 2. Create module directories:
```bash
cd /home/user/sample-documents
mkdir -p double-chunked-pipedocs/src/main/resources
mkdir -p parser-pipedoc-parsed/src/main/resources
```

### 3. Copy sample files:
```bash
# Double-chunked samples (18 files, ~111KB)
cp -r /tmp/module-chunker/src/test/resources/double_chunked_pipedocs/* \
    double-chunked-pipedocs/src/main/resources/

# Parsed parser samples (102 files, ~3MB)
cp -r /tmp/module-chunker/src/test/resources/parser_pipedoc_parsed/* \
    parser-pipedoc-parsed/src/main/resources/
```

### 4. Create build.gradle files:
Created `double-chunked-pipedocs/build.gradle` and `parser-pipedoc-parsed/build.gradle` with:
- Group ID: `ai.pipestream`
- Appropriate artifact names
- Maven publishing configuration
- Java 21 compatibility

### 5. Create README.md files:
Created comprehensive READMEs documenting:
- Module purpose and contents
- Maven/Gradle dependency usage
- File listings and sizes
- Source attribution

### 6. Create root settings.gradle:
```gradle
pluginManagement {
    repositories {
        gradlePluginPortal()
        mavenCentral()
    }
}

rootProject.name = 'sample-documents'

include 'double-chunked-pipedocs'
include 'parser-pipedoc-parsed'

dependencyResolutionManagement {
    repositories {
        mavenLocal()
        mavenCentral()
    }
}
```

### 7. Add Gradle wrapper:
```bash
cp -r /tmp/module-chunker/gradle .
cp /tmp/module-chunker/gradlew* .
```

### 8. Update .gitignore:
Added Gradle build artifacts:
```
build/
.gradle/
**/build/
**/.gradle/
```

### 9. Verify and commit:
```bash
./gradlew projects
git add .
git commit -m "Add sample data modules with Gradle build support"
git push -u origin branch-name
```

## Best Practices

### Module Organization
- Keep one type of sample data per module
- Use standard Maven directory structure
- Document all files in the README

### Build Configuration
- Use consistent group ID: `ai.pipestream`
- Version modules together (e.g., `0.1.2-SNAPSHOT`)
- Configure Maven publishing for distribution
- Keep dependencies minimal (usually none for data modules)

### Documentation
- Always include a comprehensive README.md
- Document how to use the module as a dependency
- Attribute sources with links
- Include example code for accessing resources

### File Organization
- Place sample files in `src/main/resources/`
- Organize by subdirectories if needed
- Use consistent naming patterns

### Testing
- Test that the module builds successfully
- Publish to Maven Local and test consumption
- Verify files are accessible from classpath

## Publishing Modules

### To Maven Local (for testing):
```bash
./gradlew :module-name:publishToMavenLocal
```

### To consume in another project:
```gradle
repositories {
    mavenLocal()
}

dependencies {
    testImplementation 'ai.pipestream:module-name:0.1.2-SNAPSHOT'
}
```

## Troubleshooting

### Issue: Module not found by Gradle
```bash
# Verify settings.gradle includes your module
cat settings.gradle

# List all projects
./gradlew projects
```

### Issue: Build fails
```bash
# Check build.gradle syntax
./gradlew :module-name:build --stacktrace

# Verify Java version
java -version  # Should be Java 21+
```

### Issue: Files not included in jar
```bash
# Check jar contents
./gradlew :module-name:build
unzip -l module-name/build/libs/module-name-*.jar
```

### Issue: Cannot publish to Maven Local
```bash
# Check publishing configuration
./gradlew :module-name:publishToMavenLocal --info
```

## Module vs. Sample Directory

**When to create a Module:**
- Sample data that should be consumed as a Maven/Gradle dependency
- Data that will be used across multiple projects
- Versioned and publishable artifacts
- Examples: protobuf samples, test fixtures

**When to use sample_doc_types directory:**
- Reference samples for documentation
- One-off test files
- Non-compiled resources
- Examples: document format samples, images

## Related Documentation

- Main Repository README: `/README.md`
- Gradle Build Documentation: https://docs.gradle.org
- Maven Publishing Plugin: https://docs.gradle.org/current/userguide/publishing_maven.html

## Questions or Issues?

If you encounter issues or have questions:
1. Review existing modules for examples
2. Check the repository's README.md
3. Consult Gradle documentation
4. Reach out to the team

---

**Last Updated:** November 14, 2025
**Author:** Claude Code
**Related Commits:** Module structure for publishable sample data
