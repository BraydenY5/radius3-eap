#!/usr/bin/bash
#!/usr/bin/bash
############################################################################
# Author: Brayden Y.
# Email: braydeny050@gmail.com
# Last modified: 2022-08-22 1:21AM
# Filename: rad_user
# Decription:  A simple script to add a Freeradius user
# License:
# Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
#
# https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en
###########################################################################
if [ $# -eq 0 ];
then
        echo -e "\tNo argument!\n"
        echo "Use: 'install_radius3.sh server_ip_address' to install a Freeradius server"
        exit 1

else
	yum -y update 
	yum -y install wget curl bind-utils nano  net-tools git ansible-core rsync
	ansible-galaxy collection install community.general
	ansible-galaxy collection install ansible.posix
	ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
	echo '[radius]' >> /etc/ansible/hosts
	echo "$1" >> /etc/ansible/hosts
	ssh-copy-id  -i ~/.ssh/id_rsa.pub  root@$1
	cp -a ../radius3-eap /etc/ansible/roles/radius3-eap
	cd /etc/ansible/roles/radius3-eap
	ansible-playbook ./playbook.yml
fi
