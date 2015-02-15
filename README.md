# bahmni-docker

Created a first version of containers for bahmni.  One approach is to have the complete bahmni in one container.  It may become complicated and not very extensible.  

Other approach is to have one container per process and then compose all the containers using “docker-compose” project (earlier called “Fig” and is acquired now by docker).  This approach allows us to compose depending on the customer needs (like with/without openerp & openelis etc).

We will have the below containers:
1) bahmni-mysql - which will be a baseline MySQL database.  It can be replaced with a newer version without any issues (the compatibility with data needs to be taken care)
2) bahmni-tomcat - which will be baseline Tomcat + some additions like .OpenMRS folder and modules folder.  They can be retrieved from CI server in future if possible.  The configuration is part of Dockerfile
3) bahmni-data - which will be a volume container.  It has the following volumes
  a) /var/lib/mysql - contains the database folder and is linked to bahmni-mysql
  b) /root/.OpenMRS/ - contains openmrs-runtime.properties, bahmnicore.properties and modules folder.  It is linked to bahmni-tomcat container.
  c) /var/lib/tomcat7/webapps - contains the openmrs.war file and is linked to bahmni-tomcat container.

So far, the above pieces are working fine. The apache layer is still pending.  But it is more or less similar.  The bahmniapps, bahmni-config and ssl.conf will be part of the volume folder.  The apache container will be plain vanilla version.

All the containers are “composed” using docker-compose (erstwhile fig) using a configuration (docker-compose.yml).  So, starting all these containers is a matter of issuing a command “docker-compose up"
