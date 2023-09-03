# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "sak528264@gmail.com" 
COPY ./project-1-cicd-for-webapp.war /usr/local/tomcat/webapps
