#!/bin/bash

# install the check_mk server
sudo yum -y install epel-release
wget https://mathias-kettner.de/support/1.5.0p3/check-mk-raw-1.5.0p3-el7-38.x86_64.rpm
sudo yum -y localinstall check-mk-raw-1.5.0p3-el7-38.x86_64.rpm
sudo omd create mysite
sudo omd start mysite
echo cmkadmin | htpasswd -i -m /omd/sites/mysite/etc/htpasswd cmkadmin
sudo omd restart

# install the check_mk agent
wget http://192.168.33.10/mysite/check_mk/agents/check-mk-agent-1.5.0p3-1.noarch.rpm
sudo yum -y localinstall check-mk-agent-1.5.0p3-1.noarch.rpm


echo ####################################################
echo "Connect to http://192.168.33.10/mysite/"
echo "user: cmkadmin"
echo "pass: cmkadmin"
echo ####################################################
