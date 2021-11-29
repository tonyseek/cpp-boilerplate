.PHONY: all

all: $(shell awk '{print $$1}' < VERSIONS)

%.cmake:
	wget -O "$@" "$(shell awk -v key="$@" '$$1==key {print $$2; exit}' < VERSIONS)"
