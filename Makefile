.SUFFIXES: .m4 .ru .en .es .ptbr .pl
.m4.en:
	m4 --define=lang=en $*.m4 >$*.en
.m4.ru:
	m4 --define=lang=ru $*.m4 >$*.ru
.m4.es:
	m4 --define=lang=es $*.m4 >$*.es
.m4.ptbr:
	m4 --define=lang=ptbr $*.m4 >$*.ptbr
.m4.pl:
	m4 --define=lang=es $*.m4 >$*.pl

M4SOURCES := $(shell find . $(pwd) -name '*.m4')
RU_LISTINGS := $(M4SOURCES:%.m4=%.ru)
EN_LISTINGS := $(M4SOURCES:%.m4=%.en)
ES_LISTINGS := $(M4SOURCES:%.m4=%.es)
PL_LISTINGS := $(M4SOURCES:%.m4=%.pl)
PTBR_LISTINGS := $(M4SOURCES:%.m4=%.ptbr)

all:    russian english russian-A5 english-A5 \
	russian-lite english-lite russian-A5-lite english-A5-lite

clean:
	rm -f *.aux
	rm -f *.fls
	rm -f *.swp
	rm -f *.pdf
	rm -f *.out
	rm -f *.toc
	rm -f *.stackdump
	rm -f *.bbl
	rm -f *.blg
	rm -f *.fdb_latexmk
	rm -f *.idx
	rm -f *.ilg
	rm -f *.ind
	rm -f *.html
	rm -f *.tmp
	rm -f *-2k
	rm -f *.4ct
	rm -f *.4tc
	rm -f *.dvi
	rm -f *.glg
	rm -f *.glo
	rm -f *.gls
	rm -f *.idv
	rm -f *.ist
	rm -f *.xref
	rm -f *.torrent
	rm -f *.en
	rm -f *.ru
	rm -f RE_for_beginners-*.log
	rm -f Reverse_Engineering_for_Beginners-*.log
	rm -f *~
	rm -f *.log
	rm -f *.lyx
	rm -f *.ni
	rm -f *.odt
	rm -f *.rtf

# there are two xelatex invocations at the end, because \myref{} doesn't show pages correctly otherwise
define compile
	rm -f *.fls
	rm -f *.bbl
	rm -f *.aux
	xelatex $1
	biber $1
	makeindex $1
	makeglossaries $1
	xelatex $1
	xelatex $1
endef

russian: $(RU_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-ru)

english: $(EN_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-en)

russian-A5: $(RU_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-ru-A5)

english-A5: $(EN_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-en-A5)

russian-lite: $(RU_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-ru-lite)

english-lite: $(EN_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-en-lite)

russian-A5-lite: $(RU_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-ru-A5-lite)

english-A5-lite: $(EN_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-en-A5-lite)

ES:	$(ES_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-ES)

PTBR:	$(PTBR_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-PTBR)

ES-lite: $(ES_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-ES-lite)

ES-A5: $(ES_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-ES-A5)

PTBR-lite: $(PTBR_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-PTBR-lite)

polish:	$(PL_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-polish)

polish-lite: $(PL_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-polish-lite)

