FROM ubuntu:16.04
MAINTAINER foxhaunt
RUN apt-get update && apt-get install -y net-tools iptables ssh dns2tcp nano
RUN mkdir -p /opt/dns2tcp
RUN mkdir -p /root/.ssh

ADD authorized_keys /root/.ssh/authorized_keys

RUN service ssh start

ADD dns2tcpd.conf /etc/dns2tcpd.conf
ADD start.sh /opt/dns2tcp/start.sh

WORKDIR /opt/dns2tcp

EXPOSE 53/udp
EXPOSE 22/tcp

CMD ["/opt/dns2tcp/start.sh"]

ENTRYPOINT service ssh start && bash

