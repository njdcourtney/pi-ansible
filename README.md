# pi-ansible

Experiments in using Ansible to configure a Raspberry Pi based home fileserver.

Does the world need yet another git repo containing ansible code to configure a raspberry pi? Almost certainly not. However I'm somebody who learns by doing and I'm happy to share with the world.

## Setup

These instructions assume that you have a fresh raspberry pi and it's connected to your network.

The easiest way to do this is to drop an 'ssh' file into the img directory before you copy it to the microSD card. For wireless you'll need to add a wpa_supplicant.conf file, see the instructions here on how to write one <https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md> or an example here <https://www.nathancourtney.me.uk/2018/05/10/raspberry-wifi.html>

## Playbooks

The playbooks are designed to be run in order.

**00-pi-first-boot.yml** adds a new admin user, this is designed to replace the default 'pi' user because everybody in the world knows that username exists.

**01-pi-fileserver.yml** This calls a list of roles in order, to get the fileserver up and running.

## Roles

Several roles are defined:

**basic_config** This contains all the low level things that I do to every server. It sets the timezone and the hostname, enables UFW and disables passwords logins to SSH.

