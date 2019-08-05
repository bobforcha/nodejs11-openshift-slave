# This Docker image is for testing NodeJS 11.x applications using Chrome
# Author: Bob Forcha (Email: bobforcha@gmail.com, GitHub: @bobforcha)

FROM openshift/jenkins-slave-base-centos7

RUN curl --silent --location https://rpm.nodesource.com/setup_11.x | bash -

RUN yum -y install nodejs && yum clean all -y

RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

COPY google-chrome.repo /etc/yum.repos.d/
RUN yum -y install google-chrome-stable && yum clean all -y

RUN chgrp -R 0 /opt/google
RUN chmod -R g+rw /opt/google

RUN chmod 4755 /opt/google/chrome/chrome-sandbox
