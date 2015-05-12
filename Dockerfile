FROM phusion/baseimage:0.9.16

MAINTAINER Vladimir Shulyak "vladimir@shulyak.net" (prev: Deni Bertovic "me@denibertovic.com")

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y ca-certificates wget openjdk-7-jre
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz -O /tmp/logstash.tar.gz 2> /dev/null

RUN tar zxvf /tmp/logstash.tar.gz -C /opt && mv /opt/logstash-1.4.2 /opt/logstash && rm -rf /tmp/logstash.tar.gz

ADD start_logstash.sh /etc/service/logstash/run
RUN chmod 755 /etc/service/logstash/run

RUN mkdir /opt/logs

ADD collectd-types.db /opt/collectd-types.db

VOLUME ["/opt/conf", "/opt/certs", "/opt/logs"]

EXPOSE 514
EXPOSE 5043
EXPOSE 9292
