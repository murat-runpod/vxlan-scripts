#!/bin/sh

#raise MTU's on bonded interfaces to 9000 bytes
#note: these will automatically propagate to physical interfaces
echo ~~~Raising interface MTUs to 9000 bytes~~~
ip link set mtu 9000 dev bond0
ip link set mtu 9000 dev bond0.2636

ip a | grep mtu