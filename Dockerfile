FROM ubuntu:16.04

# Install pacakges
RUN apt-get update

# Install maven
RUN apt install -y git default-jdk maven

# Install docker 18.03
RUN apt-get -y install docker.io

# Clear cache
RUN apt-get clean

WORKDIR /root

RUN mkdir /opt/build \
  && chmod 777 /opt/build \
  && echo 'FROM tomcat:8.5.54' >> /opt/build/Dockerfile  \
  && echo 'ADD hello-1.0.war /var/lib/tomcat8/webapps/' >> /opt/build/Dockerfile

