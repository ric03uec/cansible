FROM alpine:3.7

## https://pypi.org/project/ansible/#history
ENV ANSIBLE_CONFIG=/etc/ansible/ansible.cfg
ADD . /cansible

RUN apk update

RUN \
	apk add python2 && \
	apk add python2-dev && \
	apk add musl-dev && \
	apk add libffi-dev && \
	apk add openssl-dev && \
	apk add py2-pip && \
	apk add py-jinja2 && \
	apk add py-boto && \
	apk add py-setuptools && \
	apk add py-yaml

RUN \
	apk add make && \
	apk add gcc && \
	apk add openssh-client && \
	apk add curl

RUN \
	pip install -r /cansible/requirements.txt

RUN \
	mkdir -p /ansible && \
	mkdir -p /etc/ansible

ADD ansible.cfg /etc/ansible/ansible.cfg

## Export all configuration overrides here
ENV ANSIBLE_FORCE_COLOR=true
RUN rm -rf /cansible

ENTRYPOINT ["/usr/bin/ansible-playbook"]
