
.PHONY: all
all:
	$(MAKE) -C lib/github.com/diku-dk/sml-complex all

.PHONY: test
test:
	$(MAKE) -C lib/github.com/diku-dk/sml-complex test

.PHONY: clean
clean:
	$(MAKE) -C lib/github.com/diku-dk/sml-complex clean
	rm -rf MLB *~ .*~
