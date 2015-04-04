Full-Bitcoin-Node
=================
Just using this for personal use but feel free to do your thing, I welcome any and all advice. I will do my best to update the script files as soon as possible upon an update to the Bitcoin Core version.

Auto-Deploy-Full-Bitcoin-Node
-----------------------------
Simple script to automatically deploy a Full Bitcoin Node that will start bitcoind on boot.

    wget -O Full-Bitcoin-Node.sh https://github.com/mitchellcash/Full-Bitcoin-Node/raw/master/Auto-Deploy-Full-Bitcoin-Node.sh ; sudo bash Full-Bitcoin-Node.sh

Update-Full-Bitcoin-Node
------------------------
Useful if you have previously run the Auto-Deploy-Full-Bitcoin-Node script on a new server and are wanting to update the Bitcoin Core version upon an update from The Bitcoin Foundation.

        wget -O Update-Full-Bitcoin-Node.sh https://github.com/mitchellcash/Full-Bitcoin-Node/raw/master/Update-Full-Bitcoin-Node.sh ; sudo bash Update-Full-Bitcoin-Node.sh
        
Web-Interface-Full-Bitcoin-Node
-------------------------------
Python script to automatically update the status of a Full Bitcoin Node.

Auto-Deploy-Web-Interface-Full-Bitcoin-Node
-------------------------------------------
Simple script to automatically deploy a Web Interface for the Full Bitcoin Node that will update every hour.

        wget -O Web-Interface.sh https://github.com/mitchellcash/Full-Bitcoin-Node/raw/master/Auto-Deploy-Web-Interface-Full-Bitcoin-Node.sh ; sudo bash Web-Interface.sh
