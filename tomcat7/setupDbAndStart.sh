#!/bin/bash

echo $MYSQL

sed -i 's/REPLACE_STRING/'"$MYSQL"'/g' /root/.OpenMRS/openmrs-runtime.properties

exec /usr/share/tomcat7/bin/catalina.sh run