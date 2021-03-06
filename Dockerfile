FROM centos:7
LABEL maintainer="wyp <wangyp0701@gmail.com>"
ENV TZ Asia/Shanghai
ENV TINI_VERSION 0.19.0
ENV ZIMG_VERSION 3.2.0

RUN     yum update -y   \ 
     && yum install -y  nasm libtool autoconf openssl \
        libevent-devel  libjpeg-turbo libpng-devel \
        ncurses-devel make automake gcc-c++  \
        cmake   giflib-devel  file \
        libmemcached-devel git \
    && git clone https://github.com/buaazp/zimg -b master --depth=1 \
    && curl -fSL "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini" -o /usr/local/bin/tini \
    && chmod +x /usr/local/bin/tini \
    && cd /zimg   && make && /bin/sed -i "s/is_daemon       = 1/is_daemon       = 0/g" bin/conf/zimg.lua \
    && yum remove git make cmake autoconf gcc automake memcached gcc-c++ -y \
    && yum clean all \
    && rm /var/log/* /zimg/build /zimg/d* /zimg/s* /zimg/test -rf \
    && mkdir /zimg/bin/log \
    && ln -sf /dev/stdout /zimg/bin/log/zimg.log
EXPOSE 4869
VOLUME  /zimg/bin/img 
WORKDIR /zimg/bin
ENTRYPOINT ["tini", "--"]
# Define default command.
CMD [ "./zimg", "conf/zimg.lua"]
