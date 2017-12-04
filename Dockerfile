#pull zimg
FROM docker.io/centos
MAINTAINER wangyunpeng "wangyunpeng@yappam.com"
#update yum
RUN rm -rf /etc/yum.repos.d/*
ADD yum.repo /etc/yum.repos.d/
#INSTALL ...
RUN yum install openssl memcached libevent  libevent2 libevent2-devel  libjpeg-turbo  ncurses-devel make automake gcc-c++ openssl-devel cmake libevent-devel libjpeg-devel giflib-devel libpng-devel libwebp-devel ImageMagick6* libmemcached-devel -y
ADD zimg.tar.gz /
ADD Makefile /zimg/  
RUN cd /zimg && make && sed -i "s/is_daemon       = 1/is_daemon       = 0/g" bin/conf/zimg.lua && rm -rf /etc/localtime;ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && yum remove make cmake automake memcached -y
#ADD app.sh /zimg/bin/
#Expose prots
EXPOSE 4869
VOLUME  /zimg/bin/img 
WORKDIR /zimg/bin
# Define default command.
CMD [ "./zimg", "conf/zimg.lua"]
