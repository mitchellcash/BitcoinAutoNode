#!/bin/bash
echo "### Changing to bitcoind directory"
cd ~/Bitcoin-Core/bin/64
echo "### Stop Bitcoin Server"
./bitcoind stop
echo "### Changing to home directory"
cd ~
echo "### Updating Ubuntu"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install python-pip apache2 -y
echo "### Allow ports 80, 8332 and enable The Uncomplicated Firewall"
sudo ufw allow 80/tcp
sudo ufw allow 8332/tcp
sudo ufw --force enable
echo "### Installing python-bitcoinrpc"
sudo pip install python-bitcoinrpc
echo "### Changing to bitcoind directory"
cd ~/Bitcoin-Core/bin/64
echo "### Starting Bitcoin Server"
./bitcoind
echo "### Changing to home directory"
cd ~
echo "### IN 30 SECONDS PLEASE TAKE NOTE OF RPCUSER AND RPCPASSWORD AND ONCE DONE PRESS CTRL+X (WE WILL NEED THESE SOON)"
sleep 30
cd .bitcoin
nano bitcoin.conf
echo "### Changing to home directory"
cd ~
echo "### Downloading Web-Interface.py"
mkdir ~/Web-Interface/
cd ~/Web-Interface/
wget -O Web-Interface.py https://github.com/mitchellcash/Full-Bitcoin-Node/raw/master/Web-Interface-Full-Bitcoin-Node.py
echo "### IN 30 SECONDS CONFIGURE WEB-INTERFACE.PY WITH RPC_USER, RPC_PASS, NODE_LOCATION, NODE_NAME, NODE_IP, DONATION_BTC_ADDR AND PRESS CTRL+X (DON’T FORGET TO SAVE)"
sleep 30
nano Web-Interface.py
echo "### Install Web-Interface.py"
sudo python Web-Interface.py
echo "### Change to home directory"
cd ~
echo "### Scheduling Cron Job to run Web-Interface.py every hour"
(crontab -l ; echo "@hourly sudo python ~/Web-Interface/Web-Interface.py")| crontab -
echo "### System will now reboot"
reboot
