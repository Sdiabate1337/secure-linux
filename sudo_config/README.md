
# Bash Script for Adding User to Sudoers
This Bash script is designed to add a user to the sudoers file in a secure manner. It provides options to grant the user full or limited sudo access and confirms the action with the user before making any changes to the system.

## Prerequisites
This script requires administrative privileges to run. The user executing the script must have root access.

## How to Use
* Download the script to your local machine.
* Open the terminal and navigate to the directory where the script is saved.
* Run the script with the following command: sudo ./sudo_config.sh
* Follow the prompts to add a user to the sudoers file.

## Script Functionality
The script performs the following tasks:

* Checks that the script is being run by a user with administrative privileges.
* Prompts the user for the username of the user to be added to the sudoers file.
* Checks if the user already exists on the system.
* Displays the current list of users with sudo access.
* Asks the user to confirm if they want to add the specified user to the sudoers file.
* Provides options for granting full or limited sudo access to the user.
* Validates the syntax of the sudoers file before making changes.
* Sets permissions on the sudoers file to prevent unauthorized access.
* Logs the changes made to the sudoers file in the system log.

## Security Considerations
This script has been designed with security in mind. It uses best practices for modifying the sudoers file to prevent unauthorized access. The script checks the syntax of the sudoers file before making changes, and sets secure file permissions to prevent unauthorized modification.ile

