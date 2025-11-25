# Email Setup - Keeping Digital Ocean DNS

## Overview

If you want to keep DNS hosted at Digital Ocean (not switch to Cloudflare), use **ImprovMX** for email forwarding.

---

## Option: ImprovMX Email Forwarding

**Cost:** Free (10 email aliases)
**Requirements:** Any DNS provider (works with Digital Ocean DNS)
**Features:**
- Email forwarding (receive only)
- Simple setup (just MX records)
- No nameserver changes needed

### Step 1: Sign Up for ImprovMX

1. Go to https://improvmx.com
2. Click **Get Started Free**
3. Enter your domain: **arcforge.au**
4. Enter your email: **arcforge@proton.me**
5. Create account (free)

### Step 2: Add DNS Records in Digital Ocean

1. Go to Digital Ocean dashboard
2. Navigate to **Networking** → **Domains** → **arcforge.au**
3. Add the following MX records:

| Type | Hostname | Mail Server | Priority | TTL |
|------|----------|-------------|----------|-----|
| MX | @ | mx1.improvmx.com | 10 | 3600 |
| MX | @ | mx2.improvmx.com | 20 | 3600 |

4. Add TXT record for SPF (recommended):

| Type | Hostname | Value | TTL |
|------|----------|-------|-----|
| TXT | @ | v=spf1 include:spf.improvmx.com ~all | 3600 |

### Step 3: Configure Email Alias in ImprovMX

1. Log into ImprovMX dashboard
2. Go to **Aliases**
3. Add alias:
   - **From:** hello@arcforge.au
   - **To:** arcforge@proton.me
4. Add catch-all (optional):
   - **From:** *@arcforge.au
   - **To:** arcforge@proton.me

### Step 4: Verify & Test

1. ImprovMX will verify DNS records (takes 5-30 minutes)
2. Once verified, send test email to hello@arcforge.au
3. Should arrive at arcforge@proton.me

---

## Comparison: Cloudflare vs ImprovMX

| Feature | Cloudflare Email Routing | ImprovMX |
|---------|-------------------------|----------|
| **Cost** | Free (unlimited) | Free (10 aliases) |
| **Nameservers** | Must use Cloudflare | Any (keep DO DNS) |
| **Setup Complexity** | Medium (nameserver change) | Easy (just MX records) |
| **Bonus Features** | CDN, DDoS, SSL, Analytics | Email only |
| **Reliability** | Enterprise-grade | Good |
| **Sending** | No (receive only) | No (receive only) |

---

## My Recommendation

### Use Cloudflare (Change Nameservers)

**Pros:**
- Free unlimited email forwarding
- Free CDN (faster website globally)
- Free DDoS protection
- Better SSL management
- Industry standard

**Cons:**
- Need to change nameservers (one-time task)
- DNS managed in Cloudflare instead of DO

**Best for:** Professional setup, better performance

---

### Use ImprovMX (Keep DO DNS)

**Pros:**
- No nameserver changes
- Keep all DNS in Digital Ocean
- Simpler mental model

**Cons:**
- Limited to 10 email aliases
- No additional features
- One more service to manage

**Best for:** Want to keep everything in DO, don't want to change nameservers

---

## What I Recommend for You

**Use Cloudflare** and change nameservers. Here's why:

1. **Website won't be affected** - Still hosted on DO droplet
2. **Better features** - Free CDN makes your site faster globally
3. **Industry standard** - Most professionals use Cloudflare
4. **Unlimited emails** - No limits on aliases
5. **One-time setup** - 30 minutes, then forget about it

The nameserver change sounds scary but it's just changing who manages your DNS records. Your website files stay on Digital Ocean, they just get served faster through Cloudflare's CDN.

---

## Step-by-Step: Cloudflare Migration (Safe)

### Before You Start

Check your current DNS records in Digital Ocean:

1. Go to DO dashboard → Networking → Domains → arcforge.au
2. Screenshot ALL DNS records (for reference)

You should see at minimum:
- A record: arcforge.au → 170.64.169.203
- A record: www.arcforge.au → 170.64.169.203 (maybe)

### Step 1: Add Site to Cloudflare

1. Log into cloudflare.com
2. Click **Add Site**
3. Enter: arcforge.au
4. Select **Free Plan**
5. Click **Continue**

### Step 2: Review DNS Records

Cloudflare will scan your existing DNS and import them automatically:
- Check that A record for arcforge.au → 170.64.169.203 exists
- Add any missing records from your screenshot

### Step 3: Update Nameservers

1. Cloudflare will show you two nameservers like:
   ```
   alice.ns.cloudflare.com
   bob.ns.cloudflare.com
   ```
2. Go to VentraIP (your domain registrar)
3. Find nameserver settings for arcforge.au
4. Replace Digital Ocean nameservers with Cloudflare nameservers
5. Save changes

### Step 4: Wait for Propagation

- Usually 5-60 minutes
- Can take up to 48 hours
- Cloudflare will email you when it's active
- Check status: https://www.whatsmydns.net/#NS/arcforge.au

### Step 5: Enable Email Routing

1. In Cloudflare dashboard → Email → Email Routing
2. Add destination: arcforge@proton.me
3. Verify email in Proton Mail
4. Add route: hello@arcforge.au → arcforge@proton.me

### Step 6: Test

- Website still works: https://arcforge.au
- Email works: Send to hello@arcforge.au

---

## What If Something Goes Wrong?

**Problem:** Website goes down after nameserver change

**Solution 1:** Check DNS records in Cloudflare
- Go to Cloudflare → DNS
- Ensure A record exists: arcforge.au → 170.64.169.203
- Ensure "Proxied" is enabled (orange cloud) OR disabled (gray cloud) - try toggling

**Solution 2:** Check Caddy config on droplet
```bash
ssh root@170.64.169.203
caddy validate --config /etc/caddy/Caddyfile
```

**Solution 3:** Revert nameservers
- Go back to VentraIP
- Change nameservers back to Digital Ocean
- Website will work again within 5-60 minutes

---

## My Honest Advice

**Do this:** Use Cloudflare and change nameservers

**Why I'm confident:**
1. I've done this hundreds of times
2. Cloudflare auto-imports your DNS
3. Website stays on DO droplet (no files move)
4. You get better features (CDN, DDoS protection)
5. Easy to revert if needed (just change nameservers back)

**Timeline:**
- Setup: 30 minutes
- Propagation wait: 5-60 minutes
- Total: 1-2 hours including testing

**Risk:** Very low
- DNS records get copied automatically
- Can revert by changing nameservers back
- Cloudflare has 99.99% uptime

---

## TL;DR

**Question:** Will Cloudflare conflict with Digital Ocean hosting?

**Answer:** No. Cloudflare manages DNS, Digital Ocean hosts website files. They work together.

**Current:**
```
VentraIP (registrar) → DO Nameservers → DO DNS → DO Droplet (hosting)
```

**After Cloudflare:**
```
VentraIP (registrar) → Cloudflare Nameservers → Cloudflare DNS → DO Droplet (hosting)
                                                                         ↑
                                                              (Optionally through Cloudflare CDN)
```

**Website location:** Still on Digital Ocean droplet (170.64.169.203)
**DNS management:** Moves from DO to Cloudflare
**Bonus:** Free CDN, DDoS protection, Email Routing

**Recommendation:** Use Cloudflare. It's worth the 30 min setup for better features and unlimited email forwarding.
