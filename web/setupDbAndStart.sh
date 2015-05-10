#!/bin/bash

echo $MYSQL

sed -i 's/REPLACE_STRING/'"$MYSQL"'/g' /root/.OpenMRS/openmrs-runtime.properties

sed -i 's/localhost/'"$PGSQL"'/g' /var/lib/tomcat7/webapps/openelis/WEB-INF/classes/us/mn/state/health/lims/hibernate/hibernate.cfg.xml

exec /usr/share/tomcat7/bin/catalina.sh run