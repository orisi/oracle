#!/bin/bash

/usr/sbin/sshd -D
/root/zenoracles/initial_bitmesg_run.sh &
/root/zenoracles/initial_bitcoind_run.sh &
/root/zenoracles/initial_oracle_run.sh &

