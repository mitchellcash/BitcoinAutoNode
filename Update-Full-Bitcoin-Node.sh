#!/bin/bash
echo "### Change to bitcoind directory"
cd ~/Bitcoin-Core/bin/64
echo "### Stop Bitcoin Server"
./bitcoind stop
echo "### Change to home directory"
cd ~
echo "### Downloading Bitcoin Core 0.9.2.1"
wget https://bitcoin.org/bin/0.9.2.1/bitcoin-0.9.2.1-linux.tar.gz
echo "### Installing Bitcoin Core 0.9.2.1"
rm -f -r ~/Bitcoin-Core/
mkdir ~/Bitcoin-Core/
tar -xvvzf bitcoin-0.9.2.1-linux.tar.gz --directory ~/Bitcoin-Core/ --strip-components 1
rm -f -r bitcoin-0.9.2.1-linux.tar.gz
echo "### System will now reboot"
reboot
