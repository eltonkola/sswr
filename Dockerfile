FROM ubuntu:16.04
MAINTAINER Elton Kola "https://github.com/eltonkola"

VOLUME ["/radio_media"]

USER root
RUN apt-get -y update

#copy webradio related stuff
RUN apt-get install -y --no-install-recommends liquidsoap liquidsoap-plugin-all 
RUN apt-get install -y festival

RUN mkdir -p /var/sswr
RUN chmod 0777 -R /var/sswr

USER liquidsoap

#configuration
COPY run /var/sswr
#RUN chmod +x /var/sswr/run
#RUN chmod 0775 -R /usr/local/bin/run
#RUN chown -R liquidsoap: /usr/local/bin/run



COPY config.liq /var/sswr
COPY radio.liq /var/sswr

#RUN chmod 0775 -R /var/sswr/config.liq

CMD ["/var/sswr/run"]