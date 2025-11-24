#!/bin/bash

# Arc Forge Website Deployment Script
# Deploys static website to Digital Ocean droplet

set -e  # Exit on error

# Configuration
DROPLET_IP="170.64.169.203"
DROPLET_USER="root"
REMOTE_PATH="/srv/arcforge.au"
LOCAL_FILE="index.html"

echo "🚀 Deploying Arc Forge website to production droplet..."

# Check if index.html exists
if [ ! -f "$LOCAL_FILE" ]; then
    echo "❌ Error: $LOCAL_FILE not found"
    exit 1
fi

# Create remote directory if it doesn't exist
echo "📁 Creating remote directory..."
ssh ${DROPLET_USER}@${DROPLET_IP} "mkdir -p ${REMOTE_PATH}"

# Copy index.html to droplet
echo "📤 Uploading index.html..."
scp ${LOCAL_FILE} ${DROPLET_USER}@${DROPLET_IP}:${REMOTE_PATH}/

# Set correct permissions
echo "🔒 Setting permissions..."
ssh ${DROPLET_USER}@${DROPLET_IP} "chmod 644 ${REMOTE_PATH}/index.html"
ssh ${DROPLET_USER}@${DROPLET_IP} "chown -R caddy:caddy ${REMOTE_PATH}"

# Reload Caddy (if Caddy is managing this site)
echo "🔄 Reloading Caddy..."
ssh ${DROPLET_USER}@${DROPLET_IP} "caddy reload --config /etc/caddy/Caddyfile" || echo "⚠️  Caddy reload failed (you may need to configure Caddyfile first)"

echo "✅ Deployment complete!"
echo ""
echo "🌐 Website should be live at: https://arcforge.au"
echo ""
echo "Next steps:"
echo "1. Configure Caddy (see CADDY_CONFIG.md)"
echo "2. Set up Formspree form endpoint"
echo "3. Add your ABN to footer"
echo "4. Test the site!"
