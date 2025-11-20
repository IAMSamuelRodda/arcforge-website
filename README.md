# Arc Forge Website

Simple, professional one-page website for Arc Forge business systems automation services.

**Live Site**: https://arcforge.au

**Design**: Text-only, clean, professional. No logo needed.

---

## Features

- ✅ **Zero dependencies** - Pure HTML + Tailwind CDN
- ✅ **Mobile-responsive** - Works on all devices
- ✅ **Fast loading** - No build process, instant load
- ✅ **Professional design** - Clean typography, clear pricing
- ✅ **Contact form** - Formspree integration
- ✅ **Portfolio showcase** - Links to GitHub projects

---

## Deployment to Digital Ocean Droplet

### Prerequisites

- Digital Ocean droplet running (production-syd1)
- Caddy reverse proxy installed
- SSH access to droplet

### Quick Deploy

```bash
# 1. From local machine, deploy to droplet
./deploy.sh

# 2. On droplet, configure Caddy (see CADDY_CONFIG.md)

# 3. Test
curl https://arcforge.au
```

---

## Setup Instructions

### Step 1: Configure Form

1. Go to [formspree.io](https://formspree.io)
2. Sign up (free tier)
3. Create new form
4. Get form endpoint (format: `https://formspree.io/f/YOUR_FORM_ID`)
5. Replace `YOUR_FORM_ID` in `index.html` line 238

### Step 2: Add Your ABN

Edit `index.html` line 496:
```html
<p>ABN: [Your ABN Number]</p>
```

Replace with your actual ABN.

### Step 3: Deploy to Droplet

Run deployment script:
```bash
./deploy.sh
```

This will:
- Copy `index.html` to droplet at `/var/www/arcforge.au/`
- Set correct permissions
- Reload Caddy

### Step 4: Configure Caddy

SSH to droplet:
```bash
ssh root@170.64.169.203
```

Add to Caddyfile (usually `/etc/caddy/Caddyfile` or check your setup):
```
arcforge.au {
    root * /var/www/arcforge.au
    file_server
    encode gzip

    # Security headers
    header {
        Strict-Transport-Security "max-age=31536000;"
        X-Content-Type-Options "nosniff"
        X-Frame-Options "DENY"
        Referrer-Policy "strict-origin-when-cross-origin"
    }

    # Logging
    log {
        output file /var/log/caddy/arcforge.log
    }
}

www.arcforge.au {
    redir https://arcforge.au{uri} permanent
}
```

Reload Caddy:
```bash
caddy reload --config /etc/caddy/Caddyfile
```

---

## File Structure

```
arcforge-website/
├── index.html          # Main website (single page)
├── deploy.sh           # Deployment script
├── CADDY_CONFIG.md     # Caddy configuration reference
├── README.md           # This file
└── .gitignore          # Git ignore rules
```

---

## Customization

### Change Colors

Edit Tailwind config in `index.html` lines 10-22:
```javascript
'forge': {
    50: '#f0f9ff',   // Very light blue
    500: '#0ea5e9',  // Primary blue
    900: '#0c4a6e',  // Dark blue
}
```

### Update Content

All content is in `index.html`:
- **Services**: Lines 63-222
- **Portfolio**: Lines 226-354
- **Contact form**: Lines 358-421
- **Footer**: Lines 425-485

### Add Email Address

Replace `hello@arcforge.au` in:
- Line 463 (footer contact)
- Update email signature in DEVELOPMENT.md of revenue-sprint project

---

## DNS Configuration

**If arcforge.au domain not yet pointed to droplet:**

1. Go to domain registrar (where you bought arcforge.au)
2. Update DNS A records:
   ```
   @ (root)       A    170.64.169.203
   www            A    170.64.169.203
   ```
3. Wait for DNS propagation (5 min - 48 hours, usually ~1 hour)
4. Test: `dig arcforge.au`

---

## Testing

**Before deploying:**
- [ ] Form endpoint configured (Formspree)
- [ ] ABN number added
- [ ] All links tested locally
- [ ] Mobile responsive checked

**Local testing:**
```bash
# Simple HTTP server
python3 -m http.server 8000

# Open browser
http://localhost:8000
```

**After deploying:**
- [ ] Visit https://arcforge.au
- [ ] Test form submission
- [ ] Check mobile view
- [ ] Verify all GitHub links work
- [ ] Test www redirect

---

## Maintenance

**Update content:**
1. Edit `index.html` locally
2. Test locally
3. Run `./deploy.sh`
4. Verify changes at https://arcforge.au

**View logs:**
```bash
ssh root@170.64.169.203
tail -f /var/log/caddy/arcforge.log
```

---

## Tech Stack

- **HTML5** - Semantic markup
- **Tailwind CSS** - Utility-first CSS (CDN)
- **Formspree** - Form backend (free tier)
- **Caddy** - Web server with automatic HTTPS
- **Digital Ocean** - Hosting (production-syd1 droplet)

---

## Cost

- **Hosting**: $0 (uses existing DO droplet)
- **Domain**: Owned (arcforge.au)
- **Form**: $0 (Formspree free tier, 50 submissions/month)
- **SSL**: $0 (Caddy automatic)

**Total monthly cost**: $0

---

## Performance

- **Load time**: <1 second
- **Lighthouse score**: 95+ expected
- **Mobile-friendly**: Yes
- **SEO**: Basic (single page, semantic HTML)

---

## Future Enhancements (Later)

**Once revenue is stable:**
- [ ] Add blog section
- [ ] Create case study pages
- [ ] Add client testimonials
- [ ] Implement analytics (privacy-friendly)
- [ ] Commission proper branding/logo

**For now:** Ship simple, generate revenue, iterate.

---

## License

Private/Proprietary - Arc Forge

---

**Created**: November 20, 2025
**Status**: Ready to deploy
**Next**: Configure Formspree, deploy to droplet, go live!
