# Makefile for resume
#
# TODO: Add release target

# Base filename
FILE = Marcus_van_Dam

# Targets
.PHONY: help html pdf release

# Some help using this Makefile
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make the HTML file"
	@echo "  pdf        to make a standalone pdf file"
	@echo
	@echo "  watch      to continuesly update the html output"
#	@echo "  release    to create a new release and upload it to github"

#
# File types to build
#
html: $(FILE).html
pdf: $(FILE).pdf

%.html: %.md
	multimarkdown $< > $@
	@echo
	@echo "Building HTML finished."

%.pdf: %.html
	wkhtmltopdf -B 0 -L 0 -R 0 -T 0 page $< $@
	@echo
	@echo "Building PDF finished."


#
# Watch target
#
watch: html
	@echo "Watching $(FILE).md for changes."
	@echo
	while true; do inotifywait -e modify $(FILE).md && make html; done
