FROM datadog/agent:7
LABEL maintainer="Gavin Hodge <gavin@winkreports.com>"

RUN apt-get update \
  && apt-get install --no-install-recommends -y git-core openssh-client \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#COPY entrypoint.sh /entrypoint.sh
#COPY fetch_configuration.sh /fetch_configuration.sh
COPY *.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/init"]