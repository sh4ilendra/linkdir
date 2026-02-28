PREFIX ?= $(HOME)/.local/bin
BASH_COMPLETION_DIR ?= $(HOME)/.local/share/bash-completion/completions
BIN_NAME ?= linkdir
SCRIPT := bin/linkdir
COMPLETION := completions/linkdir-completion.bash

.PHONY: help check install uninstall install-completion uninstall-completion

help:
	@echo "Targets:"
	@echo "  make check                - Validate bash syntax"
	@echo "  make install              - Install linkdir to \`$(PREFIX)\`"
	@echo "  make uninstall            - Remove installed linkdir binary"
	@echo "  make install-completion   - Install bash completion"
	@echo "  make uninstall-completion - Remove installed bash completion"

check:
	bash -n $(SCRIPT)
	bash -n $(COMPLETION)

install: check
	mkdir -p "$(DESTDIR)$(PREFIX)"
	install -m 0755 $(SCRIPT) "$(DESTDIR)$(PREFIX)/$(BIN_NAME)"

uninstall:
	rm -f "$(DESTDIR)$(PREFIX)/$(BIN_NAME)"

install-completion: check
	mkdir -p "$(DESTDIR)$(BASH_COMPLETION_DIR)"
	install -m 0644 $(COMPLETION) "$(DESTDIR)$(BASH_COMPLETION_DIR)/$(BIN_NAME)"

uninstall-completion:
	rm -f "$(DESTDIR)$(BASH_COMPLETION_DIR)/$(BIN_NAME)"
