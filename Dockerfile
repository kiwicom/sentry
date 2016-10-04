FROM sentry:8.8

MAINTAINER Simone Esposito "simone@kiwi.com"

RUN apt-get update && apt-get install -y python-dev libldap2-dev libsasl2-dev libssl-dev

RUN pip install sentry-ldap-auth==2.1

COPY sentry.conf.py /etc/sentry/sentry.conf.py
