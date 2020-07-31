#-include Makefile.env

SHELL := /bin/bash
.DEFAULT_GOAL := all

.PHONY: all
## all: (default) runs build-image
all: build-image

build-image:
	docker ps | sudo service docker start && sudo usermod -a -G docker ec2-user
