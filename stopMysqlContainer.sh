#!/bin/bash
name=$(tail -1 temp1.txt)
if [[ "$name" == "" ]]; then
	echo "you didn't started you'r container"
fi
docker stop $name
