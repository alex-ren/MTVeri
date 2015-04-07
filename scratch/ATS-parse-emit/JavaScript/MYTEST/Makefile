
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS="../atscc2js"

RM=rm -rf

hello.js: hello.dats
	$(PATSOPT) -d $< | $(ATSCC2JS) -o $@


fact.js: fact.dats
	$(PATSOPT) -d $< | $(ATSCC2JS) -o $@

.PHONY: clean

clean:
	$(RM) *.js


