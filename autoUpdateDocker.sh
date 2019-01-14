
#!/bin/bash
project="spring-boot-hello-world"
git_url="https://github.com/LukeMonty/spring-boot-hello-world"
cd ~
docker rm -f $(docker ps -qal)
rm -rf ${project}
git clone ${git_url}
cd ${project}
mvn clean install
docker build -t ${project} .
docker run -d -p 9000:9000 ${project}