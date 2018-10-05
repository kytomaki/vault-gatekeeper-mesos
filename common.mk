DOCKER := docker run --rm -v $(shell pwd)/../../../..:/go
RPM_NAME := gatekeeper
VERSION := 1.0.3
ITERATION := 1
RPM := $(RPM_NAME)-$(VERSION)-$(ITERATION).x86-64.rpm
GATEKEEPER := dist/gatekeeper
