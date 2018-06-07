FROM centos
MAINTAINER wangyunpeng "wangyunpeng@yappam.com"
ENV TZ=Asia/Shanghai
#ADD zimg.tar.gz /
#ADD Makefile /zimg/
RUN yum install git epel-* -y  \
    && cd / ;git clone https://github.com/buaazp/zimg -b master --depth=1
    && yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y \
    &&  yum install -y  nasm libtool autoconf openssl  libevent \
        libevent2 libevent2-devel  libjpeg-turbo \
        ncurses-devel make automake gcc-c++ openssl-devel \
        cmake libevent-devel libjpeg-devel giflib-devel libpng-devel \
        libwebp-devel ImageMagick6* libmemcached-devel \
    && cd /zimg   && make && /bin/sed -i "s/is_daemon       = 1/is_daemon       = 0/g" bin/conf/zimg.lua \
    && /bin/rm build/ deps/ doc/ specs/ src/ test/ -rf \
    &&  yum remove git make cmake automake memcached gcc-c++ -y && yum clean all
EXPOSE 4869
VOLUME  /zimg/bin/img 
WORKDIR /zimg/bin
#  Define default command.
CMD [ "./zimg", "conf/zimg.lua"]

