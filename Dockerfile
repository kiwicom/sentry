FROM sentry:8.10

MAINTAINER Simone Esposito "simone@kiwi.com"

RUN apt-get update && apt-get -y install python-dev libldap2-dev libsasl2-dev libssl-dev

RUN pip install https://github.com/getsentry/sentry-slack/archive/master.zip
RUN pip install https://github.com/getsentry/sentry-gitlab/archive/master.zip
RUN pip install sentry-ldap-auth==2.1
RUN pip install datadog

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY sentry.conf.py /etc/sentry/sentry.conf.py
