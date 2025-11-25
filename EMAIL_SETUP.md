# Email Setup for arcforge.au

## Overview
This document outlines how to setup email forwarding and contact form delivery for arcforge.au.

**Goal**: Forward emails from hello@arcforge.au → arcforge@proton.me

---

## Option 1: Cloudflare Email Routing (Recommended - Free & Simple)

Cloudflare Email Routing is a free service that forwards emails from your domain to your personal email.

### Prerequisites
- Domain (arcforge.au) must use Cloudflare nameservers
- Cloudflare account (free tier is fine)

### Steps

#### 1. Add Domain to Cloudflare (if not already)
1. Go to https://dash.cloudflare.com
2. Add site: arcforge.au
3. Update nameservers at VentraIP (domain registrar) to Cloudflare's nameservers
4. Wait for DNS propagation (usually 5-60 minutes)

#### 2. Enable Email Routing
1. In Cloudflare dashboard, go to **Email** → **Email Routing**
2. Click "Get started"
3. Configure destination address:
   - **Destination**: arcforge@proton.me
   - **Verify**: Check your Proton Mail for verification email from Cloudflare
4. Add routing rule:
   - **From**: hello@arcforge.au
   - **To**: arcforge@proton.me
5. Add catch-all (optional):
   - **From**: *@arcforge.au
   - **To**: arcforge@proton.me

#### 3. Verify DNS Records
Cloudflare will automatically add these DNS records:
- MX records for email routing
- SPF record: `v=spf1 include:_spf.mx.cloudflare.net ~all`
- DMARC record (optional but recommended)

#### 4. Test
Send a test email to hello@arcforge.au from another email account. Should arrive at arcforge@proton.me within seconds.

### Limitations
- **Receive only**: You can receive emails but cannot send FROM hello@arcforge.au using Cloudflare Email Routing
- For sending, you'll need to use Proton Mail's "Send As" feature or setup SMTP relay

---

## Option 2: Self-Hosted Email on DO Droplet (Advanced)

If you need full send/receive capabilities, you can setup a mail server on your Digital Ocean droplet.

### Prerequisites
- SSH access to DO droplet (170.64.169.203)
- Domain DNS control
- Basic Linux knowledge

### Option 2A: Postfix + Dovecot (Traditional)
**Complexity**: High
**Cost**: Free
**Use case**: Full control, can send and receive

```bash
# Install Postfix and Dovecot
sudo apt update
sudo apt install -y postfix dovecot-core dovecot-imapd

# Configure Postfix for your domain
# (Detailed configuration required - not recommended for beginners)
```

### Option 2B: Docker Mailserver (Easier)
**Complexity**: Medium
**Cost**: Free
**Use case**: Containerized mail server

```bash
# Using docker-mailserver
docker pull docker.io/mailserver/docker-mailserver:latest

# Configuration required for:
# - Domain setup
# - SSL certificates
# - DKIM/SPF/DMARC
# - User accounts
```

**Recommendation**: Unless you need to send emails FROM hello@arcforge.au regularly, stick with Cloudflare Email Routing (Option 1).

---

## Contact Form Setup

### Current Status
Contact form currently has Formspree placeholder: `https://formspree.io/f/YOUR_FORM_ID`

### Option 1: Web3Forms (Recommended - Free, Simple)
**Cost**: Free (unlimited submissions)
**No signup required**
**Spam protection included**

1. Go to https://web3forms.com
2. Enter your email: arcforge@proton.me (since hello@arcforge.au forwards there)
3. Get your Access Key
4. Update index.html form action

### Option 2: Formspree (Free Tier)
**Cost**: Free (50 submissions/month)
**Requires account**

1. Sign up at https://formspree.io
2. Create new form
3. Get form endpoint: `https://formspree.io/f/YOUR_FORM_ID`
4. Update index.html form action

### Option 3: Self-Hosted on DO Droplet
**Complexity**: Medium
**Cost**: Free

Create a simple PHP/Python backend on your DO droplet:

```bash
# Install PHP
sudo apt install -y php php-fpm

# Create simple mail handler
sudo nano /srv/arcforge.au/contact.php
```

```php
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['message'];

    $to = 'hello@arcforge.au'; // Will forward to arcforge@proton.me
    $subject = 'Contact Form: ' . $name;
    $body = "From: $name\nEmail: $email\n\n$message";

    mail($to, $subject, $body);
    header('Location: /#contact?success=true');
}
?>
```

---

## Recommended Setup

**For simplicity and cost-effectiveness:**

1. **Email Forwarding**: Use Cloudflare Email Routing (Option 1)
   - Free, reliable, easy to setup
   - hello@arcforge.au → arcforge@proton.me

2. **Contact Form**: Use Web3Forms (Option 1)
   - Free, unlimited submissions
   - No account required
   - Spam protection built-in
   - Emails go to arcforge@proton.me

**Total Cost**: $0/month
**Setup Time**: 15-30 minutes
**Maintenance**: None

---

## Next Steps

1. Setup Cloudflare Email Routing (see steps above)
2. Get Web3Forms access key
3. Update index.html contact form with Web3Forms endpoint
4. Test both email forwarding and contact form
5. Update STATUS.md with completion status

---

## Sending FROM hello@arcforge.au

If you need to send emails FROM hello@arcforge.au (not just receive), options:

### Option A: Proton Mail Custom Domain (Paid)
- Proton Mail Plus: €3.99/month
- Allows sending/receiving from custom domain
- Professional email client

### Option B: SMTP Relay (Free tier available)
- SendGrid: 100 emails/day free
- Mailgun: 5,000 emails/month free
- Configure Proton Mail to send via SMTP relay

### Option C: Self-host mail server
- See Option 2 above (complex, not recommended)

**Recommendation**: For now, reply from arcforge@proton.me. Upgrade to Proton Plus if custom domain sending becomes important.
