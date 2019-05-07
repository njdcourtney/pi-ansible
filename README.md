# pi-cluster
Configuring a Docker Swarm on a cluster of raspberry pis


## Prerequisites

You'll need to download Rasbian and write the image to the SD cards.

If you're using WiFi you'll need to add a wpa_supplicant.conf file with the SSID and passphrase. There are instructions here: http://www.nathancourtney.me.uk/2018/05/10/raspberry-wifi.html

## Playbooks

* pb-first-boot.yml - Updates the local SSH know_hosts, adds a new admin user and updates the software.
* pb-format-disks.yml - Deletes any existing partitions and writes a single XFS partition to the listed devices
* pb-deploy-services.yml - Main playbook. Runs the core role and install the cluster services; dnsmasq, glusterfs and docker and swarm services.

## Known Issues

The update software task in the first-boot playbook intermittently fails.

I think this is a timeout issue caused by the very first software update being quite big, re-running the playbook seems to clear the error.

The netatalk tasks in the swarm-services role needs to be rewritten when Ansible 2.8 is release with the updated docker modules