#!/bin/bash

#exec /opt/logstash/bin/logstash agent -f /opt/conf/logstash.conf  >> /opt/logs/logstash.log 2>&1

# do not redirect stderr
exec /opt/logstash/bin/logstash agent -f /opt/conf/logstash.conf -- web   >> /opt/logs/logstash.log