TARGETS=$(addsuffix .pdf, $(basename $(shell ls *.png)))

all: mkinp $(TARGETS)

%.txt: %.png
	convert $< gray:- | ./mkinp `identify -format "%w %h" $<` > $@

%.pdf: %.txt
	./plot.gpl $@ $< | gnuplot
