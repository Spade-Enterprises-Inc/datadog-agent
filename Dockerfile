FROM datadog/agent:7

# disable all Kubernetes checks (they don't work on Render)
RUN rm -rf /etc/datadog-agent/conf.d/kube*

ENV NON_LOCAL_TRAFFIC=true
ENV DD_LOGS_STDOUT=yes

ENV DD_APM_ENABLED=true
ENV DD_APM_NON_LOCAL_TRAFFIC=true

ENV DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true
ENV DD_PROCESS_AGENT_ENABLED=true

# Automatically set by Render
ARG RENDER_SERVICE_NAME=datadog

ENV DD_BIND_HOST=$RENDER_SERVICE_NAME
ENV DD_HOSTNAME=$RENDER_SERVICE_NAME
