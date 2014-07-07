#!/bin/bash

/usr/sbin/sshd -D



PYTHON_EXEC=python2.7
HOME="/root"
DIR="/root"

python PyBitmessage/src/bitmessagemain.py 

if [ -z $(pgrep bitcoind) ]
then
    $HOME/bitcoin/bin/$(getconf LONG_BIT)/bitcoind -connect=127.0.0.1 -datadir=$HOME/.bitcoin/ -rpcport=2521 &
    sleep 2
fi

echo "running oracle"

$PYTHON_EXEC $DIR/orisi/src/run_oracle.py $@
