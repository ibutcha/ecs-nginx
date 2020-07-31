-include Makefile.env

SHELL := /bin/bash
.DEFAULT_GOAL := all

.PHONY: all
## all: (default) runs build-image
all: build-image

build-image:
	docker build -t $(AWS_ACCOUNT_NUMBER).dkr.ecr.$(AWS_REGION).amazonaws.com/$(REPO_NAME):$(GIT_COMMIT) \
		-t $(AWS_ACCOUNT_NUMBER).dkr.ecr.$(AWS_REGION).amazonaws.com/$(REPO_NAME):$(GIT_BRANCH) \
		-t $(AWS_ACCOUNT_NUMBER).dkr.ecr.$(AWS_REGION).amazonaws.com/$(REPO_NAME):latest .
