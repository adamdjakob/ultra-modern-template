#!/bin/bash

# Create vendor directories if they don't exist
mkdir -p assets/vendor/{bootstrap,fontawesome,aos,swiper,particles}

# Download Bootstrap
wget https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css -O assets/vendor/bootstrap/bootstrap.min.css
wget https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js -O assets/vendor/bootstrap/bootstrap.bundle.min.js

# Download Font Awesome
wget https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css -O assets/vendor/fontawesome/all.min.css
wget https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/webfonts/fa-brands-400.woff2 -O assets/vendor/fontawesome/webfonts/fa-brands-400.woff2
wget https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/webfonts/fa-regular-400.woff2 -O assets/vendor/fontawesome/webfonts/fa-regular-400.woff2
wget https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/webfonts/fa-solid-900.woff2 -O assets/vendor/fontawesome/webfonts/fa-solid-900.woff2

# Download AOS
wget https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css -O assets/vendor/aos/aos.css
wget https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js -O assets/vendor/aos/aos.js

# Download Swiper
wget https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.4.5/swiper-bundle.min.css -O assets/vendor/swiper/swiper-bundle.min.css
wget https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.4.5/swiper-bundle.min.js -O assets/vendor/swiper/swiper-bundle.min.js

# Download Particles.js
wget https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js -O assets/vendor/particles/particles.min.js

echo "Vendor files downloaded successfully!"
