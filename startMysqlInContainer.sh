#!/bin/bash
docker run -d mysql_db
docker ps > temp1.txt
grep mysql_db temp1.txt > temp2.txt
awk 'NF>1{print $NF}' temp2.txt > temp1.txt
name_of_container=$(tail -1 temp1.txt)
docker inspect $name_of_container > temp2.txt
grep -m 1 "\"IPAddress\": *" temp2.txt
echo "Do you want to go to into Docker container to set up mysql tables? [yes/no]"
read Answer
if [[ "$Answer" == "yes" ]] || [[ "$Answer" == "y" ]]; then
	echo "U have to wait before connectiong to db a bit till it's sets up completely"
	docker exec -it $name_of_container /bin/bash
else
	echo "Ok then i'll just end"
fi
