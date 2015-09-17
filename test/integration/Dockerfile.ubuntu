FROM ubuntu:12.04
RUN apt-get update
RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:fkrull/deadsnakes
RUN apt-get clean all && apt-get -y update
#RUN apt-get -y install python2.4 python2.6 python2.7 python3.4
RUN apt-get -y install python2.4
RUN apt-get -y install python-httplib2 python-keyczar python-paramiko python-setuptools python-software-properties openssl make python-pip
RUN pip install tox PyYAML Jinja2 sphinx
