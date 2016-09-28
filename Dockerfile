FROM centos:centos7

COPY TeradataToolsAndUtilities*.tar.gz /tmp/

RUN yum install -y file ksh glibc.i686 libgcc.i686 libstdc++.i686 nss-softokn-freebl.i686 && \
    mkdir -p /tmp/ttu && \
    tar -xvaf /tmp/*tar.gz -C /tmp/ttu/ && \
    /tmp/ttu/setup.bat w && \
    yum remove -y ksh file && \
    yum clean all && \
    rm -rf /tmp/ttu/ /tmp/*tar.gz

EXPOSE 1025
