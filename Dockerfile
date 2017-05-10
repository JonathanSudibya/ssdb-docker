FROM ubuntu:16.04

WORKDIR /root

RUN apt-get update &&\
    apt-get install -y unzip &&\
    curl -L -O https://github.com/ideawu/ssdb/archive/master.zip &&\
    unzip master.zip &&\
    # clean up
    rm -f master.zip &&\
    apt-get purge unzip &&\
    apt-get autoremove &&\
    apt-get clean all &&\
    # compile SSDB
    cd ssdb-master &&\
    make &&\
    make isntall

CMD ['/usr/bin/bash','/root/ssdb-master/ssdb-server','ssdb.conf']