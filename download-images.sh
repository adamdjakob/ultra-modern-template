#!/bin/bash

# Create image directories if they don't exist
mkdir -p assets/images/{portfolio,blog,team,testimonials,backgrounds,preview}

# Download portfolio images
echo "Downloading portfolio images..."
wget -P assets/images/portfolio https://source.unsplash.com/800x600/?website,design -O assets/images/portfolio/portfolio-1.jpg
wget -P assets/images/portfolio https://source.unsplash.com/800x600/?ecommerce -O assets/images/portfolio/portfolio-2.jpg
wget -P assets/images/portfolio https://source.unsplash.com/800x600/?mobile,app -O assets/images/portfolio/portfolio-3.jpg
wget -P assets/images/portfolio https://source.unsplash.com/800x600/?business,corporate -O assets/images/portfolio/portfolio-4.jpg
wget -P assets/images/portfolio https://source.unsplash.com/800x600/?food,restaurant -O assets/images/portfolio/portfolio-5.jpg
wget -P assets/images/portfolio https://source.unsplash.com/800x600/?art,gallery -O assets/images/portfolio/portfolio-6.jpg

# Download blog images
echo "Downloading blog images..."
wget -P assets/images/blog https://source.unsplash.com/800x400/?web,design -O assets/images/blog/blog-1.jpg
wget -P assets/images/blog https://source.unsplash.com/800x400/?mobile,development -O assets/images/blog/blog-2.jpg
wget -P assets/images/blog https://source.unsplash.com/800x400/?coding,programming -O assets/images/blog/blog-3.jpg
wget -P assets/images/blog https://source.unsplash.com/800x400/?ux,design -O assets/images/blog/blog-4.jpg

# Download team images
echo "Downloading team images..."
wget -P assets/images/team https://source.unsplash.com/400x400/?professional,woman -O assets/images/team/team-1.jpg
wget -P assets/images/team https://source.unsplash.com/400x400/?professional,man -O assets/images/team/team-2.jpg
wget -P assets/images/team https://source.unsplash.com/400x400/?designer,woman -O assets/images/team/team-3.jpg
wget -P assets/images/team https://source.unsplash.com/400x400/?manager,man -O assets/images/team/team-4.jpg

# Download testimonial images
echo "Downloading testimonial images..."
wget -P assets/images/testimonials https://source.unsplash.com/200x200/?ceo,business -O assets/images/testimonials/testimonial-1.jpg
wget -P assets/images/testimonials https://source.unsplash.com/200x200/?entrepreneur,woman -O assets/images/testimonials/testimonial-2.jpg
wget -P assets/images/testimonials https://source.unsplash.com/200x200/?marketing,man -O assets/images/testimonials/testimonial-3.jpg
wget -P assets/images/testimonials https://source.unsplash.com/200x200/?tech,woman -O assets/images/testimonials/testimonial-4.jpg

# Download background images
echo "Downloading background images..."
wget -P assets/images/backgrounds https://source.unsplash.com/1920x1080/?abstract,modern -O assets/images/backgrounds/hero-bg.jpg
wget -P assets/images/backgrounds https://source.unsplash.com/1920x1080/?pattern,geometric -O assets/images/backgrounds/pattern-bg.jpg
wget -P assets/images/backgrounds https://source.unsplash.com/1920x1080/?minimal,clean -O assets/images/backgrounds/section-bg.jpg

# Download preview images
echo "Downloading preview images..."
wget -P assets/images/preview https://source.unsplash.com/590x300/?website,modern -O assets/images/preview/main-preview.jpg
wget -P assets/images/preview https://source.unsplash.com/800x600/?portfolio,modern -O assets/images/preview/portfolio-preview.jpg
wget -P assets/images/preview https://source.unsplash.com/800x600/?mobile,responsive -O assets/images/preview/responsive-preview.jpg

# Optimize images using ImageMagick
echo "Optimizing images..."
find assets/images -type f -name "*.jpg" -exec convert {} -strip -quality 85 {} \;

echo "Image download and optimization complete!"
