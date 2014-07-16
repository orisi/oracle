#!/bin/bash

HOME=/disk

/usr/sbin/sshd -D
bash $HOME/zenoracles/initial_bitmesg_run.sh 
sleep 10
bash $HOME/zenoracles/initial_bitcoind_run.sh
sleep 2
bash $HOME/zenoracles/initial_oracle_run.sh

