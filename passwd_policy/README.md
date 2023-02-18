# Password Policy Script
This script sets a password policy in the /etc/login.defs and /etc/pam.d/common-password files on a Linux system. It sets the following policy:

* Maximum password age: 90 days
* Minimum password age: 7 days
* Password warning age: 14 days
* Encryption method: SHA512
* Password remember count: 5
* Minimum password length: 10
* Require at least one uppercase letter, one lowercase letter, one digit, and one special character
* Maximum number of repeating characters: 3
* Maximum number of consecutive characters: 7
* Reject username in the password
* Enforce password policy for root user
## Usage
Make sure you have root privileges before running this script.

Download the script and make it executable:
```
  chmod +x password_policy.sh
```
Run the script:
```
  sudo ./password_policy.sh
```
The script will create backup files of the original /etc/login.defs and /etc/pam.d/common-password files with the extension .bak.

The script will log all the changes made in the /var/log/password_policy.log file.

## Customization
You can customize the password policy by modifying the variables in the script. For example, you can change the maximum password age by modifying the PASS_MAX_DAYS variable in the /etc/login.defs file.

## Log
The log file is located at /var/log/password_policy.log. It records the date and time when the backup files are created, when the password policy is set, and when the script successfully finishes running.
