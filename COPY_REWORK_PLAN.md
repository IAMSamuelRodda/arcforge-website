# Arc Forge Website Copy Rework Plan

**Target Avatar**: Sam - Small Business Owner (Self-Managing)
**Created**: 2025-11-27
**Status**: Draft - Awaiting Thursday validation demo

---

## The Problem We're Solving

Sam is a small business owner ($100k-$500k revenue, 0-5 employees) who:
- Does their own books because they can't justify a bookkeeper yet
- Resents every minute spent on admin instead of actual work
- Uses Xero, maybe some cloud tools, paying subscriptions everywhere
- Feels like they're slowly "going corporate" with all these enterprise tools
- Wants independence, not vendor lock-in
- Needs someone to "just handle the tech" without making them feel dumb

**Sam's emotional state**: Overwhelmed, resentful of admin time, anxious about compliance, wants peace of mind

---

## Current vs Target Messaging

| Section | Current (Tech Team Focus) | Target (Sam Focus) |
|---------|---------------------------|-------------------|
| Headline | "Control Your Own Infrastructure" | "Stop Paying Through the Nose for Business Tools" |
| Subhead | "Open source self-hosted infrastructure" | "Your own business systems. One price. Done." |
| Value prop | Data ownership, customization | Time savings, cost savings, independence |
| Language | VPS, Docker, Terraform, SSL | "Your stuff", "sorted", "handled" |
| Tone | Technical, developer-friendly | Mate who knows IT, plain English |
| Fear addressed | Vendor lock-in, data breaches | Subscription creep, losing control, complexity |

---

## Hero Section Variants

### Variant A: "The Subscription Revolt"
**Headline**: Stop Feeding the Subscription Beast
**Subhead**: Your business tools. Your server. One setup fee, then ~$75/month forever.
**Body**: Every month you're paying Dropbox, Google, password managers, this tool, that tool. It adds up. What if you just... owned your stuff? We set it up. You keep it. No monthly "surprise, we raised prices" emails ever again.
**CTA**: "See What You'd Save" / "How It Works"

### Variant B: "The Independence Play"
**Headline**: Your Business. Your Rules. Your Server.
**Subhead**: All your business tools on infrastructure you actually own.
**Body**: Big tech wants you renting forever. We help you buy. File storage, passwords, calendars, automation - all yours, running on a server with your name on it. Set up once, run forever.
**CTA**: "Get Your Own Setup" / "What's Included"

### Variant C: "The IT Mate"
**Headline**: Like Having an IT Guy (Without the Salary)
**Subhead**: We set up your business systems properly. Then you're free.
**Body**: You didn't start a business to manage tech subscriptions. Tell us what you need - file sharing, passwords, calendars, remote access - and we'll get it running on your own server. You pay the hosting (~$75/mo), not ten different companies.
**CTA**: "Let's Sort It" / "See the Options"

---

## Comparison Section Rework

### Current Problems:
- "Control & Ownership" / "Data Privacy" - too abstract for Sam
- Technical terms like "multi-tenant databases"
- Focuses on what Sam doesn't care about (customization)

### Proposed Rework:

**New Header**: "What Changes When You Own Your Stuff"

| What You Get | Your Own Setup | Paying Everyone Else |
|--------------|----------------|---------------------|
| Monthly cost | ~$75 flat | $400-600 (and rising) |
| Price surprises | Never | "We're updating our pricing..." |
| Your files | On YOUR server | On their servers, their rules |
| When they shut down | Doesn't affect you | Scramble to migrate |
| Access your data | Anytime, it's yours | Subject to their terms |

**Savings callout** (keep but simplify):
- Remove the math equation visual
- Simple: "Most small businesses save $5,000+ per year"
- Add: "That's a holiday. Or new equipment. Or just... yours."

---

## Pricing Section Rework

### Current Problems:
- "Essential/Professional/Premium" sounds corporate
- Feature lists use tech jargon (VPS provisioning, Docker, SSL)
- Prices ($1,200-$3,200) presented without context

### Proposed Rework:

**Tier Names** (Options):
- Option A: "Starter / Standard / Complete"
- Option B: "Just the Basics / Full Setup / Everything"
- Option C: "Get Going / Get Sorted / Get Everything"

**Feature Language Translation**:

| Current | Sam-Friendly |
|---------|--------------|
| VPS provisioning & Docker setup | We set up your server |
| Core services: Nextcloud, Vaultwarden | File storage + password manager |
| SSL certificates & security | Secure and encrypted (obviously) |
| n8n workflow automation | Automate repetitive tasks |
| VPN for remote access | Access your stuff from anywhere |
| Monitoring & alerting | We'll know if something breaks |

**Price Context** (add to each tier):
- "That's less than 3 months of what you're paying now"
- "Pays for itself in [X] months"

---

## FAQ Rework

### Questions Sam Actually Has:

1. **"Do I need to be technical?"**
   - Current answer is okay but too long
   - Shorter: "No. We handle all the tech. You get a login."

2. **"What if something breaks?"**
   - Address the real fear: being stranded
   - "The systems are designed to run without babysitting. If something does break, we're a message away. Optional support packages available."

3. **"Can I still use Xero / my accountant / [existing tool]?"**
   - NEW FAQ - Sam uses Xero, needs to know this doesn't replace it
   - "Yes. This handles your files, passwords, and business operations - not your accounting. Keep using Xero (or whatever you use)."

4. **"What's the catch? Why is this cheaper?"**
   - Address skepticism directly
   - "No catch. SaaS companies charge you monthly forever because that's their business model. We charge once to set it up, then you just pay hosting costs. We make money from setup, not locking you in."

5. **"What if I want to leave or change things?"**
   - Independence is the whole point
   - "It's your server. Hire someone else, manage it yourself, or ask us for changes. You're never locked in."

### FAQs to Remove/Deprioritize:
- "Can this replace Google Workspace?" - too comparative, makes it feel like a compromise
- Technical support period details - move to fine print

---

## Portfolio Section Rework

### Current Problem:
- "Private Cloud Setup" and "Accounting Assistant" are project names, not benefits
- Tech tags (Terraform, Docker, Claude SDK) mean nothing to Sam
- "Demonstrates advanced AI integration" - Sam hates AI talk

### Proposed Approach:

**Option A: Remove Portfolio Entirely**
- Sam doesn't care about your past work
- Replace with testimonials (after Thursday validation)
- Or: "What You Get" visual/checklist instead

**Option B: Reframe as "What We've Built for Businesses Like Yours"**
- Remove tech tags
- Focus on outcomes: "A dental practice now pays $75/mo instead of $600"
- No GitHub links (confusing for Sam)

**Option C: Move to Separate Page**
- Keep hero focused on Sam
- "For the technically curious" link in footer
- Preserves credibility for tech-aware visitors

---

## Tone & Language Guidelines

### Words TO Use:
- "your stuff", "your files", "your business"
- "sorted", "handled", "set up", "done"
- "simple", "straightforward", "clear"
- "save", "keep", "own"
- "peace of mind", "independence", "freedom"

### Words to AVOID:
- "infrastructure", "self-hosted", "deployment"
- "AI", "machine learning", "automation" (or use sparingly)
- "enterprise", "scalable", "robust", "comprehensive"
- "cloud" (confusing - everything is "cloud" now)
- "solution", "leverage", "optimize"

### Tone:
- Straight-talking mate, not salesperson
- Confident but not pushy
- Acknowledges Sam's frustration
- Never talks down or over-explains

---

## Open Questions for Thursday Demo

1. What triggered your interest in owning your systems vs subscriptions?
2. Which subscriptions annoy you most? (validate pain points)
3. Would you rather pay more upfront and less ongoing, or spread costs?
4. What would make you trust someone to set this up?
5. When you hear "your own server" - does that sound good or scary?

---

## Implementation Plan

### Phase 1: After Thursday Validation
- Select winning hero variant based on feedback
- Finalize tone direction
- Write full copy draft

### Phase 2: Copy Implementation
- Update index.html with new copy
- Test on mobile (Sam checks stuff on phone)
- Get feedback from 1-2 more potential Sams

### Phase 3: Supporting Elements
- Testimonials (if available)
- Simple "How It Works" visual
- Calculator tool? ("See what you'd save")

---

## Financial Analysis Required

Before launching to Sam, need to confirm:
- [ ] Server costs per user (shared vs dedicated)
- [ ] Sustainable price point at $20-50/mo (if that's a goal)
- [ ] Setup fee that covers our time but doesn't scare Sam
- [ ] Support costs for post-setup

---

## Notes

- The zero-agent accounting product is a separate play - could be offered as add-on to Sam later
- Thursday demo is critical validation - don't go live before then
- Consider A/B testing headlines if possible
