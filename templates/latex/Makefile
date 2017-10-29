
PROJECT=template

PDFVIEWER=evince
DVIVIEWER=xdvi

.PHONY: all clean

.DEFAULT_GOAL := $(PROJECT).dvi

$(PROJECT).dvi: $(PROJECT).tex
	+@echo "Generating $@ . . ."
	@latex $<
	@$(DVIVIEWER) $@ &

clean:
	rm -f *.log *.aux *.dvi *.pdf *.out

$(PROJECT).pdf: $(PROJECT).tex
	+@echo "Generating $@ . . ."
	@pdflatex $<
	@$(PDFVIEWER) $@ &

all: $(PROJECT).pdf

