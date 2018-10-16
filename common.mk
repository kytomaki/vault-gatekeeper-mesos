# Images to use in dockerized builds
# Can be overriden with environment variables
GOLANG_IMAGE ?= golang
GOLANG_TAG ?= latest
FPM_IMAGE ?= micktwomey/fpm
FPM_TAG ?= latest

DOCKER := docker run \
	--rm -v $(shell pwd):/go/src/github.com/nemosupremo/vault-gatekeeper \
	--entrypoint ""
NAME := gatekeeper
VERSION := 1.0.3
ITERATION := 1
RPM := $(NAME)-$(VERSION)-$(ITERATION).x86_64.rpm
BINARY := dist/gatekeeper
