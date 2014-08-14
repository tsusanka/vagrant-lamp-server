#
# Cookbook Name:: opcode
# Recipe:: disable
# Very simple recipe to disable opcache
#

link "opcache-disable" do
	target_file node['opcache']['conf_path']
	action :delete
end
