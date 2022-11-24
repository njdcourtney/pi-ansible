# Pi Ansible

This is a collection of tool to configure various things on a Raspberry Pi. 

## History
Originally this was used to configure a Docker Swarm cluster on Rasbian Buster but I'm rewriting it for Rasbian Bullseye. 

All the previous code is in the 'Buster' folder, or in the 'Buster' branch on Github.

## Prepare the Rasbian Image.

The easiest way to do this is my using the Raspberry Pi Imager and using the 64 bit Lite image. You should open the advanced options and set:

1. The WiFi details (if you're using WiFi)
1. Change the default admin username and password
1. Enable SSH, and ideally enable SSH key based authentication.

## Playbooks

1. pb-core.yml - contains tasks that should be run on any Pi
1. pb-format-disks.yml - deletes any existing partitions and installs an XFS filesystem