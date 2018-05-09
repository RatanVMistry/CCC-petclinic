#!/bin/bash

mkdir ${CATALINA_HOME}/webapps/ROOT

cd ${CATALINA_HOME}/webapps/ROOT

jar -xvf /petclinic.war

sed -i "s,db:3306,$db,g" ${CATALINA_HOME}/webapps/ROOT/WEB-INF/classes/spring/data-access.properties

sed -i "s,jpa.database=HSQL,#jpa.database=HSQL,g" ${CATALINA_HOME}/webapps/ROOT/WEB-INF/classes/spring/data-access.properties

sed -i "s,#jpa.database=MYSQL,jpa.database=MYSQL,g" ${CATALINA_HOME}/webapps/ROOT/WEB-INF/classes/spring/data-access.properties

sed -i "s/<welcome-file-list>/<!-- welcome-file-list -->/" ${CATALINA_HOME}/conf/web.xml
sed -i "s/<welcome-file>index.html<\/welcome-file>/<!-- <welcome-file>index.html<\/welcome-file> -->/" ${CATALINA_HOME}/conf/web.xml
sed -i "s/<welcome-file>index.htm<\/welcome-file>/<!-- <welcome-file>index.htm<\/welcome-file> -->/" ${CATALINA_HOME}/conf/web.xml
sed -i "s/<welcome-file>index.jsp<\/welcome-file>/<!-- <welcome-file>index.jsp<\/welcome-file> -->/" ${CATALINA_HOME}/conf/web.xml
sed -i "s/<\/welcome-file-list>/<!-- \/welcome-file-list -->/" ${CATALINA_HOME}/conf/web.xml
exec /opt/tomcat/bin/catalina.sh run
