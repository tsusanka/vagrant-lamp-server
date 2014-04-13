#
# Cookbook Name:: virtual-hosts
# Recipe:: default
#

# we need apache to configure apache :)
include_recipe "apache2"

# web_app is a definition, see apache2/definitions/web_app.rb
# it creates entry in sites-available and enables that site
web_app 'vagrant' do
  server_name 'v.l'
  server_aliases ['www.v.l']
  docroot '/var/www/'
  directory_options 'FollowSymLinks Indexes'
  allow_override 'All'
end
