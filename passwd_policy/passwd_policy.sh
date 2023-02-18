#!/bin/bash

#You can change the options to fit your needs

# Set log file path
LOGFILE="/var/log/password_policy.log"

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# Backup the original files and log it
cp -p /etc/login.defs /etc/login.defs.bak
cp -p /etc/pam.d/common-password /etc/pam.d/common-password.bak
echo "$(date '+%Y-%m-%d %H:%M:%S') Backup of /etc/login.defs and /etc/pam.d/common-password created" >> $LOGFILE

# Set the password policy in the /etc/login.defs file and log it
sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS 90/' /etc/login.defs
sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS 7/' /etc/login.defs
sed -i 's/^PASS_WARN_AGE.*/PASS_WARN_AGE 14/' /etc/login.defs
sed -i 's/^ENCRYPT_METHOD.*/ENCRYPT_METHOD SHA512/' /etc/login.defs
echo "$(date '+%Y-%m-%d %H:%M:%S') Password policy set in /etc/login.defs" >> $LOGFILE

# Set the password policy in the /etc/pam.d/common-password file and log it
sed -i '/^password.*pam_unix.so/s/$/ remember=5/' /etc/pam.d/common-password
if ! grep -q '^password requisite pam_cracklib.so' /etc/pam.d/common-password; then
    sed -i '1i password requisite pam_cracklib.so retry=3 minlen=10 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1 difok=7 maxrepeat=3 reject_username enforce_for_root' /etc/pam.d/common-password
    echo "$(date '+%Y-%m-%d %H:%M:%S') Password policy set in /etc/pam.d/common-password" >> $LOGFILE
fi

# Notify the user that the password policy has been set and log it
echo "Password policy has been set"
echo "Changes made to the following files:"
echo "- /etc/login.defs"
echo "- /etc/pam.d/common-password"
echo ""
echo "Backup files created with the following names:"
echo "- /etc/login.defs.bak"
echo "- /etc/pam.d/common-password.bak"
echo "$(date '+%Y-%m-%d %H:%M:%S') Password policy successfully set" >> $LOGFILE

