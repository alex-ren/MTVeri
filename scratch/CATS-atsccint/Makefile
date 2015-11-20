
######

include $(PATSHOME)/share/atsmake-pre.mk

######

MYTARGET:=atsccint
# MYCCRULE:=MYCCRULE

######

######

CATSPARSEMIT=./.CATS-parsemit

######

# CFLAGS +=  $(shell pkg-config --cflags json-c)

######

# LDFLAGS +=  $(shell pkg-config --libs json-c)
LDFLAGS += -lgc

######

MALLOCFLAG=-DATS_MEMALLOC_GCBDW

######

SOURCES_DATS :=
# SOURCES_DATS += atsccint_basics.dats
# SOURCES_DATS += atsccint_transform.dats
# SOURCES_DATS += atsccint_interpreter.dats
SOURCES_DATS += atsccint_main.dats
# SOURCES_DATS += atsccint_emit.dats
# SOURCES_DATS += atsccint_emit2.dats
SOURCES_DATS += atsccint_emit_syntax.dats
SOURCES_DATS += aux_lib.dats

SOURCES_SATS :=
SOURCES_SATS += $(CATSPARSEMIT)/catsparse.sats
SOURCES_SATS += atsccint_basics.sats
SOURCES_SATS += atsccint_types.sats
SOURCES_SATS += atsccint_program.sats
SOURCES_SATS += atsccint_transform.sats
SOURCES_SATS += atsccint_interpreter.sats
SOURCES_SATS += atsccint_emit_syntax.sats
SOURCES_SATS += aux_lib.sats

######

SOURCES_C :=
SOURCES_C += $(CATSPARSEMIT)/catsparse_mylib_dats.c
SOURCES_C += $(CATSPARSEMIT)/catsparse_include_all_dats.c
 

%_dats_c.o: %_dats.c ; $(CC) $(INCLUDE) $(MALLOCFLAG) $(CFLAGS) -o $@ -c $<

######

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

syntax_codegen2.hats: \
$(CATSPARSEMIT_source)/SATS/catsparse.sats atsccint_emit_syntax.dats; \
$(PATSOPT) -DATS CODEGEN2 --codegen-2 -o $@ -d atsccint_emit_syntax.dats

all:: syntax_codegen2.hats

######
#
build:: pkgreloc
build:: atsccint
#
testall:: build
testall:: cleanall
#
######

######

cleanall:: clean
cleanall:: ; $(RMF) ./atsccint
cleanall:: ; $(RMF) ./syntax_codegen2.hats
cleanall:: ; $(RMF) ./.CATS-parsemit/*
cleanall:: ; $(RMF) *_?ats.c

.PHONY: tags
tags:
	$(RMF) tags MYTAGS
	cp ../CATS-parsemit/MYTAGS ./MYTAGS
	find $(PWD) ! -path "*.CATS-parsemit*" -name "*.sats" -exec $(PATSOPT) --output-a MYTAGS --taggen -s {} \;
	find $(PWD) -name "*.dats" -exec $(PATSOPT) --output-a MYTAGS --taggen -d {} \; 
	java -jar ../../tool/ats-lang-tools.jar --input MYTAGS -c --output tags
	# $(CPF) $(PATSHOME)/prelude/CATS/tags ./tags_cats
	# $(CPF) $(PATSHOME)/ccomp/runtime/tags ./tags_c
###### end of [Makefile] ######


CPF=cp -f
include $(PATSHOME)/share/atsmake-post.mk

