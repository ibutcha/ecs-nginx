-include Makefile.env

SHELL := /bin/bash
.DEFAULT_GOAL := all

.PHONY: all
## all: (default) runs build-image
all: build-image

build-image:
	docker build -t $(ECR_ACCOUNT)$(CONTAINER):$GIT_COMMIT \
		-t $(ECR_ACCOUNT)$(CONTAINER):latest
