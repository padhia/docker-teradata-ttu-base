FROM ubuntu:latest

ARG tools="w"
ARG cmd="/usr/bin/ttuversion"

COPY TeradataToolsAndUtilitiesBase__ubuntu_*.tar.gz /tmp/

RUN apt-get update && \
    apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install ksh lib32stdc++6 && \
    cd /tmp && \
    tar -xvaf TeradataToolsAndUtilitiesBase__ubuntu_*.tar.gz && \
    TeradataToolsAndUtilitiesBase/setup.bat $tools && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf TeradataToolsAndUtilitiesBase && \
    rm -f TeradataToolsAndUtilitiesBase__ubuntu_*.tar.gz && \
    rm -f /*.deb && \
    echo "bash -c /opt/teradata/client/*/bin/ttulistproducts_unix.sh" > /usr/bin/ttuversion && \
    chmod +x /usr/bin/ttuversion

ENV ODBCINST /opt/teradata/client/ODBC_64/odbcinst.ini
ENV DEFAULT_TTU_CMD $cmd

CMD "$DEFAULT_TTU_CMD"
