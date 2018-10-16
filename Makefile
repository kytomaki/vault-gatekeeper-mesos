include common.mk

all: $(BINARY)

rpm: dist/$(RPM)

$(BINARY) : cmd/gatekeeper/main.go
	$(DOCKER) $(GOLANG_IMAGE):$(GOLANG_TAG) make -C /go/src/github.com/nemosupremo/vault-gatekeeper -f Makefile.docker $@

dist/$(RPM): $(BINARY)
	$(DOCKER) $(FPM_IMAGE):$(FPM_TAG) make -C /go/src/github.com/nemosupremo/vault-gatekeeper -f Makefile.docker $@

clean:
	-rm -f dist/$(RPM) $(BINARY)

.PHONY: all rpm clean
