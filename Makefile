.PHONY: all
all: build/poems/index.html

.PHONY: clean
clean:
	rm -rf build

build/poems/index.html: script/poems.sh poems/*
	mkdir -p $(shell dirname $@)
	bash $< >$@
