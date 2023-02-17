#!/bin/bash

#Check that the script is being run by a user with administrative privileges
if [[ $EUID -ne 0 ]]; then
	echo "this script must be execute as root.";
	exit 1;
fi

# Function to choice configeration for user
choice_config() {
	local	config_opt;

	while true; do
		echo "Select a sudo configuration option for the user:"
		echo "1) Full sudo access (ALL command)"
		echo "2) Limited sudo access (specific command)"
		read -p "Enter your choice (1 or 2)" config_opt
		case $config_opt in
			1) echo "$username ALL=(ALL) ALL" >> /etc/sudoers.d/$username; return;;
			2) read -p "Enter the allowed command(s) (separated by commas): " allowed_commands
				echo "$username ALL=$allowed_commands" >> /etc/sudoers.d/$username
				return;;
			*) echo "Invalid choice, try again"
		esac
	done
}

# Chech username to add
while true; do
	read -p "Enter the username to add: " username
	if id $username >/dev/null 2>&1; then
		        echo "User $username already exists. Please enter a new username."
		else
			break
	fi
done

# Show the current list of sudo users
echo "Current sudo list"
grep -E "^[^#]+" /etc/sudoers.d/* | awk -F'/' '{print $NF}'

#Confirm the action(add) to do
while true; do
	read -p "Do you want to add the user $username to sudoers? (y/n): " choice
	case $choice in
		[Yy]*) choice_config; break;;
		[Nn]*) exit;;
		* ) echo "Please answer with 'y' or 'n'.";;
	esac
done

# Check the syntax of the sudoers file before applying changes
if ! visudo -c -f /etc/sudoers.d/$username; then
	echo "There is an error in the syntax of the sudoers file. Changes will not be applied."
    exit 1
fi

# Set permissions on the sudoers file
chmod 440 /etc/sudoers.d/$username

# Log the changes made to the sudoers file
echo "$(date): User $username was added to sudoers by $(whoami)." >> /var/log/sudoers.log

echo "Sudo configuration updated successfully."
