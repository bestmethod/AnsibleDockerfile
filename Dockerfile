FROM gliderlabs/alpine:latest

RUN \
  apk-install \
    curl \
    openssh-client \
    python \
    python-dev \
    py-boto \
    py-dateutil \
    py-httplib2 \
    py-jinja2 \
    py-paramiko \
    py-pip \
    py-setuptools \
    py-yaml \
    openssh-client \
    gcc \
    linux-headers \
    musl-dev \
    libffi \
    libffi-dev \
    openssl \
    openssl-dev \
    make \
    tar && \
  pip install --upgrade pip python-keyczar && \
  pip install --upgrade boto boto3 && \
  apk add --update bash

RUN \
  pip install ansible && \
  apk del linux-headers gcc python-dev musl-dev libffi-dev openssl-dev make && \
  rm -rf /var/cache/apk/*

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_SSH_PIPELINING True
