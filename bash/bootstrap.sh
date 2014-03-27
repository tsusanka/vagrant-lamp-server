#!/bin/bash

# check if chef is installed, if not install it
if ! type "chef-solo" &> /dev/null; then
	curl -L --silent https://www.opscode.com/chef/install.sh | sudo bash
fi
