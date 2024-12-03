#!/bin/sh

echo ~~~Starting Pod~~~
docker start pod
docker exec pod ip link set dev eth0 mtu 8950
docker exec -it pod bash

