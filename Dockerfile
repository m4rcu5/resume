FROM debian:8

#
# Software versions used
#
ENV WK_MAYOR 0.12
ENV WK_VERSION 0.12.4

ENV MM_MAYOR 4

#
# prepare the build environment
#
RUN apt update && \
    apt install -y build-essential curl git-core \
                   fontconfig libfreetype6 libx11-6 libxext6 libxrender1 zlibc xz-utils

#
# fetch wkhtmltopdf
#
WORKDIR /usr/src

RUN curl -SL https://downloads.wkhtmltopdf.org/${WK_MAYOR}/${WK_VERSION}/wkhtmltox-${WK_VERSION}_linux-generic-amd64.tar.xz | tar xJ

WORKDIR wkhtmltox

RUN install -m 0755 bin/* /usr/local/bin

#
# fetch & compile multimarkdown
#
WORKDIR /usr/src

RUN git clone --recursive https://github.com/fletcher/MultiMarkdown-${MM_MAYOR}.git

WORKDIR MultiMarkdown-${MM_MAYOR}

RUN make && make install
