#!/bin/bash

# Timestamp for the log
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Output log path (corrected path)
log_dir="/home/ana/sox_control_validator/logs"
mkdir -p "$log_dir"

# Run OSQuery pack and save output
osqueryi --json "SELECT path, sha256 FROM hash WHERE path='/home/ana/sox_control_validator/testfiles/finreport.txt';" > "$log_dir/file_integrity_$timestamp.json"
osqueryi --json "SELECT * FROM logged_in_users;" > "$log_dir/logins_$timestamp.json"
osqueryi --json "SELECT * FROM suid_bin;" > "$log_dir/suid_$timestamp.json"
osqueryi --json "SELECT pid, port, address, protocol FROM listening_ports;" > "$log_dir/ports_$timestamp.json"

