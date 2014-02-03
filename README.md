# hinemos-chef

Vagrant+chef-solo+Bershelf for Hinemos (MultiFunctional-Monitor-Server)

## Hinemos

MultiFunctional-Monitor-Server for Machines. 

It's Monitor-Server is OSS-Provided by NTT Data .Inc in Japan for Virtual-Computing/Networking Environment.

It monitors any machines on any environment , Physical/Virtual.

## Vagrant-ChefSolo-Berkshelf code for Creating Hinemos Server

Hinemos is needed to monitor servers in the network, but Installing Hinemos requires some effort to download some files and OS-Serving Packages.

Then, create Hinemos server with some shell commands in ten or more minutes!

## PreRequisite

* git
* ruby > 1.9.3
* vagrant > 1.4
* chef

## How To Run 

just clone this repository-code and in that code directory, kick commands below

    $ git clone https://this-repository
    $ berks install --path cookbooks
    $ vagrant up
