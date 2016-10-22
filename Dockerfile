FROM concourse/buildroot:iptables

COPY ./resource /opt/resource
RUN chmod +x /opt/resource/*
