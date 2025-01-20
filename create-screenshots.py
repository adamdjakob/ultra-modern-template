from playwright.sync_api import sync_playwright
import time
import os

def create_screenshot(page, url, name, width, height, folder="assets/images/screenshots"):
    print(f"Creating {name} screenshot ({width}x{height})")
    page.set_viewport_size({"width": width, "height": height})
    page.goto(url)
    time.sleep(2)  # Wait for animations
    os.makedirs(folder, exist_ok=True)
    page.screenshot(path=f"{folder}/{name}.png", full_page=False)

def main():
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        
        # Local URL
        url = "file:///home/galaxy/CascadeProjects/modern-html-template/index.html"
        
        # Main preview (590x300)
        create_screenshot(page, url, "main-preview", 590, 300)
        
        # Feature screenshots (800x600)
        sections = [
            "hero",
            "services",
            "portfolio",
            "pricing",
            "team",
            "blog",
            "contact"
        ]
        
        for section in sections:
            create_screenshot(page, f"{url}#{section}", f"{section}-section", 800, 600)
        
        # Responsive screenshots
        devices = [
            ("desktop", 1920, 1080),
            ("laptop", 1366, 768),
            ("tablet", 768, 1024),
            ("mobile", 375, 812)
        ]
        
        for device, width, height in devices:
            create_screenshot(page, url, f"responsive-{device}", width, height)
        
        # Additional feature previews
        features = [
            ("portfolio-filter", "#portfolio"),
            ("services-hover", "#services"),
            ("team-social", "#team"),
            ("contact-form", "#contact")
        ]
        
        for feature, section in features:
            create_screenshot(page, f"{url}{section}", f"feature-{feature}", 800, 600)
        
        browser.close()
        print("All screenshots created successfully!")

if __name__ == "__main__":
    main()
