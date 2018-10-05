include common.mk

all: $(RPM)

$(GATEKEEPER) : cmd/gatekeeper/main.go
	$(DOCKER) gatekeeper-build go build -ldflags "-X main.BuildTime=`date -u '+%Y-%m-%d_%I:%M:%S%p'` -X main.Version=`git -C ./ describe --abbrev=0 --tags HEAD`" -a -installsuffix cgo -o src/github.com/nemosupremo/vault-gatekeeper/dist/gatekeeper github.com/nemosupremo/vault-gatekeeper/cmd/gatekeeper

$(RPM): $(GATEKEEPER)
	$(DOCKER) docker.br.hmheng.io/hmheng-infra/fpm:latest make -C /go/src/github.com/nemosupremo/vault-gatekeeper -f Makefile.docker $@

clean:
	rm -r *.rpm dist/gatekeeper

.PHONY: all clean