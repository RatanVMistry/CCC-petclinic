#!/bin/bash

mkdir ${CATALINA_HOME}/webapps/petclinic
echo "Done create"
cd /tmp
echo "cd tmp done"
wget https://s3.amazonaws.com/ratan-repo/petclinic.war

cd ${CATALINA_HOME}/webapps/petclinic
echo "cd petclinic done"
jar -xvf /tmp/petclinic.war
#sleep 10

sed -i "s,db:3306,$db,g" ${CATALINA_HOME}/webapps/petclinic/WEB-INF/classes/spring/data-access.properties
echo "done sed"

export LANG="en_US.UTF-8"
export JAVA_OPTS="$JAVA_OPTS -Duser.language=en -Duser.country=US"
export CATALINA_PID=${CATALINA_HOME}/temp/tomcat.pid
export CATALINA_OPTS="$CATALINA_OPTS  -Xmx${JAVA_MAXMEMORY}m -DjvmRoute=${TOMCAT_JVM_ROUTE}  -Dtomcat.maxThreads=${TOMCAT_MAXTHREADS}  -Dtomcat.minSpareThreads=${TOMCAT_MINSPARETHREADS}  -Dtomcat.httpTimeout=${TOMCAT_HTTPTIMEOUT}  -Djava.security.egd=file:/dev/./urandom"
exec ${CATALINA_HOME}/bin/catalina.sh run
