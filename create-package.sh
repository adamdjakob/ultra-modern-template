#!/bin/bash

echo "Creating CodeCanyon package..."

# Create package directories
mkdir -p package/{main,preview}

# Copy main files to package/main
echo "Copying main files..."
cp -r index.html assets css js documentation README.md LICENSE.md CHANGELOG.md SUPPORT.md package/main/

# Copy preview files to package/preview
echo "Copying preview files..."
cp -r assets/images/preview/* assets/images/screenshots/* package/preview/

# Create main package
echo "Creating main package..."
cd package/main
zip -r ../../ultra-modern-template.zip *

# Create preview package
echo "Creating preview package..."
cd ../preview
zip -r ../../ultra-modern-template-preview.zip *

cd ../..

# Create package info
echo "Creating package info..."
cat << EOF > package-info.md
# Ultra Modern Template - Package Information

## Main Package (ultra-modern-template.zip)
- Complete template files
- Documentation
- Assets and images
- License and support files

## Preview Package (ultra-modern-template-preview.zip)
- Main preview image (590x300)
- Feature screenshots (800x600)
  - Hero section
  - Services section
  - Portfolio section
  - Pricing section
  - Team section
  - Blog section
  - Contact section
- Responsive screenshots
  - Desktop (1920x1080)
  - Laptop (1366x768)
  - Tablet (768x1024)
  - Mobile (375x812)
- Feature previews
  - Portfolio filter
  - Services hover effects
  - Team social links
  - Contact form

## Package Contents

### Main Files
- index.html
- css/style.css
- js/main.js
- Documentation files
- License files

### Assets
- Images
- Vendor files
- Demo content

### Documentation
- Setup guide
- Customization guide
- Support information

## File Sizes
$(ls -lh ultra-modern-template.zip ultra-modern-template-preview.zip)

## Next Steps
1. Upload both packages to CodeCanyon
2. Set up preview images
3. Complete item description
4. Submit for review

EOF

echo "Package creation complete!"
echo "Created:"
echo "1. ultra-modern-template.zip (Main package)"
echo "2. ultra-modern-template-preview.zip (Preview package)"
echo "3. package-info.md (Package information)"
