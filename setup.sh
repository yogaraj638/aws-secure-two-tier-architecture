#!/bin/bash

# ==========================================================
# Script to configure Apache Web Server on a Private Instance
# Project: AWS Secure Two-Tier Architecture
# ==========================================================

# 1. Update system packages
echo "Updating system..."
sudo yum update -y

# 2. Install Apache Web Server
echo "Installing Apache (httpd)..."
sudo yum install httpd -y

# 3. Start and Enable Apache to run on boot
echo "Starting Apache service..."
sudo systemctl start httpd
sudo systemctl enable httpd

# 4. Fix permissions for /var/www/html
# This allows the ec2-user to manage files without 'Permission Denied' errors
echo "Adjusting directory permissions..."
sudo chown -R ec2-user:ec2-user /var/www/html
sudo chmod -R 755 /var/www/html

echo "Setup complete! The server is now ready for index.html."
