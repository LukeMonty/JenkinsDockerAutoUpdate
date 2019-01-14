#!/bin/bash
project="spring-boot-hello-world"

if  sudo docker ps -a | grep ${project} 
then
	sudo docker stop ${project}
    sudo docker rm ${project}
	sudo rm -rf ${project}
	sudo docker rmi -f $(sudo docker images --quiet --filter "dangling=true")
fi

mvn clean install
sudo docker build -t ${project} .
sudo docker run -d -p 9000:9000 --name ${project} ${project}