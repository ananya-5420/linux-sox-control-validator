# 🛡️ SOX Linux Validator

A lightweight Linux automation project that simulates key internal control checks required for **SOX (Sarbanes-Oxley Act) compliance** using **OSQuery**, **Bash**, and **Cron**. This tool helps validate File Integrity, Access Control, Privilege Escalation Risks, and System Exposure — aligned with SOX ITGC (IT General Controls) requirements.

## 🔍 About the Project

This project simulates SOX-compliant auditing on a Linux system by:
- Monitoring file integrity (to detect unauthorized changes)
- Tracking user login activity
- Scanning for risky SUID binaries
- Reporting open network ports

All checks run via OSQuery and are scheduled using a simple Bash script with Cron.

## 🔐 SOX Compliance Relevance

| Control Area            | Check Implemented                       |
|-------------------------|------------------------------------------|
| **Change Management**   | File Integrity Monitoring (`hash`)       |
| **Access Control**      | Logged-in user tracking (`logged_in_users`) |
| **Privilege Escalation**| SUID Binary Scan (`suid_bin`)            |
| **System Hardening**    | Listening Ports Check (`listening_ports`) |

These logs serve as **evidence artifacts** of internal control validation — useful for SOX auditors and ITGC assessments.

## ✨ Features

- 📁 Monitors custom or sensitive files (e.g., `/etc/passwd` or simulated finance files)
- 🔒 Audits active user sessions
- 🧱 Detects binaries that can escalate privileges
- 🌐 Logs open ports and associated processes
- 📦 Outputs results as timestamped JSON logs
- 🧠 Beginner-friendly, script-based, and easy to extend

## ⚙️ How It Works

1. A Bash script (`run_sox_validator.sh`) runs 4 OSQuery checks
2. Each query result is exported as a `.json` log inside `logs/`
3. A Cron job automates this script at regular intervals
4. `.gitignore` excludes logs from GitHub uploads to maintain privacy

## 🚀 Getting Started

### ✅ 1. Clone the Repository
```bash
git clone https://github.com/ananya-5420/sox-linux-validator.git
cd sox-linux-validator
```
### ✅ 2. Make the Script Executable
```bash
chmod +x run_sox_validator.sh
```

### ✅ 3. Run Manually
```bash
./run_sox_validator.sh
```

### ✅ 4. Automate with Cron
```bash
crontab -e
```
Add this line to run every 30 mins:
```bash
*/30 * * * * /bin/bash /home/yourusername/sox-linux-validator/run_sox_validator.sh
```
