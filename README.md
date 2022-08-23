# radius3-eap

A simple Freeradius authentication service with PEAP+Mschap V2 method.

This Ansible playbook was written to make it easier for home users to set up Freeradius servers using the more secure PEAP+MSchapV2 technology.

This project was written and tested for Rocky-Linux 9 only.




--------------------
How to use:

1 Install the Freeradius server locally


1.1 Login your Rocky-Linux 9 server


1.2 Install git and clone the project 

yum -y install git && git clone https://github.com/BraydenY5/radius3-eap.git


1.3 Use 127.0.0.1 setting up the Freeradius server locally

cd radius3-eap && source ./install_radius3.sh 127.0.0.1


1.4 Get ca.crl and ca.pem for setting your device

curl http://auth.nas.org/ca.crl

curl http://auth.nas.org/ca.pem






--------------------
2 Install the Freeradius server remotely

2.1 Log in your server


2.2 Install git and clone the project 

yum -y install git && git clone https://github.com/BraydenY5/radius3-eap.git


2.3 Use the server 23.45.56.89 setting up the Freeradius server remotely

cd radius3-eap && source ./install_radius3.sh 3.45.56.89


2.4 Confirm the Freeradius service that running well

ansible-playbook ./t4remote_login.yml


2.5 Get ca.crl and ca.pem for setting your device

curl https://auth.nas.org/ca.crl

curl https://auth.nas.org/ca.pem






--------------------
How to maintain users

1 Add a user 

rad_useradd todd



2 Remove a user

rad_userdel todd




And also welcome guys who come from Discovery-forum with dishes.

欢迎 来自D版带着菜 的小伙伴们。
