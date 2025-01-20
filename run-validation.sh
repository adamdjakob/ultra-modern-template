#!/bin/bash

echo "Starting validation process..."

# Create validation results directory
mkdir -p validation-results

# Run HTML validation
echo "Validating HTML files..."
npx html-validator --file=index.html > validation-results/html-validation.txt
npx html-validator --file=documentation/index.html >> validation-results/html-validation.txt

# Run CSS validation
echo "Validating CSS files..."
npx stylelint "css/style.css" > validation-results/css-validation.txt

# Run JavaScript validation
echo "Validating JavaScript files..."
npx eslint "js/main.js" > validation-results/js-validation.txt

# Run code formatting check
echo "Checking code formatting..."
npx prettier --check "*.{html,css,js}" "css/*.css" "js/*.js" "documentation/*.html" > validation-results/formatting-validation.txt

# Check file sizes
echo "Checking file sizes..."
echo "File sizes:" > validation-results/file-sizes.txt
find . -type f -exec ls -lh {} \; >> validation-results/file-sizes.txt

# Check image optimization
echo "Checking image optimization..."
echo "Image sizes:" > validation-results/image-sizes.txt
find assets/images -type f \( -name "*.jpg" -o -name "*.png" \) -exec ls -lh {} \; >> validation-results/image-sizes.txt

# Create validation summary
echo "Creating validation summary..."
cat << EOF > validation-results/summary.md
# Validation Summary

## HTML Validation
- index.html
- documentation/index.html

## CSS Validation
- css/style.css

## JavaScript Validation
- js/main.js

## Code Formatting
- All files checked with Prettier

## File Sizes
- See file-sizes.txt for details

## Image Optimization
- See image-sizes.txt for details

## Next Steps
1. Review all validation results
2. Fix any reported issues
3. Re-run validation after fixes
4. Document any known issues
EOF

echo "Validation complete! Check validation-results directory for detailed reports."
