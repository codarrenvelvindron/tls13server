# TLS 1.3 test server
- This is a tls 1.3 test server using docker
by [hackers.mu](https://hackers.mu)
- Built with 
1. Alpine Linux
2. Nginx 1.13.12 (compiled from source) 
3. Openssl 1.1.1 prerelease 4 (Compiled from source) 
4. PCRE-8.42
5. Zlib-1.2.11
6. Openresty - headers-more-nginx-module

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

## Author
Codarren Velvindron - codarren at hackers.mu
