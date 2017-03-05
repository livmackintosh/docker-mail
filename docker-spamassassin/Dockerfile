FROM debian:8
LABEL maintainer "Olivia Mackintosh <livvy@protonmail.com>"

ENV USER docker-spamassassin

# Create User
RUN apt-get update && apt-get upgrade -y\
 && apt-get install -y sudo\
 && useradd -mG sudo -s /bin/bash $USER\
 && echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
USER $USER

RUN sudo apt-get install -y\
     spamassassin \
     spamc

ENTRYPOINT ["/usr/sbin/spamd"]
