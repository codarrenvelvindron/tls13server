# TLS 1.3 test server
- This is a tls 1.3 test server using docker
- Built with Alpine Linux, nginx 1.13.12, openssl 1.1.1 pre4, pcre, zlib, openresty_headers for nginx

## Setup Instructions
- Clone this repo
- cd tls13server
- Replace certs/ssl.crt with your own site certificate (or self signed)
- Replace certs/ssl.key with your own private key
- Modify nginx.conf to your taste (it already works perfectly)
- In the main directory, build Dockerfile using:
- docker build -t openssl_nginx_alpine .
- Run using: docker run -dit --restart unless-stopped -p 443:443 -p 80:80 alpine_nginx-openssl

## Sample test server
- https://tls14.com
- Use command line options: openssl s_client -connect tls14.com:443 -tls1_3
