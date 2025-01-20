#!/bin/bash

echo "Starting packaging process for CodeCanyon..."

# Create package directory
mkdir -p package

# Create necessary directories
mkdir -p package/preview
mkdir -p package/documentation
mkdir -p package/demo-content

# Copy main files
cp -r index.html assets css js package/
cp README.md LICENSE.md CHANGELOG.md SUPPORT.md package/

# Copy documentation
cp -r documentation/* package/documentation/

# Copy demo content
cp -r demo-content/* package/demo-content/

# Copy preview images
cp -r assets/images/preview/* package/preview/

# Create main package
cd package
zip -r ../ultra-modern-template.zip *

# Create preview package
cd ../preview
zip -r ../ultra-modern-template-preview.zip *

echo "Packaging complete!"
echo "Files created:"
echo "1. ultra-modern-template.zip - Main template package"
echo "2. ultra-modern-template-preview.zip - Preview package"
