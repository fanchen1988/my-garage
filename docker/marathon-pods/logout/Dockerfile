FROM phusion/baseimage:0.9.22
MAINTAINER Chen Fan <fanchen1988@gmail.com>

ADD bootstrap.sh /scripts/bootstrap.sh
RUN chmod +x /scripts/*

CMD ["/sbin/my_init", "/scripts/bootstrap.sh"]
