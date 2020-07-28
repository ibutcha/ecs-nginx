#!/bin/bash

$(aws ecr get-login --region ap-southeast-2 --no-include-email)

REPOSITORY_URI=$(aws ecr describe-repositories --repository-names nginx | grep repositoryUri | cut -d '"' -f 4)

IMAGE_TAG=$(git rev-parse --short HEAD)

docker build -t $REPOSITORY_URI:latest .

docker tag $REPOSITORY_URI:latest $REPOSITORY_URI:$IMAGE_TAG

docker push $REPOSITORY_URI:latest
docker push $REPOSITORY_URI:$IMAGE_TAG
