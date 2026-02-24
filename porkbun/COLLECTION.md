# Skill Catalog: Porkbun for Pragmatists

## 🔐 porkbun-setup
Initial configuration skill. Handles secure storage of API credentials and connectivity testing.
- **When to use**: First time setup, connection issues, or rotating keys.
- **Key capability**: `test-connection.sh` verifies API access without exposing keys.

## 📋 porkbun-domains
Domain inventory management.
- **When to use**: "List my domains", "When does my domain expire?", "Check if my domain handles are locked".
- **Key capability**: Status reporting with actionable alerts for expiring domains.

## 🌐 porkbun-dns
The core DNS management utility.
- **When to use**: "Add an A record", "Setup email records", "Add a subdomain".
- **Philisophy**: Translates user intent ("Point to X") into technical records (A/CNAME/MX) while explaining why.

## 🔒 porkbun-ssl
SSL certificate management.
- **When to use**: "Get an SSL cert for my domain", "Download my certificates".
- **Key capability**: Fetches certificate bundles and organizes them for server deployment.

## ↩️ porkbun-forwards
URL forwarding and redirection.
- **When to use**: "Redirect my-domain.com to google.com", "Forward old site to new site".
- **Key capability**: Handles temporary vs. permanent redirects with SEO context.

## 🏗️ porkbun-hosting-blueprints
Complete DNS recipes for hosting platforms.
- **When to use**: "Configure DNS for Vercel/Netlify/GitHub Pages".
- **Key capability**: Applies all required records in one step with verification.
- **Blueprints**: Vercel, Cloudflare Pages, GitHub Pages, Netlify, Railway, Self-hosted.
