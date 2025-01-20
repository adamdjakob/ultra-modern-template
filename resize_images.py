from PIL import Image
import os

def resize_image(input_path, output_path, target_size=(590, 300)):
    with Image.open(input_path) as img:
        # Print original size
        print(f"{os.path.basename(input_path)}: {img.size}")
        
        # Calculate aspect ratio
        aspect = img.size[0] / img.size[1]
        target_aspect = target_size[0] / target_size[1]
        
        if aspect > target_aspect:
            # Image is wider than target
            new_width = int(target_size[1] * aspect)
            new_height = target_size[1]
        else:
            # Image is taller than target
            new_width = target_size[0]
            new_height = int(target_size[0] / aspect)
            
        # Resize image
        img_resized = img.resize((new_width, new_height), Image.Resampling.LANCZOS)
        
        # Create new image with correct dimensions
        new_img = Image.new('RGB', target_size, (255, 255, 255))
        
        # Calculate position to paste resized image
        paste_x = (target_size[0] - new_width) // 2
        paste_y = (target_size[1] - new_height) // 2
        
        # Paste resized image
        new_img.paste(img_resized, (paste_x, paste_y))
        
        # Save the result
        new_img.save(output_path, quality=95, optimize=True)
        print(f"Saved resized image to {output_path}")

# Directory containing the images
preview_dir = "/home/galaxy/CascadeProjects/modern-html-template/ultra-modern-template-preview"

# Prepare the preview images
images_to_resize = [
    ("hero-section.png", "01_ultra-modern.jpg"),
    ("portfolio-section.png", "02_portfolio.jpg"),
    ("responsive-preview.jpg", "03_responsive.jpg")
]

for input_name, output_name in images_to_resize:
    input_path = os.path.join(preview_dir, input_name)
    output_path = os.path.join(preview_dir, output_name)
    if os.path.exists(input_path):
        resize_image(input_path, output_path)
    else:
        print(f"Warning: {input_path} not found")
