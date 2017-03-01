FROM debian:8
LABEL maintainer "Olivia Mackintosh <livvy@base.nu>"

# Environment
ENV TREES_GIT_URL "https://0xacab.org/riseuplabs/trees.git"
ENV ARGON_PLUGIN_GIT "https://github.com/LuckyFellow/dovecot-libsodium-plugin"
ENV USER "docker-mail"

# Create User
RUN apt-get update && apt-get upgrade -y\
 && apt-get install -y sudo\
 && useradd -mG sudo -s /bin/bash $USER\
 && echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
USER $USER

# Depenencies
WORKDIR /home/${USER}
RUN echo "deb http://deb.debian.org/debian jessie-backports main"\
     | sudo tee -a /etc/apt/sources.list && sudo apt-get update -y\
 && sudo apt-get install -y\
     autoconf\
     build-essential\
     dovecot-core\
     dovecot-imapd\
     dovecot-lmtpd\
     dovecot-mysql\
     dovecot-dev\
     git\
     libtool\
 && sudo apt-get install -t jessie-backports\
     libsodium18\
     libsodium-dev\
 && git clone $TREES_GIT_URL src/trees\
 && git clone $ARGON_PLUGIN_GIT src/argon

# Compile Trees
WORKDIR /home/${USER}/src/trees
RUN bash -c "./autogen.sh && ./configure && make"\
 && sudo cp src/.libs/lib18_trees_plugin.so /usr/lib/dovecot/modules/

# Dovecot Setup
ADD ./etc/dovecot/ /etc/dovecot/

USER root
ENTRYPOINT ["/usr/sbin/dovecot", "-F", "-c", "/etc/dovecot/dovecot.conf"]
