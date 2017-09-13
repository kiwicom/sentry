FROM sentry:8.20.0

MAINTAINER Simone Esposito "simone@kiwi.com"

ENV SENTRY_VERSION=8.20

RUN apt-get update && apt-get -y install python-dev libldap2-dev libsasl2-dev libssl-dev && \
    pip install sentry-plugins sentry-ldap-auth==2.1 datadog && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY sentry.conf.py /etc/sentry/sentry.conf.py

LABEL name=sentry version=$SENTRY_VERSION
