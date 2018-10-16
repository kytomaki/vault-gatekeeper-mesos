include common.mk

all: $(BINARY)

rpm: dist/$(RPM)

$(BINARY) : cmd/gatekeeper/main.go
	$(DOCKER) docker.br.hmheng.io/hmheng-infra/gatekeeper-build:v1.0.3-10-ga65b145 make -C /go/src/github.com/nemosupremo/vault-gatekeeper -f Makefile.docker $@

dist/$(RPM): $(BINARY)
	$(DOCKER) docker.br.hmheng.io/hmheng-infra/fpm:latest make -C /go/src/github.com/nemosupremo/vault-gatekeeper -f Makefile.docker $@

clean:
	-rm -f dist/$(RPM) $(BINARY)

.PHONY: all rpm clean
