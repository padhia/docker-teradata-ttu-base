FROM ubuntu:rolling

COPY TeradataToolsAndUtilitiesBase__ubuntu_indep.*.tar.gz /tmp/

WORKDIR /tmp/

RUN apt-get update && apt-get -y upgrade && apt-get -y install lib32stdc++6
RUN tar -xvaf TeradataToolsAndUtilitiesBase__ubuntu_indep.*.tar.gz && \
    TeradataToolsAndUtilitiesBase/setup.bat w && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf TeradataToolsAndUtilitiesBase && \
    rm -f TeradataToolsAndUtilitiesBase__ubuntu_indep.*.tar.gz

ENV ODBCINST /opt/teradata/client/ODBC_64/odbcinst.ini

EXPOSE 1025
