#!/bin/sh

#reset MTU's on bonded interfaces to default 1500 bytes
#note: these will automatically propagate to physical interfaces
echo ~~~Resetting interface MTUs to 1500 bytes~~~
ip link set mtu 1500 dev bond0
ip link set mtu 1500 dev bond0.2636

ip a | grep mtu