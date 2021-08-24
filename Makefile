NAME = sarnevesht
TARGET = bin/sarnevesht

.PHONY: build test

all: build test

build:
	nimble -d:ssl build --verbose
	mkdir -p bin
	mv $(NAME) $(TARGET)

test:
	$(TARGET)

install:
	install -Dm755 "$(TARGET)" "$(DESTDIR)/usr/bin/$(NAME)"
	install -Dm644 "LICENSE" "$(DESTDIR)/usr/share/licenses/$(NAME)/LICENSE"

uninstall:
	rm -rfv "$(DESTDIR)/usr/bin/$(NAME)" "$(DESTDIR)/usr/share/licenses/$(NAME)"
