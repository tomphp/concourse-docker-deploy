FROM concourse/buildroot:iptables

ADD docker/ /usr/local/bin/
RUN /usr/local/bin/docker --version

ADD buildcache /usr/local/bin/buildcache

COPY ./resource /opt/resource
RUN chmod +x /opt/resource/*
