#!/bin/bash

PYTHON_EXEC=python2.7
HOME=/disk
DIR=$HOME


if [ -z $(pgrep bitcoind) ]
then
    $HOME/bitcoin/bin/$(getconf LONG_BIT)/bitcoind -datadir=$HOME/.bitcoin/ -rpcport=2521 &
    sleep 2
fi

