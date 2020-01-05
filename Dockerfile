FROM tomcat:jdk8-openjdk

COPY ./web/target/*.war /usr/local/tomcat/webapps/