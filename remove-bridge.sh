#!/bin/sh

# delete VXLAN tunnel interface
echo ~~~Deleting VXLAN tunnel~~~
ip link delete vxlan-tunnel

# delete docker bridge
echo ~~~Deleting docker bridge~~~
bridge_id=$(sudo docker network inspect -f {{.Id}} vxlan-bridge)
docker network rm ${bridge_id}
