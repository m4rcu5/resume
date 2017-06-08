# Makefile for resume
#
# TODO: Add release target

# Base filename
FILE = Marcus_van_Dam

# Build directory
BUILDDIR = build

# Targets
.PHONY: help html pdf release

# Some help using this Makefile
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make the HTML file"
	@echo "  pdf        to make a standalone pdf file"
	@echo
	@echo "  watch      to continuesly update the html output"

#
# File types to build
#
html: $(BUILDDIR)/$(FILE).html
pdf: $(BUILDDIR)/$(FILE).pdf

$(BUILDDIR)/%.html: %.md
	@mkdir -p $(@D)
	multimarkdown $< > $@
	@echo "Building HTML finished."
	@cp -r css/ images/ --target-dir=$(@D)
	@echo "Copied CSS and images."
	@ln -s $(notdir $@) $(@D)/index.html
	@echo "Linking index.html."

$(BUILDDIR)/%.pdf: $(BUILDDIR)/%.html
	@mkdir -p $(@D)
	wkhtmltopdf --print-media-type -B 0 -L 0 -R 0 -T 0 page $< $@
	@echo "Building PDF finished."


#
# Watch target
#
watch: html
	@echo "Watching $(FILE).md for changes."
	@echo
	while true; do inotifywait -e modify $(FILE).md && make html; done
