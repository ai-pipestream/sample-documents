#!/bin/bash
echo "🔍 Verifying Sample Document Types Structure"
echo "=============================================="

EXPECTED_DIRS=("office" "pdf" "image" "email" "media" "html" "rtf" "database" "font" "epub" "warc" "climate_forecast" "creative_commons" "generic")
MISSING_DIRS=()
FOUND_DIRS=0

for dir in "${EXPECTED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "✅ $dir/ - $(ls -1 $dir | wc -l) files"
        ((FOUND_DIRS++))
    else
        echo "❌ $dir/ - MISSING"
        MISSING_DIRS+=("$dir")
    fi
done

echo ""
echo "📊 Summary:"
echo "Found: $FOUND_DIRS/14 document type directories"

if [ ${#MISSING_DIRS[@]} -eq 0 ]; then
    echo "🎉 All document type directories are present!"
else
    echo "⚠️  Missing directories: ${MISSING_DIRS[*]}"
fi

echo ""
echo "📁 Total files by type:"
for dir in "${EXPECTED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        file_count=$(find "$dir" -type f ! -name "README.md" | wc -l)
        if [ $file_count -gt 0 ]; then
            echo "   $dir: $file_count sample files"
        else
            echo "   $dir: 0 sample files (ready for samples)"
        fi
    fi
done
