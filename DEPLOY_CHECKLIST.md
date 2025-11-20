# Deployment Checklist

Complete these steps to get arcforge.au live TODAY.

---

## Pre-Deployment (10 minutes)

### 1. Set Up Formspree

- [ ] Go to https://formspree.io
- [ ] Create free account (email + password)
- [ ] Click "New Form"
- [ ] Name: "Arc Forge Contact"
- [ ] Copy form endpoint (format: `https://formspree.io/f/xyzabc123`)
- [ ] Edit `index.html` line 238:
      ```html
      <form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
      ```
      Replace `YOUR_FORM_ID` with your actual ID (just the part after `/f/`)

### 2. Add Your ABN

- [ ] Edit `index.html` line 496:
      ```html
      <p>ABN: [Your ABN Number]</p>
      ```
      Replace with your actual ABN

### 3. Test Locally (Optional)

```bash
cd /home/x-forge/repos/arcforge-website
python3 -m http.server 8000
# Open http://localhost:8000 in browser
# Check everything looks good
```

### 4. Commit Changes

```bash
git add index.html
git commit -m "config: add Formspree endpoint and ABN"
git push
```

---

## Deployment to Droplet (30 minutes)

### 5. Deploy Files

From your local machine:
```bash
cd /home/x-forge/repos/arcforge-website
./deploy.sh
```

This will:
- Create `/var/www/arcforge.au/` on droplet
- Upload `index.html`
- Set correct permissions
- Attempt to reload Caddy

### 6. Configure Caddy

SSH to droplet:
```bash
ssh root@170.64.169.203
```

Find Caddyfile location:
```bash
systemctl status caddy  # Shows config file path
# Usually: /etc/caddy/Caddyfile
```

Edit Caddyfile:
```bash
vim /etc/caddy/Caddyfile
```

Add this block (see CADDY_CONFIG.md for full config):
```caddy
arcforge.au {
    root * /var/www/arcforge.au
    file_server
    encode gzip

    header {
        Strict-Transport-Security "max-age=31536000;"
        X-Content-Type-Options "nosniff"
        X-Frame-Options "DENY"
    }

    log {
        output file /var/log/caddy/arcforge.log
    }
}

www.arcforge.au {
    redir https://arcforge.au{uri} permanent
}
```

Create log directory:
```bash
mkdir -p /var/log/caddy
chown -R caddy:caddy /var/log/caddy
```

Validate and reload:
```bash
caddy validate --config /etc/caddy/Caddyfile
caddy reload --config /etc/caddy/Caddyfile
```

### 7. Check DNS (If not done already)

**If arcforge.au doesn't point to your droplet yet:**

Go to your domain registrar and add:
```
@      A    170.64.169.203
www    A    170.64.169.203
```

Wait 5-60 minutes for DNS propagation.

Test:
```bash
dig arcforge.au
# Should show: 170.64.169.203
```

---

## Testing (10 minutes)

### 8. Test from Droplet

```bash
# Should return HTML
curl http://localhost

# Should return HTML
curl https://arcforge.au

# Check logs
tail -f /var/log/caddy/arcforge.log
```

### 9. Test from Browser

- [ ] Visit https://arcforge.au
- [ ] Check HTTPS works (green padlock)
- [ ] Test www redirect: https://www.arcforge.au → https://arcforge.au
- [ ] Test contact form:
      - Fill out form
      - Submit
      - Check Formspree inbox for notification
- [ ] Test on mobile (or resize browser)
- [ ] Click all GitHub portfolio links
- [ ] Test smooth scrolling (click "Get Started" button)

---

## Post-Deployment

### 10. Update Revenue Sprint Project

```bash
cd /home/x-forge/repos/arcforge-revenue-sprint
vim STATUS.md
```

Mark as complete:
```markdown
**Monday Nov 20:**
- [x] Created arcforge-revenue-sprint project
- [x] Documented complete strategy
- [x] Created arcforge-website
- [x] Deployed website to arcforge.au ✅
- [ ] Set up Upwork profile (NEXT)
```

Commit:
```bash
git add STATUS.md
git commit -m "status: website deployed successfully"
git push
```

### 11. Use Website

Now you can:
- [ ] Add arcforge.au to Upwork profile
- [ ] Include in email signature
- [ ] Link from email outreach
- [ ] Reference in proposals
- [ ] Share on LinkedIn

---

## Troubleshooting

**Site not loading?**
- Check Caddy: `systemctl status caddy`
- Check logs: `journalctl -u caddy -n 50`
- Check DNS: `dig arcforge.au`

**Form not working?**
- Check Formspree endpoint is correct
- Check Formspree inbox
- Try submitting test form

**SSL error?**
- Wait 1-2 minutes (Let's Encrypt certificate provisioning)
- Check: `caddy list-certificates`
- Reload: `caddy reload --config /etc/caddy/Caddyfile`

**See CADDY_CONFIG.md for full troubleshooting guide**

---

## Success Criteria

Website is successfully deployed when:
- ✅ https://arcforge.au loads
- ✅ HTTPS certificate is valid
- ✅ Contact form submits successfully
- ✅ Mobile-responsive
- ✅ All portfolio links work
- ✅ www redirects to non-www

---

## Time Estimate

- Pre-deployment: 10 minutes
- Deployment: 30 minutes
- Testing: 10 minutes

**Total: ~50 minutes from start to live website**

---

## Next Actions After Deployment

1. **Upwork profile** (2 hours)
   - Use website URL in profile
   - Link portfolio projects
   - Submit for approval

2. **Update email signature**
   - Add arcforge.au link
   - Professional appearance

3. **Start bidding**
   - Reference website in proposals
   - "View full portfolio at arcforge.au"

---

**Ready? Let's deploy!**

```bash
cd /home/x-forge/repos/arcforge-website
./deploy.sh
```

Then follow steps 6-11 above.
