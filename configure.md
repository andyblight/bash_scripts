# Configure Kubuntu 818.04LTS PC

These are things that I like to do to set up my PC.

1. Clone bash_scripts repo.
1. Install the scripts etc. `bash_scripts/install.sh ubuntu18.04lts`
1. Install the apps I like to use `bash_scripts/app-installs/all.sh`
1. Disable auto updates (see below).

## Disable Automatic Updates from Command Line

The automatic update is a pain when you want to install something and have to wait until it has finished (too much like Windows for my liking).

Edit /etc/apt/apt.conf.d/20auto-upgrades:

$ sudo nano /etc/apt/apt.conf.d/20auto-upgrades

Once you have the file opened, switch off the Update-Package-Lists directive from 1 to 0 as shown below on Line 1:

APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "1";

Save and exit.
