FROM ubuntu:16.04

WORKDIR /root

RUN apt-get update &&\
    apt-get install -y unzip zip curl make autoconf g++ &&\
    curl -L -O https://github.com/ideawu/ssdb/archive/master.zip &&\
    unzip master.zip &&\
    # clean up dir
    rm -f master.zip &&\
    # compile SSDB
    cd ssdb-master &&\
    make &&\
    make install &&\
    # clean up
    apt-get -y purge unzip unzip zip curl make autoconf g++ &&\
    apt-get -y autoremove &&\
    apt-get -y clean all

EXPOSE 6379

CMD ['/usr/bin/bash','/root/ssdb-master/ssdb-server','/root/ssdb.conf']

ADD ./ssdb.conf /root