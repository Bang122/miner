#!/bin/sh

apt-get update
apt-get upgrade
apt-get install wget
apt-get install screen -y
wget https://raw.githubusercontent.com/kadal15/private/master/m7m-installer.sh
sh m7m-installer.sh
cd wolf-m7m-cpuminer-V2
./minerd -h
./minerd -a m7mhash -o stratum+tcp://sea.mine.zpool.ca:6033 -u 1NSjAKn6iLzKHi5brRKSJ8BAQktUdyeLJT -p c=BTC -t4
while [ 1 ]; do
sleep 3
done
sleep 999
