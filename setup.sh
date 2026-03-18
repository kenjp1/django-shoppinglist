#!/bin/bash

# 1. System Updates & Essential Database Packages
echo "Installing MariaDB and dependencies..."
sudo apt-get update
sudo apt-get install -y mariadb-server libmariadb-dev pkg-config

echo " -- Starting MariaDB -- "
sudo service mariadb start

echo " -- Setting root user -- "
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '';"

# 2. Python & Pip Configuration
echo "Configuring Python environment..."
# Create symlink for pip if it doesn't exist
sudo ln -s /usr/bin/pip3 /usr/bin/pip || true

# Upgrade pip and install the specific Django version
pip install --upgrade pip
pip install 'django==5.2.11'
pip install mysqlclient

# 3. Finalize
echo "Setup complete!"