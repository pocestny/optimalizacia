FIGURES=$(addsuffix .pdf,$(basename $(shell ls *.svg)))

all: $(FIGURES)

%.pdf: %.svg
	inkscape -D -A `basename $< .svg`.pdf $< 

clean:
	rm -fv *.pdf
