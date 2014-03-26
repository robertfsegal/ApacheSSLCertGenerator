#!/bin/sh

# Script to generate private key and self signed certificate for Apache SSL servers
#
# http://blog.httpwatch.com/2013/12/12/five-tips-for-using-self-signed-ssl-certificates-with-ios/
# http://blog.andyhunt.info/2011/11/26/apache-ssl-on-max-osx-lion-10-7/

hostname=$(ipconfig getifaddr en0)

echo "Hostname is -> ${hostname}"

#openssl genrsa -out server.key 2048
#openssl req -x509 -new -key server.key -out myCA.cer -days 730 -subj /CN="Get Set Games CA"
#openssl genrsa -out mycert1.key 2048
#openssl req -new -out mycert1.req -key mycert1.key -subj /CN=${hostname}
#openssl x509 -req -in mycert1.req -out mycert1.cer -CAkey server.key -CA myCA.cer -days 365 -CAcreateserial -CAserial serial

#openssl genrsa -out /etc/apacahe2/ssl/server.key 2048
#openssl req -x509 -new -key /etc/apacahe2/ssl/server.key -out /etc/apacahe2/ssl/request.csr -days 730 -subj /CN="Get Set Games CA"
#openssl x509 -req -days 365 -in /etc/apacahe2/ssl/request.csr -signkey /etc/apacahe2/ssl/server.key -out /etc/apacahe2/ssl/server.crt


#openssl genrsa -out mycert1.key 2048
#openssl req -new -out mycert1.req -key mycert1.key -subj /CN=${hostname}
#openssl x509 -req -in mycert1.req -out mycert1.cer -CAkey server.key -CA myCA.cer -days 365 -CAcreateserial -CAserial serial

rm "/etc/apache2/ssl/*"

openssl genrsa -out /etc/apache2/ssl/server.key 2048
openssl req -new -x509 -key /etc/apache2/ssl/server.key -out /etc/apache2/ssl/server.crt -days 365 -subj /CN=${hostname}