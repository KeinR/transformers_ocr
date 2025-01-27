PROG = transformers_ocr
SHORT_PROG = trocr
PREFIX ?= /usr

all:
	@echo -e "\033[1;32mThis program doesn't need to be built. Run \"make install\".\033[0m"

install:
	@echo -e '\033[1;32mInstalling the program...\033[0m'
	install -Dm644 ./*.py -t "$(PREFIX)/lib/$(PROG)"
	install -Dm755 ./*.sh -t "$(PREFIX)/lib/$(PROG)"
	install -d "$(PREFIX)/bin"
	ln -sr -- "$(PREFIX)/lib/$(PROG)/$(PROG).sh" "$(PREFIX)/bin/$(PROG)"
	ln -sr -- "$(PREFIX)/lib/$(PROG)/$(PROG).sh" "$(PREFIX)/bin/$(SHORT_PROG)"

uninstall:
	@echo -e '\033[1;32mUninstalling the program...\033[0m'
	rm -- "$(PREFIX)/bin/$(PROG)" "$(PREFIX)/bin/$(SHORT_PROG)"
	rm -rf -- "$(PREFIX)/lib/$(PROG)"

.PHONY: install uninstall
