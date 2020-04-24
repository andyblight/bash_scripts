# Configure Kubuntu 18.04LTS PC

These are things that I like to do to set up my PC.

1. Clone bash_scripts repo.
1. Install the scripts etc. `bash_scripts/install.sh ubuntu18.04lts`
1. Install the apps I like to use `bash_scripts/app-installs/all.sh`
1. Disable auto updates (see below).

## Disable Automatic Updates from Command Line

The automatic update is a pain when you want to install something and have to wait until it has finished (too much like Windows for my liking).

Edit /etc/apt/apt.conf.d/20auto-upgrades:

```bash
$ sudo nano /etc/apt/apt.conf.d/20auto-upgrades
```

Once you have the file opened, switch off the Update-Package-Lists directive from 1 to 0 as shown below on Line 1:

```text
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "1";
```

Save and exit.

## Configure VMs

After first boot into new OS, clone this repo:

```bash
sudo apt install -y git gitk
mkdir ~/git
cd ~/git
git clone https://github.com/andyblight/bash_scripts.git
cd bash_scripts
./install.sh ubuntu18.04lts
cd desktop-installs
./install-git-tools.sh
```

Set git user name and email.
Install git tools.
Disable the auto update feature of ubuntu (very annoying when you want to shutdown the machine and have to wait).
Open new tab on konsole.  Should have my colour scheme for the prompt.  Then update everything using

```bash
upgrade.sh
```

Have a cup of tea while the upgrade happens. 

Then install the VBox additions. Insert guest additions CD from Devices menu. Then run:

```bash
sudo apt install -y build-essential perl
cd /media/andy/VBox_GAs_X.X.X
sudo ./VBoxLinuxAdditions.run
```
Restart.
Should be good to go!







