FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y build-essential libcurl4-openssl-dev git automake
RUN	git clone https://github.com/pooler/cpuminer
RUN	cd cpuminer && ./autogen.sh
RUN	cd cpuminer && ./configure CFLAGS="-O3"
RUN	cd cpuminer && make

WORKDIR	/cpuminer
ENTRYPOINT	["./minerd"]
