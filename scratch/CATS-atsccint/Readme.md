
catsparse_include_all_dats.c uses two functions CATSPARSE_EMIT__emit_COMMENT_line and
CATSPARSE_EMIT__emit_COMMENT_block, which are declared in catsparse_emit.sats.
We have to implement these two functions so that the whole program can be built.

* aux_lib.sats

Auxiliary functions for general operations such as string operation.
  
* atsccint_basic.sats

Test
==========

*.dats* is for ATS file. *\_dats.c* is generated from ATS file by ATs compiler.
*\_dats.s* is generated from *\_dats.c* by *atsccint* with the command as follows:

    atsccint -o testxx.s -p -i testxx.dats


To generate all the *_dats.s* files, please enter the directory *test*, and 
run `make`.




