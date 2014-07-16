#!/bin/bash

PYTHON_EXEC=python2.7
HOME=/disk
DIR=$HOME

/usr/bin/screen -d -m /usr/bin/python /disk/PyBitmessage/src/bitmessagemain.py

if [ -z $(pgrep bitcoind) ]
then
    $HOME/bitcoin/bin/$(getconf LONG_BIT)/bitcoind -connect=127.0.0.1 -datadir=$HOME/.bitcoin/ -rpcport=2521 &
    sleep 2
fi

