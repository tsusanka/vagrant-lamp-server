Vagrant LAMP server
=======================

This is a LAMP server configuration for Vagrant. Chef is used for provisioning. The server should be used only for development purposes. The server contains:

- Ubuntu 12.04 (either 32bit or 64bit)
- apache 2.2
- PHP 5.4
- MySQL 5.5
- composer
- git, chef, screen

## Setup

### Install software

- install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
 - *Do NOT install version 4.3.10, it contains bug [#12879](https://www.virtualbox.org/ticket/12879) which breaks file sharing.*
- install [Vagrant](http://www.vagrantup.com/downloads.html)
- install Vagrant plugins
 - just run: `vagrant plugin install vagrant-hostmanager vagrant-vbguest`

### Get ready

- if you have 32bit system rename `Vagrantfile.32bit.example` to `Vagrantfile`
- if you have 64bit system and you enabled the 64bit virtualization support in BIOS rename `Vagrantfile.64bit.example` to `Vagrantfile`
 - *If you forget to enable the virtualization support the OS will freeze during the boot with no error message.*

### Run it

- Run `vagrant up` and go make a coffee.

## Use

The list of vagrant commands is listed in its [documentation](http://docs.vagrantup.com/v2/cli/index.html), however you most likely will need only those:

- `vagrant up` launches the OS
- `vagrant halt` shuts down the OS
- `vagrant ssh` SSH into the OS to control the OS
- `vagrant provision` updates OS' configuration according to Chef instructions
- `vagrant destroy` destroys the OS

## License

This work is licensed under the MIT License - see the LICENSE file for details.
