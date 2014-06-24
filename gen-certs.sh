#!/bin/sh

# Script to generate private key and self signed certificate for Apache SSL servers.  Details 
# taken from...
#
# http://blog.httpwatch.com/2013/12/12/five-tips-for-using-self-signed-ssl-certificates-with-ios/
# http://blog.andyhunt.info/2011/11/26/apache-ssl-on-max-osx-lion-10-7/
#
# I could not get SSL certificates to work using the OSX Server app.  
#
# Has details on getting SSL certificates to work with OSX Server application...
# http://stackoverflow.com/questions/20276907/enterprise-app-deployment-doesnt-work-on-ios-7-1
#
# NOTE - The generated server.crt should be made available for installation on devices.  It should be hosted 
# for download somewhere on the Apache server so iOS clients can install it.
#

hostname=$(ipconfig getifaddr en0)

echo "Hostname is -> ${hostname}"

rm "/etc/apache2/ssl/*"

openssl genrsa -out /etc/apache2/ssl/server.key 2048
openssl req -new -x509 -key /etc/apache2/ssl/server.key -out /etc/apache2/ssl/server.crt -days 365 -subj /CN=${hostname}

echo "Copy server.crt and server.key to appropriate location in your Apache configuration.  Default location is /etc/apache2/ssl/"