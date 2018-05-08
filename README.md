# TLS 1.3 test server
- This is a tls 1.3 test server using docker
by [hackers.mu](https://hackers.mu)
- Built with 
1. Alpine Linux
2. Nginx 1.13.12 (compiled from source) 
3. Openssl 1.1.1 prerelease 5 (Compiled from source) 
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
- Running using volumes for logs/certs: docker run -dit -v "$(pwd)"/logs:/etc/nginx/logs -v "$(pwd)"/html:/etc/nginx/html -v "$(pwd)"/certs:/etc/nginx/certs  --restart unless-stopped -p 80:80 -p 443:443 openssl_nginx_alpine

## Sample test server
- https://tls14.com
- Use command line options: openssl s_client -connect tls14.com:443 -tls1_3

## Usage
- The Dockerfile is built in such a way that the log files and certs are externally mounted in volumes.
- This means that any change to the static html files are immediately reflected upon the container.
- All the while without having to rebuild the container.
- Especially useful when renewing certificates and reading the log files without having to log on to the container.

## Author
Codarren Velvindron - codarren at hackers.mu
