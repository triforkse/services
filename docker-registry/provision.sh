#!/bin/bash

set -e

# Docker Daemon

sudo apt-get update
sudo apt-get install -y docker.io

# Registry

sudo docker run \
         -e SETTINGS_FLAVOR=s3 \
         -e AWS_BUCKET= \
         -e STORAGE_PATH=/registry \
         -e AWS_KEY=$TF_S3_API_KEY_ \
         -e AWS_SECRET=$TF_S3_SECRET_KEY \
         -e SEARCH_BACKEND=sqlalchemy \
         -e AWS_REGION=eu-west-1 \
         -p 5000:5000 \
         --name docker_registry \
         registry

sudo docker stop docker_registry

sudo cp ./docker-registry.conf /etc/init/

sudo initctl reload-configuration
sudo start docker-registry

# Nginx

sudo apt-get install -y git nginx-extras apache2-utils

sudo cp nginx.conf /etc/nginx/sites-enabled/docker-registry
sudo cp ./triforkse.crt /etc/ssl/certs/triforkse.crt
sudo cp ./triforkse.key /etc/ssl/private/triforkse.key

sudo htpasswd -bc /etc/nginx/docker-registry.htpasswd $TF_USERNAME $TF_PASSWORD

sudo service nginx restart