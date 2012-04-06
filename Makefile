# $Id$
DVIPDFM=/usr/local/bin/dvipdfm
PDFLATEX:=$(shell which pdflatex)
FILENAME=patterns
DVI_EXT=dvi
PS_EXT=ps
PDF_EXT=pdf
FILES=$(shell ls -1 *.tex | perl -p -e 'BEGIN { $$\ = " " } chomp; ')
SCP:=$(shell which scp)
DEST=comdog@panix2.panix.com:public_html/Patterns

RM=/bin/rm -rf

pdf: $(FILES)
	$(PDFLATEX) $(FILENAME)
	@ touch pdf

upload: $(FILENAME).$(PDF_EXT) 
	$(SCP) $(FILENAME).$(PDF_EXT) $(DEST)
	@ touch upload

clean:
	$(RM) *.$(DVI_EXT) *.$(PS_EXT) *.$(PDF_EXT) upload *.aux *.toc

realclean:
	$(RM) *.aux *.dvi *.toc *.ps *.pdf upload pdf

files:
	@ echo "I think the chapters are ---"
	@ echo $(FILES)
	@ echo "-------------------------"

