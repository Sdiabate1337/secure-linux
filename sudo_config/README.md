
# Sudo config automation script

The Bash script we developed is a useful tool for system administrators who want to add a new user with sudo privileges. The script allows the administrator to choose between two sudo configuration options: full access to all commands or limited access to specific commands. The script also checks the syntax of the sudoers file before applying changes and logs the changes to a journal file for better traceability.

Key points:    
* Admin privileges verification: The script checks that the user is running the script as root.
* Adding a user: The script allows the administrator to enter the username to be added.
* Selecting sudo configuration: The script offers two sudo configuration options for the added user - full access or limited access to specific commands.
*Sudoers file syntax verification: The script checks that the syntax of the sudoers file is correct before applying changes
* Logging of changes: The script logs changes made to the sudoers file to a journal file for better traceability.

Therefore, this script is a useful tool for system administrators who are looking to automate the addition of users with sudo privileges, while ensuring the security and traceability of changes made to the sudoers file

