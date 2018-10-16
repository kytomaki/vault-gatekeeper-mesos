DOCKER := docker run --rm -v $(shell pwd):/go/src/github.com/nemosupremo/vault-gatekeeper
NAME := gatekeeper
VERSION := 1.0.3
ITERATION := 1
RPM := $(NAME)-$(VERSION)-$(ITERATION).x86_64.rpm
BINARY := dist/gatekeeper
