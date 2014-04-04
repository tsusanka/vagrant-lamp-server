# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "baseubuntu12.04"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 50080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "10.11.12.13"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "/home/tomas/Prace/", "/var/www", :nfs => true

  # Simple bash script to check if Chef is installed
  config.vm.provision "shell", path: "bash/bootstrap.sh"

  # After Chef is installed, let Chef do the magic
  #
  # default cookbook_path is ./cookbooks/ so no need to configure that
  config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = ["cookbooks/", "berks-cookbooks/"]
     chef.add_recipe "apt"
     chef.add_recipe "apache2"
     chef.add_recipe "apache2::mod_php5"
     chef.add_recipe "dotdeb::php54"
     chef.add_recipe "php"
     chef.add_recipe "virtual-hosts"
  end

  config.vm.provider "virtualbox" do |v|
     v.memory = 1024
  end

end
