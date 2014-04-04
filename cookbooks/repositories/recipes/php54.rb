#
# Cookbook Name:: repositories
# Recipe:: php54
#

# PHP 5.4 repository
# taken from https://gist.github.com/philsturgeon/4486187
apt_repository "php54" do
  uri "http://ppa.launchpad.net/ondrej/php5-oldstable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "E5267A6C"
end
