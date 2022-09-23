FROM debian:latest

# Expose the HTTP port,
# and default ports for team/class, individual, demo,
# and a few others in case necessary.
EXPOSE 25/tcp 80/tcp 110/tcp
EXPOSE 12070/tcp 12071/tcp 12080/tcp 12081/tcp 12090/tcp 12091/tcp
EXPOSE 13070/tcp 13071/tcp 13080/tcp 13081/tcp 13090/tcp 13091/tcp

# There is dialog prompts for setting timezone from one of the
# dependencies, it is disabled by setting up the following
# environment variable.
ARG DEBIAN_FRONTEND=noninteractive

# Update
RUN apt-get update && apt-get clean

# Install Bibledit Cloud's requirements
COPY requirements /requirements
RUN cat requirements | xargs apt-get install -y

# Install personal config files
COPY tmux.conf /etc/tmux.conf
RUN sed -i '1 i\set nu rnu\nset path +=**\ncolorscheme elflord' /etc/vim/vimrc

# Supress AH00558 Apache2 debug message about ServerName
RUN sed -i '1 i\ServerName 172.17.0.2' /etc/apache2/apache2.conf

# Create users
RUN useradd -s /bin/bash -m -Gsudo p12070 \
	&& useradd -s /bin/bash -m -Gsudo p12080 \
	&& useradd -s /bin/bash -m -Gsudo p12090 \
	&& useradd -s /bin/bash -m -Gsudo p13070 \
	&& useradd -s /bin/bash -m -Gsudo p13080 \
	&& useradd -s /bin/bash -m -Gsudo p13090

# Copy scripts
COPY scripts/* /

# Add config files for enabling Indonesian Cloud Free on user p12070,
# port configuration, and administrator's account preset
# RUN cd /home/p12070/config \
# 	&& touch indonesiancloudfree network-port network-port-secure \
# 	&& echo "12070" > network-port \
# 	&& echo "12071" > network-port-secure \
# 	&& touch admin-username admin-password admin-email \
# 	&& echo "user" > admin-username \
# 	&& echo "password" > admin-password \
# 	&& echo "user@localhost" > admin-email
