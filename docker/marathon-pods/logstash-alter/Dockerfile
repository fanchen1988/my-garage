FROM docker.elastic.co/logstash/logstash:5.4.0
MAINTAINER Chen Fan <fanchen1988@gmail.com>

USER root

ENV GOSU_VERSION 1.10
RUN set -ex; \
  \
  yum -y install epel-release; \
  yum -y install wget dpkg; \
  \
  dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
  wget -O /usr/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
  wget -O /tmp/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
  \
#verify the signature
  export GNUPGHOME="$(mktemp -d)"; \
  gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
  gpg --batch --verify /tmp/gosu.asc /usr/bin/gosu; \
  rm -r "$GNUPGHOME" /tmp/gosu.asc; \
  \
  chmod +x /usr/bin/gosu; \
#verify that the binary works
  gosu nobody true; \
  \
  yum -y remove wget dpkg; \
  yum clean all

RUN curl -L -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64
RUN chmod +x /usr/local/bin/dumb-init


RUN logstash-plugin remove x-pack
#RUN logstash-plugin install logstash-input-beats
#RUN logstash-plugin install logstash-output-file

ADD bootstrap.sh /scripts/bootstrap.sh

ENV LOGSTASH_ENTRYPOINT /usr/local/bin/docker-entrypoint
ENV LOGSTASH_ROOT_PATH /usr/share/logstash
ENV LOGSTASH_CONFIG_PATH ${LOGSTASH_ROOT_PATH}/pipeline/logstash.conf

#EXPOSE 5044 9600
EXPOSE 9600

CMD ["/usr/local/bin/dumb-init", "/scripts/bootstrap.sh"]
