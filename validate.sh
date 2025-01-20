#!/bin/bash

echo "Starting validation process..."

# Create validation results directory
mkdir -p validation-results

# HTML Validation
echo "Validating HTML..."
html5validator index.html documentation/index.html > validation-results/html-validation.txt 2>&1

# CSS Validation
echo "Validating CSS..."
stylelint "assets/css/*.css" > validation-results/css-validation.txt 2>&1

# JavaScript Validation
echo "Validating JavaScript..."
eslint "assets/js/*.js" > validation-results/js-validation.txt 2>&1

# Performance Testing
echo "Running performance tests..."
lighthouse http://localhost:8000 --output json --output-path ./validation-results/lighthouse-report.json --chrome-flags="--headless" --only-categories=performance,accessibility,best-practices,seo

echo "Validation complete. Check validation-results directory for detailed reports."
