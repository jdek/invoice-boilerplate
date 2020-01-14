default: all

TEX = pandoc
src = template.tex details.yml
FLAGS = --pdf-engine=xelatex

INVOICES = $(filter-out details.yml,$(wildcard *.yml))
PDFS = $(INVOICES:%.yml=%.pdf)

%.pdf: %.yml template.tex
	$(TEX) -f markdown $< -o $@ --template=template.tex $(FLAGS)

all: $(PDFS)

.PHONY: clean
clean:
	rm *.pdf
