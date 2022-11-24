# pi-cluster
Configuring a Docker Swarm on a cluster of raspberry pis

## Prerequisites

You'll need to download Rasbian and write the image to the SD cards.

If you're using WiFi you'll need to add a wpa_supplicant.conf file with the SSID and passphrase. There are instructions here: http://www.nathancourtney.me.uk/2018/05/10/raspberry-wifi.html

I also make some other changes to disable WiFi, Bluetooth and audio
 * dtparam=audio=off
 * dtoverlay=pi3-disable-bt
 * dtoverlay=pi3-disable-wifi

To set a static IP address at first-boot add ip=*address* to cmdline.txt

## Playbooks

* pb-first-boot.yml - Updates the local SSH known_hosts, adds a new admin user, updates the software and reboots.
* pb-format-disks.yml - Deletes any existing partitions and writes a single XFS partition to the listed devices
* pb-maintenance.yml - Runs core tasks and patches the software
* pb-cluster.yml - Builds the Gluster storage and deploys Docker and all the services
