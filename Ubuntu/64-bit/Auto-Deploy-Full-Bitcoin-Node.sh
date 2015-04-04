#!/bin/bash
echo "### Change to home directory"
cd ~
echo "### Change your root password"
sudo passwd
echo "### Update Ubuntu"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install software-properties-common python-software-properties ufw -y
echo "### Allow ports 22, 8333 and enable The Uncomplicated Firewall"
sudo ufw allow 22/tcp
sudo ufw allow 8333/tcp
sudo ufw --force enable
echo "### Creating Swap File"
dd if=/dev/zero of=/swapfile bs=1M count=1024 ; mkswap /swapfile ; swapon /swapfile
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
echo "### Creating bitcoin.conf"
mkdir ~/.bitcoin/
config=".bitcoin/bitcoin.conf"
touch $config
echo "server=1" > $config
echo "daemon=1" >> $config
echo "maxconnections=50" >> $config
echo "disablewallet=1" >> $config
randUser=`< /dev/urandom tr -dc A-Za-z0-9 | head -c30`
randPass=`< /dev/urandom tr -dc A-Za-z0-9 | head -c30`
echo "rpcuser=$randUser" >> $config
echo "rpcpassword=$randPass" >> $config
echo "### Downloading Bitcoin Core 0.10.0"
wget https://bitcoin.org/bin/bitcoin-core-0.10.0/bitcoin-0.10.0-linux64.tar.gz
echo "### Installing Bitcoin Core 0.10.0"
rm -f -r ~/Bitcoin-Core/
mkdir ~/Bitcoin-Core/
tar -xvvzf bitcoin-0.10.0-linux64.tar.gz --directory ~/Bitcoin-Core/ --strip-components 1
rm -f -r bitcoin-0.10.0-linux64.tar.gz
echo "### Scheduling Cron Job to run Bitcoin Core on boot"
(crontab -l ; echo "@reboot ~/Bitcoin-Core/bin/64/./bitcoind")| crontab -
echo "### System will now reboot"
reboot
