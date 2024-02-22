NAME=optAlg
REFERENCES=references.bib

# process all subdirs not starting by _* using their own makefile
SUBDIRS=$(shell find . -maxdepth 1 -regex '.*/[^\._][^/]*' -type d -printf %P\\n)

TEMPS=*.aux *.log *.toc *.bbl *.blg
TEX=lualatex


.PHONY :  $(SUBDIRS) all sk en


all: sk en 
		

en:  ${NAME}_en.pdf	
	echo "en"

sk: ${NAME}_sk.pdf
	echo "sk"


%.pdf: %.tex $(REFERENCES) $(SUBDIRS)
	$(TEX) $<
	# Run BibTeX if missing citations
	@if(grep "Citation" $(basename $<).log > /dev/null);\
	then \
	bibtex $(basename $<) ;\
	$(TEX) $<; \
	fi
	@if(grep "Citation" $(basename $<).log > /dev/null);\
	then \
	$(TEX) $<; \
	fi
	# Recompile if instructed
	@if(grep "Rerun" $(basename $<).log > /dev/null);\
	 then \
	 $(TEX) $<; \
	 fi

${SUBDIRS}:
	#$(MAKE) -C $@  # temporarily disabled


clean:
	rm -f $(TEMPS)

.PHONY: clean
