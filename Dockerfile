FROM ubuntu:latest

ARG tools="a"
ARG cmd="/usr/bin/ttuversion"

COPY TeradataToolsAndUtilitiesBase__ubuntu_*.tar.gz /tmp/

RUN apt-get update && \
    apt-get -y upgrade && \
    cd /tmp && \
    tar -xvaf TeradataToolsAndUtilitiesBase__ubuntu_*.tar.gz && \
    TeradataToolsAndUtilitiesBase/setup.sh $tools && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf TeradataToolsAndUtilitiesBase && \
    rm -f TeradataToolsAndUtilitiesBase__ubuntu_*.tar.gz && \
    rm -f /*.deb && \
    echo "bash -c /opt/teradata/client/*/bin/ttulistproducts_unix.sh" > /usr/bin/ttuversion && \
    chmod +x /usr/bin/ttuversion

ENV ODBCINST /opt/teradata/client/ODBC_64/odbcinst.ini
ENV DEFAULT_TTU_CMD $cmd

CMD "$DEFAULT_TTU_CMD"
