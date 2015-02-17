FROM centos

ENV REFRESHED_AT 2015-02-16T07:03

# Needs to be downloaded. https://www.dropbox.com/s/4rtzi9m7bl95ubl/openmrs.war?dl=1
ADD openmrs.war /var/lib/tomcat7/webapps/openmrs.war
# Available at https://www.dropbox.com/s/qpnsg90usbjsylv/modules.tar?dl=1
ADD modules.tar /root/.OpenMRS/modules/

RUN chown -R root:root /root/.OpenMRS
ADD openmrs-runtime.properties /root/.OpenMRS/openmrs-runtime.properties
ADD bahmnicore.properties /root/.OpenMRS/bahmnicore.properties

# db.tar needs to be downloaded. Available at https://www.dropbox.com/s/wdjy4blx2y07pt0/db.tar?dl=1
ADD db.tar /var/lib/mysql/


VOLUME /var/lib/mysql

VOLUME /var/lib/tomcat7/webapps

VOLUME /root/.OpenMRS

CMD [ "true" ]
