FROM ubuntu:16.04

WORKDIR /root

RUN apt-get update &&\
    apt-get install -y unzip zip curl make autoconf &&\
    curl -L -O https://github.com/ideawu/ssdb/archive/master.zip &&\
    unzip master.zip &&\
    # clean up dir
    rm -f master.zip &&\
    # compile SSDB
    cd ssdb-master &&\
    make &&\
    make isntall
    # clean up
    apt-get -y purge unzip unzip zip curl make autoconf &&\
    apt-get -y autoremove &&\
    apt-get -y clean all &&\

CMD ['/usr/bin/bash','/root/ssdb-master/ssdb-server','ssdb.conf']