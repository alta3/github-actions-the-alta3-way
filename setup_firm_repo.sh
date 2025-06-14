#!/bin/bash

# setup_firm_repo.sh
# Creates the FIRM repository structure for the third iteration of the passwordless auth server.
# Run this script in your project root to initialize all directories and files.
# Use with VSCode to visualize the project layout.
# Generated for draft-feeser-firm-auth-08, with Mailgun webhooks, Gmail IMAP fallback, and admin UI log viewer.

# Exit on error
set -e

echo "✅ Creating FIRM repository structure..."

# Root files
touch main.go           # Entry point, Gin router setup
touch firm.conf        # Configuration file for settings initialization (e.g., cleanup_interval=10s)
touch README.md        # Setup guide for Mailgun, Gmail, PostgreSQL, Tailwind (to be written post-testing)
touch go.mod           # Go module definition
touch go.sum           # Go module checksums

# Admin directory
mkdir -p admin
touch admin/admin.go   # Admin UI, dashboard, routes, bootstrap endpoint, real-time log viewer

# Database directory
mkdir -p db
touch db/postgres.go   # PostgreSQL setup, queries, migrations, package-level db connection
touch db/schema.sql    # Initial schema (email_verifications, tokens, settings, etc.) and migrations

# Email handling directory
mkdir -p email
touch email/inbound.go # Mailgun webhook and Gmail IMAP (IDLE) handlers for inbound email processing
touch email/smtp.go    # Optional SMTP for sending welcome emails

# HTTP handlers directory
mkdir -p handlers
touch handlers/signup.go     # POST /signup handler for initiating verification
touch handlers/refresh.go    # POST /refresh handler for JWT refresh
touch handlers/revoke.go     # POST /revoke handler for JWT revocation
touch handlers/test.go       # POST /test, /test/inbound for testing signup and inbound flows
touch handlers/middleware.go # Middleware for rate limiting, IP logging, JWT validation, db injection

# Utility functions directory
mkdir -p utils
touch utils/ip.go       # IPNormalization, NormalizeCIDR for IP handling
touch utils/token.go    # FIRM token and JWT generation/validation
touch utils/validate.go # Validation for settings (e.g., cleanup_interval, rate_limit_attempts_per_hour)

# WebSocket directory
mkdir -p websocket
touch websocket/notify.go # WebSocket notifications for verification success and admin log streaming

# Scripts directory
mkdir -p scripts
touch scripts/test.sh      # Command-line test script for /signup and /inbound
touch scripts/bootstrap.sh # Script to initialize admin_emails and settings via /admin/bootstrap
chmod +x scripts/*.sh      # Make scripts executable

# Static assets directory
mkdir -p static/css
touch static/css/tailwind.css # Tailwind CSS output (built locally via CLI)

# HTML templates directory
mkdir -p templates/admin
touch templates/admin/dashboard.html  # Admin dashboard template
touch templates/admin/subnets.html    # Subnet management template
touch templates/admin/ip.html         # IP activity template
touch templates/admin/emails.html     # Email management template
touch templates/admin/settings.html   # Settings form template
touch templates/admin/logs.html       # Real-time inbound email log viewer template

echo "✅ Repository structure created successfully!"
echo "📁 Open in VSCode to explore the layout."
echo "🔍 Files are empty placeholders; implementation will follow."
echo "🚀 Run 'go mod init github.com/yourusername/firm' to initialize Go module."
