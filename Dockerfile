FROM debian:stable

MAINTAINER Luca Pasquale

RUN apt-get update
RUN apt-get -y install wget
RUN wget http://tools.ltb-project.org/attachments/download/801/self-service-password_0.9-1_all.deb
RUN apt-get -y install apache2 php5 php5-ldap php5-mcrypt
RUN dpkg -i self-service-password_0.9-1_all.deb

ADD sites-available/self-service-password-ssl.conf /etc/apache2/sites-available/self-service-password-ssl.conf
RUN cp /etc/apache2/sites-available/self-service-password /etc/apache2/sites-available/self-service-password.conf
RUN a2enmod ssl
RUN a2dissite 000-default
RUN a2ensite self-service-password
RUN a2ensite self-service-password-ssl

ADD ./init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 80
EXPOSE 443

CMD ["/init.sh"]
