#!/bin/bash
echo "### Change to bitcoind directory"
cd ~/Bitcoin-Core/bin/64
echo "### Stop Bitcoin Server"
./bitcoind stop
echo "### Change to home directory"
cd ~
echo "### Downloading Bitcoin Core 0.10.0"
wget https://bitcoin.org/bin/bitcoin-core-0.10.0/bitcoin-0.10.0-linux64.tar.gz
echo "### Installing Bitcoin Core 0.10.0"
rm -f -r ~/Bitcoin-Core/
mkdir ~/Bitcoin-Core/
tar -xvvzf bitcoin-0.10.0-linux64.tar.gz --directory ~/Bitcoin-Core/ --strip-components 1
rm -f -r bitcoin-0.10.0-linux64.tar.gz
echo "### System will now reboot"
reboot
