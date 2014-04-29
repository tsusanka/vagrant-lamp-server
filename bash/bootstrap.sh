#!/bin/bash

# check if chef is installed, if not install it
if ! type "chef-solo" &> /dev/null; then
	curl -L --silent https://www.opscode.com/chef/install.sh | sudo bash
	sudo bash -c 'echo "
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_TIMEOUT=1
	" >> /etc/default/grub; sudo update-grub'
fi
