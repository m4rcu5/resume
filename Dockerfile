FROM debian:8

#
# prepare the build environment
#
RUN apt update && \
    apt install -y build-essential wget git-core \
                   fontconfig libfreetype6 libx11-6 libxext6 libxrender1 zlibc xz-utils

#
# fetch wkhtmltopdf
#
WORKDIR /usr/src

RUN wget -O wkhtmltox.tar.xz \
      https://downloads.wkhtmltopdf.org/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz &&\
    tar xf wkhtmltox.tar.xz

WORKDIR wkhtmltox

RUN install -m 0755 bin/* /usr/local/bin

#
# fetch & compile multimarkdown
#
WORKDIR /usr/src

RUN git clone --recursive https://github.com/fletcher/MultiMarkdown-4.git

WORKDIR MultiMarkdown-4

RUN make && make install
