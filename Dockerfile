FROM sentry:8.9

MAINTAINER Simone Esposito "simone@kiwi.com"

RUN apt-get update && apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get -y install nodejs build-essential
RUN apt-get -y install python-dev libldap2-dev libsasl2-dev libssl-dev
RUN pip install https://github.com/getsentry/sentry-plugins/archive/master.zip

RUN pip install sentry-ldap-auth==2.1
RUN pip install datadog

COPY sentry.conf.py /etc/sentry/sentry.conf.py
