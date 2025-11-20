# Caddy Configuration for arcforge.au

## Location of Caddyfile

Your existing Caddy setup is in do-vps-prod repository.

**Check current Caddyfile location:**
```bash
ssh root@170.64.169.203
systemctl status caddy  # Shows config file location
# OR
caddy version  # Shows paths
# OR check common locations:
ls /etc/caddy/Caddyfile
ls ~/Caddyfile
```

---

## Add to Caddyfile

**Add this configuration block:**

```caddy
# Arc Forge Business Website
arcforge.au {
    # Document root
    root * /var/www/arcforge.au

    # Serve static files
    file_server

    # Gzip compression
    encode gzip zstd

    # Security headers
    header {
        # HSTS
        Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"

        # Prevent MIME sniffing
        X-Content-Type-Options "nosniff"

        # Prevent clickjacking
        X-Frame-Options "DENY"

        # Referrer policy
        Referrer-Policy "strict-origin-when-cross-origin"

        # Remove server header
        -Server
    }

    # Logging
    log {
        output file /var/log/caddy/arcforge.log {
            roll_size 10mb
            roll_keep 10
        }
        format console
    }

    # Handle 404
    handle_errors {
        respond "Page not found" 404
    }
}

# Redirect www to non-www
www.arcforge.au {
    redir https://arcforge.au{uri} permanent
}
```

---

## Full Deployment Steps

### 1. SSH to Droplet

```bash
ssh root@170.64.169.203
```

### 2. Create Website Directory

```bash
mkdir -p /var/www/arcforge.au
```

### 3. Edit Caddyfile

```bash
# Find your Caddyfile (check systemctl status caddy)
vim /etc/caddy/Caddyfile

# Add the configuration block above
# Save and exit (:wq)
```

### 4. Create Log Directory

```bash
mkdir -p /var/log/caddy
chown -R caddy:caddy /var/log/caddy
```

### 5. Test Caddy Configuration

```bash
caddy validate --config /etc/caddy/Caddyfile
```

### 6. Reload Caddy

```bash
# Reload without downtime
caddy reload --config /etc/caddy/Caddyfile

# OR restart service
systemctl restart caddy
```

### 7. Check Status

```bash
systemctl status caddy
journalctl -u caddy -f  # Follow logs
```

---

## Verify Deployment

### From Droplet

```bash
# Check file exists
ls -la /var/www/arcforge.au/

# Check permissions
ls -la /var/www/arcforge.au/index.html
# Should show: -rw-r--r-- caddy caddy

# Test locally
curl http://localhost/
```

### From Local Machine

```bash
# Test DNS
dig arcforge.au

# Test HTTP (will redirect to HTTPS)
curl -I http://arcforge.au

# Test HTTPS
curl -I https://arcforge.au

# Full test
curl https://arcforge.au
```

### In Browser

1. Visit https://arcforge.au
2. Check SSL certificate (should be valid Let's Encrypt)
3. Test form submission
4. Check mobile responsiveness

---

## Troubleshooting

### Site not loading

**Check Caddy is running:**
```bash
systemctl status caddy
```

**Check logs:**
```bash
journalctl -u caddy -n 50
tail -f /var/log/caddy/arcforge.log
```

**Verify DNS:**
```bash
dig arcforge.au
# Should show A record: 170.64.169.203
```

---

### SSL certificate issues

**Check certificate status:**
```bash
caddy list-certificates
```

**Force certificate renewal:**
```bash
caddy reload --config /etc/caddy/Caddyfile
```

**Check Let's Encrypt rate limits:**
- 50 certificates per domain per week
- Usually not an issue for new domains

---

### Permission issues

**Fix ownership:**
```bash
chown -R caddy:caddy /var/www/arcforge.au
chmod 755 /var/www/arcforge.au
chmod 644 /var/www/arcforge.au/index.html
```

---

### DNS not resolving

**If arcforge.au isn't pointed to droplet yet:**

1. Go to your domain registrar
2. Update DNS A records:
   ```
   @      A    170.64.169.203
   www    A    170.64.169.203
   ```
3. Wait 5-60 minutes for propagation
4. Test: `dig arcforge.au`

---

## Integration with Existing Services

**You already have these services running:**
- cloud.rodda.xyz (Nextcloud)
- notes.rodda.xyz (Joplin)
- vault.rodda.xyz (Vaultwarden)
- n8n.rodda.xyz
- headscale.rodda.xyz

**arcforge.au will be added alongside these.**

**Your Caddyfile likely already has:**
```caddy
cloud.rodda.xyz {
    reverse_proxy localhost:8080
}
# ... etc
```

**Just add the arcforge.au block to the same file.**

---

## Maintenance

### Update Website Content

From local machine:
```bash
cd /home/x-forge/repos/arcforge-website
vim index.html  # Make changes
./deploy.sh      # Deploy to production
```

### View Logs

```bash
ssh root@170.64.169.203
tail -f /var/log/caddy/arcforge.log
```

### Reload After Changes

```bash
ssh root@170.64.169.203
caddy reload --config /etc/caddy/Caddyfile
```

---

## Security Considerations

**Enabled in config above:**
- ✅ HTTPS forced (automatic redirect)
- ✅ HSTS header (prevent downgrade attacks)
- ✅ X-Frame-Options (prevent clickjacking)
- ✅ X-Content-Type-Options (prevent MIME sniffing)
- ✅ Gzip compression
- ✅ Access logging

**Static site = minimal attack surface**

---

## Performance

**Expected metrics:**
- Load time: <500ms
- First contentful paint: <1s
- Time to interactive: <2s
- Lighthouse score: 95+

**Optimization enabled:**
- Gzip compression
- CDN for Tailwind CSS
- No JavaScript (except smooth scroll)
- Minimal CSS (Tailwind CDN)

---

## Backup

**Website is in git:**
```bash
cd /home/x-forge/repos/arcforge-website
git log  # Full history
```

**Droplet backup:**
- Your weekly Digital Ocean snapshots include /var/www/
- No additional backup needed (static site, version controlled)

---

## Next Steps After Deployment

1. **Test thoroughly**
   - [ ] Visit https://arcforge.au
   - [ ] Test contact form
   - [ ] Check mobile view
   - [ ] Verify all links

2. **Configure Formspree**
   - [ ] Get form endpoint ID
   - [ ] Update index.html
   - [ ] Redeploy
   - [ ] Test form submission

3. **Update revenue sprint STATUS.md**
   - [ ] Mark "Website deployed" as complete
   - [ ] Move to Upwork profile next

4. **Share website**
   - [ ] Use in Upwork profile
   - [ ] Use in email outreach
   - [ ] Link from GitHub profile

---

**Created**: November 20, 2025
**For**: Arc Forge website deployment to production-syd1 droplet
