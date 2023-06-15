KEYRING_TARGET_DIR ?= $(PREFIX)/share/pacman/keyrings/
KEYRING_PREFIX=fzt-repo
KEYRING_FILE=$(KEYRING_PREFIX).gpg
KEYRING_REVOKED_FILE=$(KEYRING_PREFIX)-revoked
KEYRING_TRUSTED_FILE=$(KEYRING_PREFIX)-trusted
BUILD_DIR ?= build

SOURCES=$(shell find keyring -type f)
ARCHLINUX_KEYRING_SRC ?= archlinux-keyring

build: $(SOURCES)
	$(ARCHLINUX_KEYRING_SRC)/keyringctl -v $(BUILD_DIR)
	./rename-keyring.sh

install:
	install -vDm 644 $(BUILD_DIR)/{$(KEYRING_FILE),$(KEYRING_REVOKED_FILE),$(KEYRING_TRUSTED_FILE)} -t $(DESTDIR)$(KEYRING_TARGET_DIR)

check:


.PHONY: install check
