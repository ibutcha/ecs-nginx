-include Makefile.env

SHELL := /bin/bash
.DEFAULT_GOAL := all

.PHONY: all
## all: (default) runs build-image
all: build-image

build-image:
	docker ps | sudo service docker start && sudo usermod -a -G docker ec2-user
	$(aws ecr get-login --region $(REGION) --no-include-email)
	REPOSITORY_URI=`aws ecr describe-repositories --repository-names $(CONTAINER) | grep repositoryUri | cut -d '"' -f 4`
    IMAGE_TAG=`git rev-parse --short HEAD`
