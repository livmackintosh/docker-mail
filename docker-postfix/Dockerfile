FROM debian:8
LABEL maintainer "Olivia Mackintosh <livvy@protonmail.com>"

ENV USER docker-postfix

# Create User
RUN apt-get update && apt-get upgrade -y\
 && apt-get install -y sudo\
 && useradd -mG sudo -s /bin/bash $USER\
 && echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
USER $USER

RUN sudo apt-get install -y\
     postfix\
     postfix-mysql\
     supervisor\
     rsyslog

RUN echo $MAIL_NAME | sudo tee /etc/mailname

COPY /etc/ /etc/

CMD sudo /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
