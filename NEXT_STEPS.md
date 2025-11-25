# Next Steps - Email & Form Configuration

## What's Been Done ✓

1. ✓ Fixed pricing card buttons (aligned to bottom, light green with dark hover)
2. ✓ Added hover effect to contact form SEND MESSAGE button
3. ✓ Removed dollar sign emoji from footer
4. ✓ Removed Services section from footer (left blank)
5. ✓ Made FAQ items collapsible (click to expand/collapse with [+]/[−] indicators)
6. ✓ Updated contact form to use Web3Forms
7. ✓ Created EMAIL_SETUP.md with full documentation

---

## What You Need to Do Next

### Step 1: Setup Cloudflare Email Routing (10-15 minutes)

**Purpose**: Forward hello@arcforge.au → arcforge@proton.me

1. Go to https://dash.cloudflare.com
2. Add arcforge.au (if not already added)
3. Go to **Email** → **Email Routing**
4. Click **Get started**
5. Add destination email: **arcforge@proton.me**
6. Check Proton Mail for verification email from Cloudflare (click verify link)
7. Add routing rule:
   - From: **hello@arcforge.au**
   - To: **arcforge@proton.me**
8. Test: Send email to hello@arcforge.au from another account

**DNS Records**: Cloudflare adds these automatically (no manual work needed)

---

### Step 2: Get Web3Forms Access Key (2 minutes)

**Purpose**: Make contact form work

1. Go to https://web3forms.com
2. Enter your email: **arcforge@proton.me**
   - (Emails will go here since hello@arcforge.au forwards to it)
3. Click **Get Access Key**
4. Copy the access key (looks like: `a1b2c3d4-e5f6-7890-abcd-ef1234567890`)

---

### Step 3: Update Contact Form with Access Key (1 minute)

**File**: `index.html` (line 584)

Change this:
```html
<input type="hidden" name="access_key" value="YOUR_ACCESS_KEY_HERE">
```

To this (with your actual key):
```html
<input type="hidden" name="access_key" value="a1b2c3d4-e5f6-7890-abcd-ef1234567890">
```

---

### Step 4: Deploy Updated Website (1 minute)

```bash
cd /home/x-forge/repos/arcforge-website
./deploy.sh
```

This uploads the updated index.html to your DO droplet.

---

### Step 5: Test Everything (5 minutes)

**Test 1: Email Forwarding**
1. Send email to hello@arcforge.au from personal account
2. Check arcforge@proton.me
3. Should arrive within seconds

**Test 2: Contact Form**
1. Go to https://arcforge.au/#contact
2. Fill out form with test data
3. Click **Send Message**
4. Check arcforge@proton.me
5. Should receive formatted contact form submission

**Test 3: FAQ Collapse**
1. Go to https://arcforge.au/#faq
2. Click on any FAQ question
3. Should expand to show answer with [−] indicator
4. Click again to collapse with [+] indicator

**Test 4: Button Hovers**
1. Hover over pricing "Get Started" buttons
2. Should change from light green to dark with border
3. Hover over "Send Message" button
4. Should change from light green to dark with border

---

## Expected Results

### Email Flow
```
Customer sends to → hello@arcforge.au
                    ↓ (Cloudflare Email Routing)
You receive at   → arcforge@proton.me
```

### Contact Form Flow
```
Customer fills form → Submits
                     ↓ (Web3Forms API)
You receive at    → arcforge@proton.me
Subject:          → "New Contact Form Submission - arcforge.au"
```

---

## Troubleshooting

**Problem**: Email to hello@arcforge.au bounces
- **Solution**: Check Cloudflare Email Routing is enabled
- **Solution**: Verify arcforge@proton.me in Cloudflare
- **Solution**: Check MX records are set (Cloudflare does this automatically)

**Problem**: Contact form doesn't work
- **Solution**: Check Web3Forms access key is correct in index.html line 584
- **Solution**: Check arcforge@proton.me is verified with Web3Forms
- **Solution**: Check browser console for errors (F12 → Console)

**Problem**: FAQs don't expand
- **Solution**: Hard refresh browser (Ctrl+Shift+R or Cmd+Shift+R)
- **Solution**: Clear cache and reload

---

## Cost Summary

| Service | Cost | What It Does |
|---------|------|--------------|
| Cloudflare Email Routing | **Free** | Forwards hello@arcforge.au → arcforge@proton.me |
| Web3Forms | **Free** | Handles contact form submissions (unlimited) |
| Domain (arcforge.au) | **$0** | Already owned |
| Hosting (DO Droplet) | **$0** | Already running |

**Total Additional Cost**: $0/month

---

## Optional: Sending FROM hello@arcforge.au

Currently you can:
- ✓ Receive at hello@arcforge.au (forwards to Proton)
- ✗ Send FROM hello@arcforge.au

If you need to send FROM hello@arcforge.au:

**Option A**: Proton Mail Plus (€3.99/month)
- Add custom domain to Proton
- Send and receive from hello@arcforge.au
- Professional email client

**Option B**: Reply from arcforge@proton.me (Free)
- Customers see reply from arcforge@proton.me
- No additional cost
- Good enough for most small businesses

**Recommendation**: Start with Option B, upgrade to A if needed later.

---

## Files Modified

1. `index.html`:
   - Pricing buttons: flexbox alignment, hover effects
   - Contact form: Web3Forms integration
   - FAQ: Collapsible with JavaScript
   - Footer: Removed $ sign, removed Services section

2. `EMAIL_SETUP.md`:
   - Full documentation for email setup options
   - Step-by-step Cloudflare Email Routing guide
   - Contact form configuration options

3. `NEXT_STEPS.md`:
   - This file - quick action guide

---

## Timeline

**Total Time**: ~20-30 minutes

1. Cloudflare Email Routing: 10-15 min
2. Web3Forms key: 2 min
3. Update index.html: 1 min
4. Deploy: 1 min
5. Testing: 5 min

---

## Support

If you run into issues:
1. Check EMAIL_SETUP.md for detailed troubleshooting
2. Web3Forms docs: https://docs.web3forms.com
3. Cloudflare Email Routing docs: https://developers.cloudflare.com/email-routing/

---

**Ready to go!** Follow Steps 1-5 above and you'll have a fully functional contact system.
