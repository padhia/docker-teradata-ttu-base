FROM centos:centos7

ADD TeradataToolsAndUtilities*.tar.gz /tmp/ttu/

RUN yum install -y glibc.i686 libgcc.i686 libstdc++.i686 nss-softokn-freebl.i686 && \
    yum clean all && \
	/tmp/ttu/setup.bat w && \
	rm -rf /tmp/ttu/

EXPOSE 1025
