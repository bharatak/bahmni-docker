Installing Docker:
==================

1. Install boot2docker :
boot2docker is a "lightweight linux distribution made specifically to run Docker containers" and it will run as a vm on your mac.  Download the package and install. The current version is 1.5.0

https://docs.docker.com/installation/mac/

2. Set the DOCKER_HOST environment variable in your .bashrc or .zshrc
The Docker client assumes the Docker host is the current machine. We need to tell it to use our boot2docker VM by setting the DOCKER_HOST environment variable:

export DOCKER_HOST=tcp://192.168.59.103:2375

The IP can be known from the previous command or from "boot2docker ip" command.

This is a very intersting blog the explains other features like port-forwarding from your mac to boot2docker etc. - http://viget.com/extend/how-to-use-docker-on-os-x-the-missing-guide

Installing Docker Compose (fig)
================================
> This is a release candidate for Docker Compose 1.1.0.
https://github.com/docker/fig/releases

Run the following command for installation

curl -L https://github.com/docker/fig/releases/download/1.1.0-rc2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose; chmod +x /usr/local/bin/docker-compose

Build bahmni-docker:
=====================
1. Checkout the project https://github.com/bharatak/bahmni-docker
2. Build the docker containers.
 docker build -t bahmni-apache apache/
 docker build -t bahmni-mysql mysql/
 docker build -t bahmni-web tomcat7/

Configure the working directory:
================================
The docker containers can share the paths of host machine (vm).  Boot2Docker already shares the /Users folder on your mac.  So folders on your mac can be accessed by the docker container.

1. Create a folder called "~/dock" 
2. checkout the following projects
	a) jss-config - https://github.com/Bhamni/jss-config
	b) openmrs-distro-bahmni - https://github.com/Bhamni/openmrs-distro-bahmni
	c) openmrs-module-bahmniapps - https://github.com/Bhamni/openmrs-module-bahmniapps
3. Build the above projects as per the instructions mentioned in their project documentation.

Bahmni Up and Running:
=======================
1. Navigate to the bahmni-docker folder.  
2. Open docker-compose.yml in a text editor and ensure that all the volumes are pointed correctly.
3. Run the command "docker-compose up"
4. At this point in time, the database is a default database.  We need to restore a bahmni database.  Run the following commands to accomplish this task.
 > Get the container ID of mysql.  Run "docker ps" command.
 > Go inside the mysql database container - 
 		docker exec -it <CONTAINER_ID> /bin/bash;
 > Go to /root folder.  There is a database dump.  Restore it.
  	mysql -uroot -ppassword mysql_backup.sql
 4. At this point, the database is restored and will be available during multiple restarts of the containers.  Now, restart your containers using the following commands
	 docker-compose stop
	 docker-compose start
5. Navigate to https://localhost:49003/bahmni/home to access the Bahmni Apps.
6. Navigate to http://localhost:49001/openmrs to access OpenMRS