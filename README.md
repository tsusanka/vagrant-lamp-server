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
 - *just run:* `vagrant plugin install vagrant-hostmanager vagrant-vbguest nugrant vagrant-bindfs`

### Get ready

- clone this repository and enter the directory
- copy `.vagrantuser.example` and rename it to `.vagrantuser`
- set the working directory, for example `/home/tomas/Work/`
- if you have 32bit system, use the box settings hidden in the comments
- if you have 64bit system, make sure you have enabled the 64bit virtualization support
 - *If you forget to enable the virtualization support, the OS will freeze during the boot with no error message.*
- if you are on Linux, install `nfs-kernel-service` package

### Run it

- Run `vagrant up` and go make a coffee.

When the command finishes you can finally use it. After entering URL `http://v.l` into your browser you should see a welcome message.

## Use

The list of vagrant commands is listed in its [documentation](http://docs.vagrantup.com/v2/cli/index.html), however you most likely will need only those:

- `vagrant up` launches the OS
- `vagrant halt` shuts down the OS
- `vagrant ssh` SSH into the OS to control the OS
- `vagrant provision` updates OS' configuration according to Chef instructions
- `vagrant destroy` destroys the OS

## License

This work is licensed under the Apache License - see the LICENSE file for details. This work contains some of the community cookbooks which may be licensed under different license.
