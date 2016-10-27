FROM debian:wheezy

MAINTAINER Valerii Savchenko <wellic72@gmail.com>

ARG DOCKER_GROUP_ID
ARG DOCKER_USER_ID

USER 0

RUN groupadd --gid ${DOCKER_GROUP_ID} web-user
RUN useradd  --gid ${DOCKER_GROUP_ID} --uid ${DOCKER_USER_ID} --create-home --shell /bin/bash web-user
RUN usermod --append --groups sudo web-user
RUN mkdir -p /etc/sudoers.d
RUN echo "web-user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/web-user
RUN chmod 400 /etc/sudoers.d/web-user

USER web-user

WORKDIR /home/web-user
