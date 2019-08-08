OUTDIR := out

all:	$(OUTDIR)/example.pdf

$(OUTDIR)/%.pdf:	%.tex FORCE_MAKE
	latexmk $<

clean:
	rm -rf $(OUTDIR)

.PHONY:	all clean FORCE_MAKE gdrive

# include gdrive helper targets
include ../Makefile.gdrive
