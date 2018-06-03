FROM ubuntu:14.04
MAINTAINER Akshay Girpunje

RUN sudo apt-get -y  update
RUN sudo apt-get -y install apache2
RUN echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf
RUN sudo a2enconf fqdn

EXPOSE 80
CMD apachectl -D FOREGROUND

