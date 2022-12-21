PLUGIN_NAME = custom-favicon
PLUGIN_PATH = easydb-custom-favicon

L10N_FILES = l10n/$(PLUGIN_NAME).csv

INSTALL_FILES = \
	$(WEB)/l10n/cultures.json \
	$(WEB)/l10n/de-DE.json \
	$(WEB)/l10n/en-US.json \
	$(JS) \
	manifest.yml

COFFEE_FILES = src/webfrontend/customFavicon.coffee

CSS_FILE = src/webfrontend/css/main.css

all: build

include easydb-library/tools/base-plugins.make

build: code buildinfojson

code: $(subst .coffee,.coffee.js,${COFFEE_FILES}) $(L10N)
	mkdir -p build
	mkdir -p build/webfrontend
	cat $^ > build/webfrontend/custom-favicon.js

clean: clean-base

wipe: wipe-base

.PHONY: clean wipe
