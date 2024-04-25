#!/bin/sh

cert_file=/usr/local/openresty/nginx/cert/default.crt
cert_key_file=/usr/local/openresty/nginx/cert/default.key

if [ ! -f "$cert_file" ]; then
    # Generate the certificate
    echo "Generating certificate..."
    if [ ! -d "$(dirname $cert_file)" ]; then
        mkdir -p $(dirname $cert_file)
    fi
    apk add openssl --no-cache
    openssl req -x509 -newkey rsa:2048 -keyout $cert_key_file -out $cert_file -days 3650 -nodes -subj "/C=US/O=Let's Encrypt/CN=www.cloudflare.com"
    apk del openssl
    # Check if the certificate generation was successful
    if [ $? -eq 0 ]; then
        echo "Certificate generated successfully."
    else
        echo "Failed to generate certificate. Exiting..."
        exit 1
    fi
fi

# Start OpenResty
echo "Starting OpenResty..."
# Add your OpenResty startup command here
/usr/local/openresty/bin/openresty -g "daemon off;"
