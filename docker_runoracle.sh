#!/bin/bash

/usr/sbin/sshd -D
$HOME/zenoracles/initial_bitmesg_run.sh 
sleep 10
$HOME/zenoracles/initial_bitcoind_run.sh
sleep 2
$HOME/zenoracles/initial_oracle_run.sh

