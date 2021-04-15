FROM debian:buster

MAINTAINER Luca Pasquale

RUN apt-get update && apt-get -y install wget gnupg php-mbstring
RUN wget -q -O - https://ltb-project.org/wiki/lib/RPM-GPG-KEY-LTB-project | apt-key add -
RUN echo "deb [arch=amd64] https://ltb-project.org/debian/stable stable main" > /etc/apt/sources.list.d/ltb-project.list
RUN apt-get update && apt-get -y install self-service-password

RUN a2dissite 000-default
RUN a2ensite self-service-password

ADD ./init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 80
EXPOSE 443

CMD ["/init.sh"]
