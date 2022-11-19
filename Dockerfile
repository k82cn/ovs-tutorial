FROM ubuntu:20.04

RUN apt-get update && apt-get install -y git autoconf build-essential libtool python3

# Download ovn
RUN git clone -b branch-21.09 http://github.com/ovn-org/ovn
# Download ovs
RUN cd ovn && git submodule update --init

# Install ovn/ovs
RUN cd ovn/ovs && ./boot.sh && ./configure --prefix /usr/local/kvn && make && make install
RUN cd ovn && ./boot.sh && ./configure --prefix /usr/local/kvn && make && make install

ENV KVN_HOME=/usr/local/kvn
ENV PATH=$KVN_HOME/bin:$KVN_HOME/sbin:$PATH

