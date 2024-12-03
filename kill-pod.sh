#!/bin/sh
echo ~~~Killing and deleting container~~~ 
docker kill pod
docker rm pod
