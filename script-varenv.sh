echo "Warning: This script will write information to your .bashrc file,"
echo "If you don't want this hit ctrl-c and export the variables manually to your environment":w

# Exporting rails mailer variables
if [ -z "$USER_NAME_GMAIL"]; then
	echo "Write your e-mail user (Will be necessary for rails mailer):"
	read user
	echo "export USER_NAME_GMAIL=$user" >> ~/.bashrc
fi

if [ -z "$PASSWORD_GMAIL"]; then
	echo "Write your e-mail password (Will be necessary for rails mailer):"
	read password
	echo "export PASSWORD_GMAIL=$password" >> ~/.bashrc
fi

exec bash