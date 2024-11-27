#!/bin/sh

docker run -d --net vxlan-net --ip 172.18.0.11 --gpus all nvidia/cuda:12.4.0-base-ubuntu22.04 sleep infinity