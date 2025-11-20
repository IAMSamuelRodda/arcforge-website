# Arc Forge Website - Status

**Purpose**: Deployment tracking for arcforge.au one-page website
**Lifecycle**: Living
**Last Updated**: 2025-11-20

---

## Current Status

**Deployment**: ✅ **LIVE**
**Domain**: ✅ **DNS Propagated** (https://arcforge.au)
**Design Quality**: ✅ **Production Ready** (7.5/10)
**ABN**: ✅ **Added** (66 913 411 628)

---

## Deployment Details

| Component | Status | Notes |
|-----------|--------|-------|
| **HTML/CSS** | ✅ Complete | Single-page responsive design |
| **Typography** | ✅ Enhanced | Space Grotesk + JetBrains Mono |
| **Backgrounds** | ✅ Enhanced | Gradient overlays for depth |
| **Animations** | ✅ Enhanced | Staggered fade-in effects |
| **Server Deployment** | ✅ Live | Deployed to DO droplet 170.64.169.203 |
| **Caddy Config** | ✅ Complete | HTTPS reverse proxy configured |
| **DNS Records** | ✅ Created | Digital Ocean DNS configured |
| **Nameservers** | ⏳ Pending | Awaiting VentraIP update |

---

## Pending Actions

### Critical (Revenue Blocking)

**1. Email Setup** 🔴 **HIGH PRIORITY**
- [ ] Set up email system for hello@arcforge.au
- [ ] **Requirement**: Free solution preferred (no paid service)
- [ ] **Options to evaluate**:
  - Cloudflare Email Routing (receive only, already used before)
  - Self-hosted on DO droplet (Nextcloud Mail? Postfix/Dovecot?)
  - Aliasing solution that allows sending FROM hello@arcforge.au
- [ ] **Use case**: Contact form submissions need to arrive at hello@arcforge.au
- [ ] **Nice-to-have**: Ability to send emails FROM hello@arcforge.au without paid service
- [ ] **Related**: Contact form (#8 below) depends on this

**2. Contact Form Backend** 🔴 **HIGH PRIORITY**
- [ ] Replace Formspree placeholder with functional contact form
- [ ] **Options to evaluate**:
  - Nextcloud Forms (if email setup uses Nextcloud)
  - Custom database (simple backend on DO droplet)
  - Third-party service (if free tier acceptable)
- [ ] **Recommendation needed**: Best free/self-hosted solution
- [ ] Store submissions in accessible format (spreadsheet/database)

### Content Fixes (Quick Wins)

**3. License - Self-Service Disclaimer** 📄
- [ ] Update business-cloud-template LICENSE section
- [ ] **Requirement**: Allow self-service use but disclaim liability
- [ ] Wording: "Use at own risk, no warranty, not liable if users mess up"
- [ ] Keep private repo but allow forking/self-deployment

**4. Remove Phone Number** 📞
- [ ] Remove phone references from arcforge.au website
- [ ] Remove phone from business-cloud-template README
- [ ] Email-only contact for now

**5. Update Location to Adelaide** 🌏
- [ ] Change "Sydney, Australia" → "Adelaide, Australia"
- [ ] Update on arcforge.au website
- [ ] Update in business-cloud-template contact info

**6. Fix GitHub Link** 🔗
- [ ] Website currently links to private do-vps-prod repo
- [ ] **Change to**: https://github.com/IAMSamuelRodda/business-cloud-template
- [ ] Ensure business-cloud-template is public (or make public)

**7. Remove/Hide Incomplete Project** 👁️
- [ ] "Offline-First Quoting System" project not complete
- [ ] Client not using it yet
- [ ] Remove from portfolio section on arcforge.au
- [ ] Replace with different completed project (if available)

**8. Update Monthly Support Wording** ⏱️
- [ ] Current: "1 hour automation consulting"
- [ ] **New wording**:
  - "Monthly discovery meeting (1 hour) to discuss automation opportunities"
  - "Full-day automation implementation session (8 hours)"
  - "13 days per year total (every 4 weeks)"
- [ ] Clarify: Not a fixed 1-hour limit, but discovery + implementation model

---

## Recent Changes

**2025-11-20:**
- ✅ Applied design improvements (typography, gradients, animations)
- ✅ Deployed to DO droplet at /srv/arcforge.au/
- ✅ Configured Caddy reverse proxy
- ✅ Created Digital Ocean DNS records
- ✅ Nameservers updated at VentraIP
- ✅ SSL certificates issued automatically (Let's Encrypt)
- ✅ Website LIVE at https://arcforge.au
- ✅ Added ABN: 66 913 411 628
- ✅ Pushed to GitHub: https://github.com/IAMSamuelRodda/arcforge-website

---

## Hardware Status

**Raspberry Pi Arrived** 🎉
- Arrived today (2025-11-20)
- Potential use cases:
  - Local development/testing
  - Self-hosted email relay (if using Postfix)
  - Alternative contact form backend
  - Portfolio demo project

---

## Design Improvements Applied

**Typography** (3/10 → 8/10):
- Added Space Grotesk (sans-serif) for headings
- Added JetBrains Mono (monospace) for technical elements
- Removed generic system fonts

**Backgrounds** (4/10 → 7/10):
- Hero: Light blue gradient (135deg)
- Services: Subtle gray gradient (180deg)
- Footer: Deep blue gradient (135deg)

**Motion** (4/10 → 6/10):
- Staggered fade-in animations for hero section
- Smooth transitions on interactive elements

**Overall Score**: 5/10 → 7.5/10 (+50% improvement)

---

## Technical Details

**Server**: Digital Ocean Droplet (170.64.169.203)
**Location**: /srv/arcforge.au/
**Reverse Proxy**: Caddy (Docker container)
**SSL**: Let's Encrypt (automatic via Caddy)
**Repository**: https://github.com/IAMSamuelRodda/arcforge-website

---

## Priority Order for Fixes

1. **Email setup** (blocking contact form and client communication)
2. **Contact form backend** (blocking lead generation)
3. **Content fixes** (quick wins: phone removal, location, GitHub link)
4. **License update** (legal protection for self-service)
5. **Monthly support wording** (clarity on service offering)
6. **Portfolio cleanup** (remove incomplete project)

---

## Email Setup - Recommendation Needed

**Context**:
- Need to receive emails at hello@arcforge.au
- Ideally send FROM hello@arcforge.au (without paid service)
- Contact form will submit to this email
- Previous experience: Cloudflare Email Routing (receive only)

**Options**:
1. **Cloudflare Email Routing** (Free, receive only)
   - Forward hello@arcforge.au → personal email
   - Still need solution for sending FROM hello@arcforge.au

2. **Self-hosted on DO droplet**
   - Postfix/Dovecot (traditional mail server - complex)
   - Nextcloud Mail (if adding Nextcloud to droplet)
   - Mailcow (Docker-based, full mail server)

3. **Hybrid approach**
   - Cloudflare for receiving
   - SMTP relay for sending (SendGrid free tier? Mailgun?)
   - Gmail/Outlook SMTP with custom FROM address?

**Recommendation needed**: Best free/simple solution for bi-directional email at hello@arcforge.au

---

## Next Status Update

**When**: After completing content fixes (items #3-8)
**Focus**: Email setup, contact form implementation, portfolio updates
