FROM centos

ENV REFRESHED_AT 2015-02-15T20:40

VOLUME /var/lib/mysql

VOLUME /var/lib/tomcat7/webapps

VOLUME /root/.OpenMRS

ADD openmrs.war /var/lib/tomcat7/webapps/openmrs.war
ADD modules.tar /root/.OpenMRS/modules/
ADD openmrs-runtime.properties /root/.OpenMRS/openmrs-runtime.properties
ADD db.tar /var/lib/mysql/

CMD [ "true" ]
