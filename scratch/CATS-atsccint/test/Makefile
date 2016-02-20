

MYTARGET=MYTARGET
include $(PATSHOME)/share/atsmake-pre.mk


RMF = rm -rf

ATSCCINT=../atsccint

SOURCES_DATS :=
SOURCES_DATS += test01.dats
SOURCES_DATS += test02.dats

SOURCES_DATS_C := \
  $(patsubst %.dats, %_dats.c, $(SOURCES_DATS))

SOURCES_DATS_S := \
  $(patsubst %.dats, %_dats.s, $(SOURCES_DATS))

.PRECIOUS: $(SOURCES_DATS_C)

all:: $(SOURCES_DATS_S)

%_dats.c: %.dats
	$(PATSOPT) -o $@ -d $<

%_dats.s: %_dats.c
	$(ATSCCINT) -o $@ -p -i $<

clean:
	$(RMF) $(SOURCES_DATS_C)
	$(RMF) $(SOURCES_DATS_S)

