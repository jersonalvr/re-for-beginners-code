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
SIZE ?= A4

# Parse comma-separated width and height if present
COMMA := ,
ifneq ($(filter %$(COMMA)%,$(SIZE)),)
    WIDTH := $(word 1,$(subst $(COMMA), ,$(SIZE)))
    HEIGHT := $(word 2,$(subst $(COMMA), ,$(SIZE)))
    SIZE_DEFS := \def\ebook{} \def\customwidth{$(WIDTH)} \def\customheight{$(HEIGHT)}
    SIZE_SUFFIX := -$(WIDTH)x$(HEIGHT)
else ifeq ($(SIZE),7inch)
    SIZE_DEFS := \def\ebook{} \def\customwidth{10cm} \def\customheight{14cm}
    SIZE_SUFFIX := -7inch
else ifeq ($(SIZE),A5)
    SIZE_DEFS := \def\ebook{}
    SIZE_SUFFIX := -A5
else ifeq ($(SIZE),A4)
    SIZE_DEFS :=
    SIZE_SUFFIX :=
else
    SIZE_DEFS :=
    SIZE_SUFFIX := -$(SIZE)
endif

# there are two xelatex invocations at the end, because \myref{} doesn't show pages correctly otherwise
define compile_with_size
	rm -f *.fls
	rm -f *.bbl
	rm -f *.aux
	xelatex -jobname=$(1)$(SIZE_SUFFIX) "$(2) $(SIZE_DEFS) \input{main.tex}"
	biber $(1)$(SIZE_SUFFIX)
	makeindex $(1)$(SIZE_SUFFIX)
	makeglossaries $(1)$(SIZE_SUFFIX)
	xelatex -jobname=$(1)$(SIZE_SUFFIX) "$(2) $(SIZE_DEFS) \input{main.tex}"
	xelatex -jobname=$(1)$(SIZE_SUFFIX) "$(2) $(SIZE_DEFS) \input{main.tex}"
endef

russian: $(RU_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-ru,\def\RUSSIAN{})

english: $(EN_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-en,\def\ENGLISH{})

russian-A5: $(RU_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-ru-A5,\def\RUSSIAN{} \def\ebook{})

english-A5: $(EN_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-en-A5,\def\ENGLISH{} \def\ebook{})

russian-lite: $(RU_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-ru-lite,\def\RUSSIAN{} \def\LITE{})

english-lite: $(EN_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-en-lite,\def\ENGLISH{} \def\LITE{})

russian-A5-lite: $(RU_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-ru-A5-lite,\def\RUSSIAN{} \def\ebook{} \def\LITE{})

english-A5-lite: $(EN_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-en-A5-lite,\def\ENGLISH{} \def\ebook{} \def\LITE{})

ES:	$(ES_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-ES,\def\SPANISH{})

PTBR:	$(PTBR_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-PTBR,\def\BRAZILIAN{})

ES-lite: $(ES_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-ES-lite,\def\SPANISH{} \def\LITE{})

ES-A5: $(ES_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-ES-A5,\def\SPANISH{} \def\ebook{})

PTBR-lite: $(PTBR_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-PTBR-lite,\def\BRAZILIAN{} \def\LITE{})

polish:	$(PL_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-polish,\def\POLISH{})

polish-lite: $(PL_LISTINGS)
	$(call compile_with_size,Reverse_Engineering_for_Beginners-polish-lite,\def\POLISH{} \def\LITE{})

