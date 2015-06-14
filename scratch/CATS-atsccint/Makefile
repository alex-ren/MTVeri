#
# A simple Makefile
#

######

MAKE=make

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all::

######

CATSPARSEMIT=./.CATS-parsemit

######

SOURCES_DATS :=
SOURCES_DATS += atsccint_basics.dats
SOURCES_DATS += atsccint_transform.dats
SOURCES_DATS += atsccint_interpreter.dats
SOURCES_DATS += atsccint_main.dats
# SOURCES_DATS += atsccint_emit.dats
# SOURCES_DATS += atsccint_emit2.dats

SOURCES_SATS :=
SOURCES_SATS += $(CATSPARSEMIT)/catsparse.sats
SOURCES_SATS += atsccint_basics.sats
SOURCES_SATS += atsccint_types.sats
SOURCES_SATS += atsccint_program.sats
SOURCES_SATS += atsccint_transform.sats
SOURCES_SATS += atsccint_interpreter.sats

SOURCES_CATS :=
SOURCES_CATS += $(CATSPARSEMIT)/catsparse_mylib_dats.c
SOURCES_CATS += $(CATSPARSEMIT)/catsparse_include_all_dats.c

######
#
all:: \
atsccint
atsccint: \
$(SOURCES_DATS); \
$(PATSCC) \
  -DATS_MEMALLOC_GCBDW -O2 -o $@ \
  $(SOURCES_DATS) $(SOURCES_SATS) $(SOURCES_CATS) -lgc
#
######

CPF=cp -f
RMF=rm -f

######
#
CATSPARSEMIT_source=\
$(PATSHOMERELOC)/projects/MEDIUM/CATS-parsemit
#
pkgreloc:: ; \
$(CPF) $(CATSPARSEMIT_source)/SATS/catsparse.sats $(CATSPARSEMIT)/.
pkgreloc:: ; \
$(CPF) $(CATSPARSEMIT_source)/SATS/catsparse_*.sats $(CATSPARSEMIT)/.
pkgreloc:: ; \
$(CPF) $(CATSPARSEMIT_source)/CATS/catsparse_*_dats.c $(CATSPARSEMIT)/.
#
######
#
build:: pkgreloc
build:: atsccint
#
testall:: build
testall:: cleanall
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean
cleanall:: ; $(RMF) ./atsccint
cleanall:: ; $(RMF) ./.CATS-parsemit/*

.PHONY: tags
tags:
	$(RMF) tags MYTAGS
	cp $(PATSHOMERELOC)/projects/MEDIUM/CATS-parsemit/MYTAGS ./MYTAGS
	find $(PWD) ! -path "*.CATS-parsemit*" -name "*.sats" -exec $(PATSOPT) --output-a MYTAGS --taggen -s {} \;
	find $(PWD) -name "*.dats" -exec $(PATSOPT) --output-a MYTAGS --taggen -d {} \; 
	java -jar ../../tool/ats-lang-tools.jar --input MYTAGS -c --output tags
	cp $(PATSHOME)/prelude/CATS/tags ./tags_cats
	cp $(PATSHOME)/ccomp/runtime/tags ./tags_c
###### end of [Makefile] ######


