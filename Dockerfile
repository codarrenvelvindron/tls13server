FROM alpine:latest
WORKDIR /
RUN apk update && apk upgrade && apk add bash && apk add build-base \
    perl \
    libc-dev \
    git \
    linux-headers \
    && wget https://www.openssl.org/source/openssl-1.1.1-pre5.tar.gz \
    && tar -xvzf openssl-1.1.1-pre5.tar.gz && cd openssl-1.1.1-pre5 \
    && ./Configure linux-x86_64 --prefix=/usr --openssldir=/usr no-async && make && make install \
    && git clone https://github.com/openresty/headers-more-nginx-module.git \
    && wget http://nginx.org/download/nginx-1.13.12.tar.gz \ 
    && tar -xvzf nginx-1.13.12.tar.gz && cd nginx-1.13.12 \
    && git clone https://github.com/openresty/headers-more-nginx-module.git \
    && wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz \
    && wget http://zlib.net/zlib-1.2.11.tar.gz \
    && tar -xvzf pcre-8.42.tar.gz \
    && tar -xvzf zlib-1.2.11.tar.gz \
    && ./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf \
       --pid-path=/var/run/nginx/nginx.pid --with-pcre=pcre-8.42 --with-zlib=zlib-1.2.11 \
       --with-http_ssl_module --with-http_v2_module --add-module=../headers-more-nginx-module \
    && make && make install \
    && rm -rf /openssl-1.1.1-pre5

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
