FROM alpine:3.7

## https://pypi.org/project/ansible/#history
ENV ANSIBLE_VERSION=2.5.2

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
	apk add py-yaml && \
	apk add py-libcloud

RUN \
	apk add make && \
	apk add gcc && \
	apk add openssh-client && \
	apk add curl

RUN mkdir -p /ansible/playbooks \
		mkdir -p /ansible/configs

RUN pip install ansible==$ANSIBLE_VERSION

ENTRYPOINT ["/usr/bin/ansible-playbook"]
