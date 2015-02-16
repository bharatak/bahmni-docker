FROM centos

ENV REFRESHED_AT 2015-02-16T07:03

# Needs to be downloaded. did not check-in because of size
ADD openmrs.war /var/lib/tomcat7/webapps/openmrs.war
ADD modules.tar /root/.OpenMRS/modules/
RUN chown -R root:root /root/.OpenMRS
# TODO: need to chown root:root for modules dir
ADD openmrs-runtime.properties /root/.OpenMRS/openmrs-runtime.properties
ADD bahmnicore.properties /root/.OpenMRS/bahmnicore.properties

# db.tar needs to be downloaded. did not check-in because of size
ADD db.tar /var/lib/mysql/


VOLUME /var/lib/mysql

VOLUME /var/lib/tomcat7/webapps

VOLUME /root/.OpenMRS

CMD [ "true" ]
