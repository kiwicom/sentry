FROM sentry:8.10.0

MAINTAINER Simone Esposito "simone@kiwi.com"

ENV SENTRY_VERSION=8.10

RUN apt-get update && apt-get -y install python-dev libldap2-dev libsasl2-dev libssl-dev

RUN pip install sentry-plugins
RUN pip install sentry-ldap-auth==2.1
RUN pip install datadog

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY sentry.conf.py /etc/sentry/sentry.conf.py

LABEL name=sentry version=$SENTRY_VERSION
