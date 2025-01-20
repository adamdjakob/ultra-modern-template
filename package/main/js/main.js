// Initialize AOS
document.addEventListener('DOMContentLoaded', function () {
  // Initialize AOS
  AOS.init({
    duration: 800,
    easing: 'ease-in-out',
    once: true,
    mirror: false,
  });

  // Initialize Particles.js
  particlesJS('particles-js', {
    particles: {
      number: {
        value: 80,
        density: {
          enable: true,
          value_area: 800,
        },
      },
      color: {
        value: '#ffffff',
      },
      shape: {
        type: 'circle',
      },
      opacity: {
        value: 0.5,
        random: false,
      },
      size: {
        value: 3,
        random: true,
      },
      line_linked: {
        enable: true,
        distance: 150,
        color: '#ffffff',
        opacity: 0.4,
        width: 1,
      },
      move: {
        enable: true,
        speed: 2,
        direction: 'none',
        random: false,
        straight: false,
        out_mode: 'out',
        bounce: false,
      },
    },
    interactivity: {
      detect_on: 'canvas',
      events: {
        onhover: {
          enable: true,
          mode: 'grab',
        },
        onclick: {
          enable: true,
          mode: 'push',
        },
        resize: true,
      },
      modes: {
        grab: {
          distance: 140,
          line_linked: {
            opacity: 1,
          },
        },
        push: {
          particles_nb: 4,
        },
      },
    },
    retina_detect: true,
  });

  // Smooth scrolling
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        target.scrollIntoView({
          behavior: 'smooth',
          block: 'start',
        });
      }
    });
  });

  // Navbar color change on scroll
  const navbar = document.querySelector('.navbar');
  window.addEventListener('scroll', function () {
    if (window.scrollY > 50) {
      navbar.style.background = 'rgba(255, 255, 255, 0.95)';
      navbar.style.backdropFilter = 'blur(10px)';
    } else {
      navbar.style.background = 'transparent';
      navbar.style.backdropFilter = 'none';
    }
  });

  // Active navigation link on scroll
  const sections = document.querySelectorAll('section');
  const navLinks = document.querySelectorAll('.nav-link');

  window.addEventListener('scroll', () => {
    let current = '';
    sections.forEach(section => {
      const sectionTop = section.offsetTop;
      const sectionHeight = section.clientHeight;
      if (scrollY >= sectionTop - sectionHeight / 3) {
        current = section.getAttribute('id');
      }
    });

    navLinks.forEach(link => {
      link.classList.remove('active');
      if (link.getAttribute('href').slice(1) === current) {
        link.classList.add('active');
      }
    });
  });

  // Form handling with validation
  const contactForm = document.getElementById('contactForm');
  if (contactForm) {
    contactForm.addEventListener('submit', function (e) {
      e.preventDefault();

      // Simple form validation
      const formData = new FormData(this);
      let isValid = true;
      let errorMessage = '';

      formData.forEach((value, key) => {
        if (!value) {
          isValid = false;
          errorMessage += `${key} is required\n`;
        }
      });

      if (!isValid) {
        alert(errorMessage);
        return;
      }

      // Success message
      alert('Thank you for your message! We will get back to you soon.');
      this.reset();
    });
  }

  // Service card hover effect
  const serviceCards = document.querySelectorAll('.service-card');
  serviceCards.forEach(card => {
    card.addEventListener('mouseenter', function () {
      this.querySelector('.service-card-inner').style.transform = 'rotateY(180deg)';
    });

    card.addEventListener('mouseleave', function () {
      this.querySelector('.service-card-inner').style.transform = 'rotateY(0deg)';
    });
  });

  // Portfolio filtering
  const filterButtons = document.querySelectorAll('.filter-btn');
  const portfolioItems = document.querySelectorAll('.portfolio-item');

  filterButtons.forEach(button => {
    button.addEventListener('click', function () {
      // Remove active class from all buttons
      filterButtons.forEach(btn => btn.classList.remove('active'));
      // Add active class to clicked button
      this.classList.add('active');

      const filterValue = this.getAttribute('data-filter');

      portfolioItems.forEach(item => {
        if (filterValue === 'all' || item.classList.contains(filterValue)) {
          item.style.display = 'block';
          setTimeout(() => {
            item.style.opacity = '1';
            item.style.transform = 'scale(1)';
          }, 0);
        } else {
          item.style.opacity = '0';
          item.style.transform = 'scale(0.8)';
          setTimeout(() => {
            item.style.display = 'none';
          }, 300);
        }
      });
    });
  });

  // Project Modal
  const projectData = {
    project1: {
      title: 'Modern Website Design',
      category: 'Web Development',
      description:
        'A fully responsive website with modern design elements and smooth animations. Built with the latest web technologies to ensure optimal performance and user experience.',
      client: 'Tech Solutions Inc.',
      date: 'January 2025',
      image: 'https://source.unsplash.com/800x600/?website',
      link: '#',
    },
    project2: {
      title: 'Mobile App Development',
      category: 'App Development',
      description:
        'Cross-platform mobile application developed using React Native. Features include real-time notifications, offline support, and seamless social media integration.',
      client: 'StartUp Mobile',
      date: 'December 2024',
      image: 'https://source.unsplash.com/800x600/?mobile,app',
      link: '#',
    },
    project3: {
      title: 'Brand Identity Design',
      category: 'Branding',
      description:
        'Complete brand identity design including logo, color palette, typography, and brand guidelines. Created to establish a strong and consistent brand presence.',
      client: 'Creative Agency',
      date: 'November 2024',
      image: 'https://source.unsplash.com/800x600/?branding',
      link: '#',
    },
  };

  const projectModal = new bootstrap.Modal(document.getElementById('projectModal'));
  const portfolioLinks = document.querySelectorAll('.portfolio-link');

  portfolioLinks.forEach(link => {
    link.addEventListener('click', function (e) {
      e.preventDefault();
      const projectId = this.getAttribute('data-project');
      const project = projectData[projectId];

      // Update modal content
      const modal = document.getElementById('projectModal');
      modal.querySelector('.project-title').textContent = project.title;
      modal.querySelector('.project-category').textContent = project.category;
      modal.querySelector('.project-description').textContent = project.description;
      modal.querySelector('.project-client').textContent = project.client;
      modal.querySelector('.project-date').textContent = project.date;
      modal.querySelector('.project-image img').src = project.image;
      modal.querySelector('.project-link').href = project.link;

      projectModal.show();
    });
  });

  // Pricing hover effects
  const pricingCards = document.querySelectorAll('.pricing-card');
  pricingCards.forEach(card => {
    card.addEventListener('mouseenter', function () {
      pricingCards.forEach(c => c.classList.remove('featured'));
      this.classList.add('featured');
    });

    card.addEventListener('mouseleave', function () {
      if (!this.classList.contains('featured-default')) {
        this.classList.remove('featured');
      }
    });
  });

  // Statistics Counter
  const counters = document.querySelectorAll('.counter');
  const speed = 200;

  const startCounter = counter => {
    const target = +counter.getAttribute('data-target');
    const count = +counter.innerText;
    const increment = target / speed;

    if (count < target) {
      counter.innerText = Math.ceil(count + increment);
      setTimeout(() => startCounter(counter), 1);
    } else {
      counter.innerText = target;
    }
  };

  // Start counters when they come into view
  const observerCallback = (entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        startCounter(entry.target);
        observer.unobserve(entry.target);
      }
    });
  };

  const counterObserver = new IntersectionObserver(observerCallback, {
    threshold: 0.5,
  });

  counters.forEach(counter => {
    counterObserver.observe(counter);
  });

  // Testimonials Slider
  const swiper = new Swiper('.testimonials-slider', {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    autoplay: {
      delay: 3000,
      disableOnInteraction: false,
    },
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    breakpoints: {
      768: {
        slidesPerView: 2,
      },
      1024: {
        slidesPerView: 3,
      },
    },
  });

  // Parallax Effect for Stats Section
  window.addEventListener('scroll', () => {
    const parallaxBg = document.querySelector('.parallax-bg');
    if (parallaxBg) {
      const scrolled = window.pageYOffset;
      parallaxBg.style.transform = `translateY(${scrolled * 0.5}px)`;
    }
  });

  // Multi-step Form
  const multiStepForm = document.getElementById('multiStepForm');
  if (multiStepForm) {
    const formSteps = multiStepForm.querySelectorAll('.form-step');
    const progressSteps = multiStepForm.querySelectorAll('.progress-step');
    let currentStep = 1;

    // Next step button click
    multiStepForm.querySelectorAll('.next-step').forEach(button => {
      button.addEventListener('click', () => {
        if (validateStep(currentStep)) {
          currentStep++;
          updateFormSteps();
          updateProgressBar();
        }
      });
    });

    // Previous step button click
    multiStepForm.querySelectorAll('.prev-step').forEach(button => {
      button.addEventListener('click', () => {
        currentStep--;
        updateFormSteps();
        updateProgressBar();
      });
    });

    // Form submission
    multiStepForm.addEventListener('submit', e => {
      e.preventDefault();
      if (validateStep(currentStep)) {
        // Here you would typically send the form data to a server
        alert('Form submitted successfully!');
        multiStepForm.reset();
        currentStep = 1;
        updateFormSteps();
        updateProgressBar();
      }
    });

    // Update form steps
    function updateFormSteps() {
      formSteps.forEach(step => {
        step.classList.remove('active');
        if (step.getAttribute('data-step') == currentStep) {
          step.classList.add('active');
        }
      });
    }

    // Update progress bar
    function updateProgressBar() {
      progressSteps.forEach((step, idx) => {
        if (idx < currentStep) {
          step.classList.add('active');
        } else {
          step.classList.remove('active');
        }
      });
    }

    // Validate form steps
    function validateStep(step) {
      const currentStepElement = multiStepForm.querySelector(`.form-step[data-step="${step}"]`);
      const inputs = currentStepElement.querySelectorAll(
        'input[required], select[required], textarea[required]'
      );
      let isValid = true;

      inputs.forEach(input => {
        if (!input.value.trim()) {
          isValid = false;
          input.classList.add('is-invalid');
        } else {
          input.classList.remove('is-invalid');
        }
      });

      if (!isValid) {
        alert('Please fill in all required fields.');
      }

      return isValid;
    }
  }

  // Team Social Media Hover Effects
  const teamSocialLinks = document.querySelectorAll('.team-social a');
  teamSocialLinks.forEach(link => {
    link.addEventListener('mouseenter', function () {
      this.style.transform = 'translateY(-5px)';
    });

    link.addEventListener('mouseleave', function () {
      this.style.transform = 'translateY(0)';
    });
  });

  // Blog Card Hover Effects
  const blogCards = document.querySelectorAll('.blog-card');
  blogCards.forEach(card => {
    card.addEventListener('mouseenter', function () {
      this.querySelector('.read-more').style.gap = '1rem';
    });

    card.addEventListener('mouseleave', function () {
      this.querySelector('.read-more').style.gap = '0.5rem';
    });
  });
});
