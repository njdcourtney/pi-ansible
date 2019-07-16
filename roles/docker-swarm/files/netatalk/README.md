Based on the information found in this repo: https://github.com/cptactionhank/docker-netatalk 

## Changelog

1. Updated netalk version to 3.1.12
1. Changed Debian version from Jessie to Stretch-slim
1. Updated afp.conf to remove anonymous access
1. Remove avahi ENV var (always run)
1. Simplified the docker-entrypoint.sh script. 
1. Changed the chpasswd step to read the password from a Swarm secret.
1. Remove directory chown - this is done in Ansible
1. Remove copy of afp.conf - this is done by Ansible 

The original of this container had lots of cool conditional variables. I've stripped most of these out because I don't need them and I'm using Ansible to deploy this to a swarm.