#!/bin/bash
name=$(tail -1 temp1.txt)
check=$(docker ps | grep mysql_db)
if [[ "$check" == "" ]]; then
	echo "you didn't started you'r container"
else
	docker stop $name
fi

