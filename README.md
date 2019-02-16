# pi-ansible

Experiments in using Ansible to configure a Raspberry Pi based home fileserver.

Does the world need yet another git repo containing ansible code to configure a raspberry pi? Almost certainly not. However I'm somebody who learns by doing and I'm happy to share with the world.

## Setup

These instructions assume that you have a fresh raspberry pi and it's connected to your network.

The easiest way to do this is to drop an 'ssh' file into the img directory before you copy it to the microSD card. For wireless you'll need to add a wpa_supplicant.conf file, see the instructions here on how to write one <https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md> or an example here <https://www.nathancourtney.me.uk/2018/05/10/raspberry-wifi.html>

## Playbooks

The playbooks are designed to be run in order.

**00-pi-first-boot.yml** This playbook is designed to be run exactly once. It replaces the default 'pi' user with an alternative admin account.

**01-ipservices.yml** Configures static IP address and installs dnsmasq

**02-fileserver.yml** This calls a list of roles in order, to get the fileserver up and running.

**03-ubiquiti-controller.yml** Installs Oracle Java from PPA and installs the Unifi controller software.
