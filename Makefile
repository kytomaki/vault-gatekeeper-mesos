DOCKER := docker run --rm -v $(shell pwd)/../../../..:/go

GATEKEEPER := dist/gatekeeper

all: $(GATEKEEPER)

$(GATEKEEPER) : cmd/gatekeeper/main.go
	$(DOCKER) gatekeeper-build go build -ldflags "-X main.BuildTime=`date -u '+%Y-%m-%d_%I:%M:%S%p'` -X main.Version=`git -C ./ describe --abbrev=0 --tags HEAD`" -a -installsuffix cgo -o src/github.com/nemosupremo/vault-gatekeeper/dist/gatekeeper github.com/nemosupremo/vault-gatekeeper/cmd/gatekeeper
