FROM tutum/datadog-agent
MAINTAINER Gavin Hodge <gavin@impulsecloud.com.au>

# Output of: yaml2json tutum.yml | tr "\n" " " | sed 's/"/\\"/g'
LABEL co.tutum.yml="{   \"datadog\": {     \"image\": \"impulsecloud/datadog-agent\",     \"restart\": \"on-failure\",     \"privileged\": true,     \"volumes\": [       \"/var/run/docker.sock:/var/run/docker.sock\",       \"/proc:/host/proc:ro\",       \"/sys/fs/cgroup:/host/sys/fs/cgroup:ro\"     ],     \"environment\": [       \"HOSTNAME=$TUTUM_NODE_HOSTNAME\",       \"API_KEY=YOUR-API-KEY-HERE\"     ],     \"deployment_strategy\": \"every_node\"   } }"

RUN apt-get update \
  && apt-get install --no-install-recommends -y git-core openssh-client \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /entrypoint.sh
COPY fetch_configuration.sh /fetch_configuration.sh

