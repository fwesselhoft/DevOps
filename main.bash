#!/bin/bash

mkdir /tmp/s3Objects
cd /tmp/s3Objects
#download all objects from S3
aws s3 cp s3://devops2020jhu/ ./ --recursive

chmod +x /tmp/s3Objects/dockerAndComposeInstall.bash /tmp/s3Objects/installAWScli.bash /tmp/s3Objects/jenkinsInstall.bash

/tmp/s3Objects/installAWScli.bash
/tmp/s3Objects/dockerAndComposeInstall.bash
/tmp/s3Objects/jenkinsInstall.bash

docker-compose up -d
