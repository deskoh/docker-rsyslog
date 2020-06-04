ARG BASE_REGISTRY=registry.access.redhat.com
ARG BASE_IMAGE=ubi8/ubi-minimal
ARG BASE_TAG=latest

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG} as base

RUN microdnf update -y && rm -rf /var/cache/yum
RUN microdnf --nodocs install rsyslog && microdnf clean all

COPY --chown=root:root rsyslog.conf /etc/
COPY --chown=root:root config.conf /etc/rsyslog.d/

EXPOSE 514
EXPOSE 514/udp

CMD ["rsyslogd", "-n"]
