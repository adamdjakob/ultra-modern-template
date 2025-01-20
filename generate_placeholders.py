from PIL import Image, ImageDraw, ImageFont
import os

def create_gradient_image(width, height, start_color, end_color):
    image = Image.new('RGB', (width, height))
    draw = ImageDraw.Draw(image)
    
    for y in range(height):
        r = int(start_color[0] + (end_color[0] - start_color[0]) * y / height)
        g = int(start_color[1] + (end_color[1] - start_color[1]) * y / height)
        b = int(start_color[2] + (end_color[2] - start_color[2]) * y / height)
        draw.line([(0, y), (width, y)], fill=(r, g, b))
    
    return image

def add_text_to_image(image, text, font_size=40):
    draw = ImageDraw.Draw(image)
    try:
        font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", font_size)
    except:
        font = ImageFont.load_default()
    
    text_width = draw.textlength(text, font=font)
    text_height = font_size
    
    x = (image.width - text_width) // 2
    y = (image.height - text_height) // 2
    
    # Add white text with slight shadow for better visibility
    draw.text((x+2, y+2), text, font=font, fill=(0, 0, 0))
    draw.text((x, y), text, font=font, fill=(255, 255, 255))
    
    return image

def generate_placeholder(width, height, text, output_path):
    start_color = (107, 70, 193)  # #6b46c1
    end_color = (128, 90, 213)    # #805ad5
    
    image = create_gradient_image(width, height, start_color, end_color)
    image = add_text_to_image(image, text)
    image.save(output_path, quality=95)

def main():
    # Create directories if they don't exist
    directories = [
        'assets/images/portfolio',
        'assets/images/blog',
        'assets/images/team',
        'assets/images/testimonials',
        'assets/images/backgrounds',
        'assets/images/preview'
    ]
    
    for directory in directories:
        os.makedirs(directory, exist_ok=True)
    
    # Generate portfolio images
    for i in range(1, 7):
        generate_placeholder(800, 600, f'Portfolio Item {i}',
                           f'assets/images/portfolio/portfolio-{i}.jpg')
    
    # Generate blog images
    for i in range(1, 5):
        generate_placeholder(800, 400, f'Blog Post {i}',
                           f'assets/images/blog/blog-{i}.jpg')
    
    # Generate team images
    for i in range(1, 5):
        generate_placeholder(400, 400, f'Team Member {i}',
                           f'assets/images/team/team-{i}.jpg')
    
    # Generate testimonial images
    for i in range(1, 5):
        generate_placeholder(200, 200, f'Testimonial {i}',
                           f'assets/images/testimonials/testimonial-{i}.jpg')
    
    # Generate background images
    generate_placeholder(1920, 1080, 'Hero Background',
                        'assets/images/backgrounds/hero-bg.jpg')
    generate_placeholder(1920, 1080, 'Pattern Background',
                        'assets/images/backgrounds/pattern-bg.jpg')
    generate_placeholder(1920, 1080, 'Section Background',
                        'assets/images/backgrounds/section-bg.jpg')
    
    # Generate preview images
    generate_placeholder(590, 300, 'Main Preview',
                        'assets/images/preview/main-preview.jpg')
    generate_placeholder(800, 600, 'Portfolio Preview',
                        'assets/images/preview/portfolio-preview.jpg')
    generate_placeholder(800, 600, 'Responsive Preview',
                        'assets/images/preview/responsive-preview.jpg')

if __name__ == '__main__':
    main()
    print("All placeholder images generated successfully!")
