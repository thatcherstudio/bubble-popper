# Privacy Policy Website

A simple, professional website for hosting privacy policies for your mobile apps.

## 📁 Files Structure

```
HTML/
├── index.html              # Main landing page listing all apps
├── bubble-popper-privacy.html  # Bubble Popper privacy policy
├── styles.css              # Shared stylesheet
└── README.md               # This file
```

## 🚀 Getting Started

### 1. Customize the Content

**Update `index.html`:**
- Replace "Your App Company" with your company name
- Replace "privacy@yourdomain.com" with your email
- Update the copyright year
- Update the last updated date

**Update `bubble-popper-privacy.html`:**
- Replace `[INSERT DATE]` with today's date
- Replace `[INSERT YOUR EMAIL]` with your contact email
- Update company name in footer

### 2. Host the Website

**Option A: Simple Web Hosting**
- Upload all files to your web hosting provider
- Point your domain to the folder
- Access via `https://yourdomain.com`

**Option B: GitHub Pages (Free)**
- Create a new GitHub repository
- Upload files to the repository
- Enable GitHub Pages in repository settings
- Access via `https://yourusername.github.io/repository-name`

**Option C: Netlify (Free)**
- Drag and drop the HTML folder to netlify.com
- Get instant hosting with custom domain support

### 3. Get the Privacy Policy URL

Once hosted, your Bubble Popper privacy policy will be at:
`https://yourdomain.com/bubble-popper-privacy.html`

Use this URL in your App Store submission and in the app.

## 📱 Adding New Apps

### Quick Steps:

1. **Create new privacy policy page:**
   - Copy `bubble-popper-privacy.html`
   - Rename to `your-app-name-privacy.html`
   - Update the content for your new app

2. **Add app to main page:**
   - Edit `index.html`
   - Uncomment the template app card
   - Update icon, name, description, and link

### Template for New App Card:

```html
<div class="app-card">
    <div class="app-icon">🎮</div>
    <h3>Your App Name</h3>
    <p>Brief description of your app.</p>
    <div class="app-details">
        <span class="age-rating">Ages X-Y</span>
        <span class="platform">iOS</span>
    </div>
    <a href="your-app-privacy.html" class="privacy-link">View Privacy Policy</a>
</div>
```

## 🎨 Design Features

- **Mobile-responsive** - Works on all devices
- **Professional styling** - Clean, modern design
- **App Store compliant** - Meets all requirements
- **Fast loading** - No database or complex features
- **SEO friendly** - Proper HTML structure
- **Easy maintenance** - Simple HTML/CSS

## 🔧 Customization

### Colors
Edit `styles.css` to change the color scheme:
- **Primary gradient:** Line 46-47
- **Button color:** Line 133
- **Text colors:** Various lines

### Fonts
The site uses system fonts for best performance:
- **Primary:** -apple-system, BlinkMacSystemFont, 'Segoe UI'...

### Layout
The design is mobile-first and fully responsive. Grid layout automatically adjusts to screen size.

## 📋 Maintenance

### Regular Updates:
1. **Update dates** when privacy policies change
2. **Add new apps** as you publish them
3. **Keep contact info** current
4. **Check links** work properly

### Backup:
- Keep a local copy of all files
- Consider version control with Git

## 🌐 SEO Tips

- Each page has proper `<title>` tags
- Content is well-structured with headers
- Pages load fast (no external dependencies)
- Mobile-friendly design

## 📞 Support

For questions about this website template, refer to the HTML/CSS documentation or contact your web developer.

---

**Ready to publish!** Just update the contact info and dates, then upload to your hosting provider.