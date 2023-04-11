#!/bin/bash

# Function to display number of processes running by system users
get_process_count() {
  process_count=$(ps aux | awk '$1 != "USER" && $1 != "root" {++count} END {print count}')
  echo "Number of processes running by system users: $process_count"
}

# Function to display RAM status
get_ram_status() {
  ram_status=$(free -h | awk '/^Mem/ {print "Total: " $2 ", Used: " $3 ", Free: " $4}')
  echo "RAM status: $ram_status"
}

# Function to display disk usage
get_disk_usage() {
  disk_usage=$(df -h | awk '$NF == "/" {print "Total: " $2 ", Used: " $3 ", Free: " $4}')
  echo "Disk usage: $disk_usage"
}

# Function to display network interface information
get_network_info() {
  network_info=$(ip addr show)
  echo "Network interface information:"
  echo "$network_info"
}

# Main function to display system information
get_system_info() {
  echo "System Information:"
  echo "===================="
  get_process_count
  get_ram_status
  get_disk_usage
  get_network_info
}

# Check if script is executed via SSH
if [ -n "$SSH_TTY" ]; then
  get_system_info
else
  echo "This script is intended to be run via SSH."
  exit 1
fi