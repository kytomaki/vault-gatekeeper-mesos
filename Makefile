include common.mk

all: $(RPM)

$(GATEKEEPER) : cmd/gatekeeper/main.go
	$(DOCKER) docker.br.hmheng.io/hmheng-infra/gatekeeper-build:v1.0.3-10-ga65b145 make -C /go/src/github.com/nemosupremo/vault-gatekeeper -f Makefile.docker $@

$(RPM): $(GATEKEEPER)
	$(DOCKER) docker.br.hmheng.io/hmheng-infra/fpm:latest make -C /go/src/github.com/nemosupremo/vault-gatekeeper -f Makefile.docker $@

clean:
	rm -r *.rpm dist/gatekeeper dist/package

.PHONY: all clean
