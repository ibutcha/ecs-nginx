-include Makefile.env

SHELL := /bin/bash
.DEFAULT_GOAL := all

.PHONY: all
## all: (default) runs build-image
all: build-image

build-image:
	docker ps | sudo service docker start && sudo usermod -a -G docker ec2-user
	`aws ecr get-login --region $(REGION) --no-include-email`
#    IMAGE_TAG=`git rev-parse --short HEAD`
	echo $(REPOSITORY_URI)
