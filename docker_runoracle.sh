#!/bin/bash

/usr/sbin/sshd -D
/root/zenoracles/initial_bitmesg_run.sh > /dev/null &
sleep 10
/root/zenoracles/initial_bitcoind_run.sh > /dev/null &
sleep 2
/root/zenoracles/initial_oracle_run.sh > /dev/null &


