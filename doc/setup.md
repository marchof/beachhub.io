# System Setup

## System SD Card

The raspberry pi boots from a Mini SD card. I use this card exclusively for the system setup. All persistent
data is kept on an extra USB memory stick. This allows me to re-stage the system whenever I want to change
its configuration.

Prepare SD card with latest Raspbian light image (`yyyy-mm-dd-raspbian-stretch-lite.zip`) e.g. using e.g. Etcher on OSX.

Create empty file named `ssh` in root folder of the `boot` partition if the SD card to enable ssh login:

    $ touch /Volumes/boot/ssh

Insert the SD card into the raspberry pi.

## Raspberry Pi Setup With Ansible

Do initial setup for device name and user password (default password for fresh raspbian images is `raspberry`):

    $ ansible-playbook -i hosts -k init.yml
    
Reboot the raspberry pi and add a USB storage for Git repositories with label `DATA`.

Install beachhub software and configurations:
    
    $ ansible-playbook -i hosts install.yml

Add public key of user `tunnel` to web proxy host.
