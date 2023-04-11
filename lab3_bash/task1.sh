#!/bin/bash

# Prompt user for username
read -p "Enter username: " username

# Check if user already exists
if id "$username" >/dev/null 2>&1; then
    echo "Error: User $username already exists."
    exit 1
fi

# Prompt user for password
read -sp "Enter password: " password
echo
read -sp "Confirm password: " password_confirm
echo

# Check if password matches confirmation
if [ "$password" != "$password_confirm" ]; then
    echo "Error: Passwords do not match."
    exit 1
fi

# Create user with home directory
useradd -m "$username"

# Set password for user
echo "$username:$password" | chpasswd

# Print success message
echo "User $username has been created successfully with password set."

# Set up user's environment
# Add any additional setup commands here as needed
# For example:
# - Copying files to user's home directory
# - Setting up default environment variables
# - Installing specific software or packages
# - Setting up SSH keys, etc.