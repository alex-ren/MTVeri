/*
**
** The C code is generated by ATS/Postiats
** The starting compilation time is: 2015-6-10: 18h: 5m
**
*/

/*
** include runtime header files
*/
#ifndef _ATS_CCOMP_HEADER_NONE
#include "pats_ccomp_config.h"
#include "pats_ccomp_basics.h"
#include "pats_ccomp_typedefs.h"
#include "pats_ccomp_instrset.h"
#include "pats_ccomp_memalloc.h"
#ifndef _ATS_CCOMP_EXCEPTION_NONE
#include "pats_ccomp_memalloca.h"
#include "pats_ccomp_exception.h"
#endif // end of [_ATS_CCOMP_EXCEPTION_NONE]
#endif /* _ATS_CCOMP_HEADER_NONE */


/*
** include prelude cats files
*/
#ifndef _ATS_CCOMP_PRELUDE_NONE
//
#include "prelude/CATS/basics.cats"
#include "prelude/CATS/integer.cats"
#include "prelude/CATS/pointer.cats"
#include "prelude/CATS/bool.cats"
#include "prelude/CATS/char.cats"
#include "prelude/CATS/integer_ptr.cats"
#include "prelude/CATS/integer_fixed.cats"
#include "prelude/CATS/float.cats"
#include "prelude/CATS/memory.cats"
#include "prelude/CATS/string.cats"
#include "prelude/CATS/strptr.cats"
//
#include "prelude/CATS/filebas.cats"
//
#include "prelude/CATS/list.cats"
#include "prelude/CATS/option.cats"
#include "prelude/CATS/array.cats"
#include "prelude/CATS/arrayptr.cats"
#include "prelude/CATS/arrayref.cats"
#include "prelude/CATS/matrix.cats"
#include "prelude/CATS/matrixptr.cats"
//
#endif /* _ATS_CCOMP_PRELUDE_NONE */
/*
** for user-supplied prelude
*/
#ifdef _ATS_CCOMP_PRELUDE_USER
//
#include _ATS_CCOMP_PRELUDE_USER
//
#endif /* _ATS_CCOMP_PRELUDE_USER */
/*
** for user2-supplied prelude
*/
#ifdef _ATS_CCOMP_PRELUDE_USER2
//
#include _ATS_CCOMP_PRELUDE_USER2
//
#endif /* _ATS_CCOMP_PRELUDE_USER2 */

/*
staload-prologues(beg)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/pointer.dats: 1533(line=44, offs=1) -- 1572(line=44, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats: 1636(line=51, offs=1) -- 1675(line=51, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer_ptr.dats: 1639(line=51, offs=1) -- 1678(line=51, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer_fixed.dats: 1641(line=51, offs=1) -- 1680(line=51, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/char.dats: 1610(line=48, offs=1) -- 1649(line=48, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/memory.dats: 1410(line=38, offs=1) -- 1449(line=39, offs=32)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/string.dats: 1609(line=48, offs=1) -- 1648(line=48, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/strptr.dats: 1609(line=48, offs=1) -- 1648(line=48, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/strptr.dats: 1671(line=52, offs=1) -- 1718(line=52, offs=48)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats: 1636(line=51, offs=1) -- 1675(line=51, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/filebas.dats: 1613(line=48, offs=1) -- 1652(line=48, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/filebas.dats: 1675(line=52, offs=1) -- 1722(line=52, offs=48)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats: 1636(line=51, offs=1) -- 1675(line=51, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/filebas.dats: 1745(line=56, offs=1) -- 1783(line=56, offs=39)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/libc/SATS/stdio.sats: 1380(line=35, offs=1) -- 1418(line=37, offs=3)
*/

#include "libc/CATS/stdio.cats"
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/libc/SATS/stdio.sats: 1898(line=62, offs=1) -- 1940(line=64, offs=27)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/libc/sys/SATS/types.sats: 1390(line=36, offs=1) -- 1432(line=38, offs=3)
*/

#include "libc/sys/CATS/types.cats"
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/filebas.dats: 1861(line=61, offs=1) -- 1901(line=61, offs=41)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/libc/sys/SATS/stat.sats: 1390(line=36, offs=1) -- 1431(line=38, offs=3)
*/

#include "libc/sys/CATS/stat.cats"
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/libc/sys/SATS/stat.sats: 1712(line=52, offs=1) -- 1754(line=53, offs=35)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/libc/sys/SATS/types.sats: 1390(line=36, offs=1) -- 1432(line=38, offs=3)
*/

#include "libc/sys/CATS/types.cats"
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/filebas.dats: 15323(line=844, offs=1) -- 15353(line=844, offs=31)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/libc/SATS/stdio.sats: 1380(line=35, offs=1) -- 1418(line=37, offs=3)
*/

#include "libc/CATS/stdio.cats"
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/libc/SATS/stdio.sats: 1898(line=62, offs=1) -- 1940(line=64, offs=27)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/libc/sys/SATS/types.sats: 1390(line=36, offs=1) -- 1432(line=38, offs=3)
*/

#include "libc/sys/CATS/types.cats"
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/list.dats: 1527(line=44, offs=1) -- 1566(line=44, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/list.dats: 1567(line=45, offs=1) -- 1613(line=45, offs=47)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/unsafe.dats: 1532(line=44, offs=1) -- 1566(line=44, offs=35)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/list_vt.dats: 1536(line=44, offs=1) -- 1575(line=44, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/array.dats: 1534(line=44, offs=1) -- 1573(line=44, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/array.dats: 1574(line=45, offs=1) -- 1616(line=45, offs=43)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/arrayptr.dats: 1532(line=44, offs=1) -- 1571(line=44, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/arrayref.dats: 1532(line=44, offs=1) -- 1571(line=44, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/matrix.dats: 1535(line=44, offs=1) -- 1574(line=44, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/matrixptr.dats: 1538(line=44, offs=1) -- 1577(line=44, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/matrixref.dats: 1538(line=44, offs=1) -- 1577(line=44, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/stream.dats: 1523(line=44, offs=1) -- 1562(line=44, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/stream_vt.dats: 1523(line=44, offs=1) -- 1562(line=44, offs=40)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/tostring.dats: 1528(line=44, offs=1) -- 1567(line=45, offs=32)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/unsafe.dats: 1532(line=44, offs=1) -- 1566(line=44, offs=35)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/checkast.dats: 1531(line=44, offs=1) -- 1570(line=45, offs=32)
*/
/*
staload-prologues(end)
*/
/*
typedefs-for-tyrecs-and-tysums(beg)
*/
/*
typedefs-for-tyrecs-and-tysums(end)
*/
/*
dynconlst-declaration(beg)
*/
/*
dynconlst-declaration(end)
*/
/*
dyncstlst-declaration(beg)
*/
ATSdyncst_mac(atspre_g0int_add_int)
/*
dyncstlst-declaration(end)
*/
/*
dynvalist-implementation(beg)
*/
/*
dynvalist-implementation(end)
*/
/*
exnconlst-declaration(beg)
*/
#ifndef _ATS_CCOMP_EXCEPTION_NONE
ATSextern()
atsvoid_t0ype
the_atsexncon_initize
(
  atstype_exnconptr d2c, atstype_string exnmsg
) ;
#endif // end of [_ATS_CCOMP_EXCEPTION_NONE]
/*
exnconlst-declaration(end)
*/
/*
assumelst-declaration(beg)
*/
/*
assumelst-declaration(end)
*/
/*
extypelst-declaration(beg)
*/
/*
extypelst-declaration(end)
*/
ATSstatmpdec(statmp2, atstkind_t0ype(atstype_int)) ;
ATSstatmpdec(statmp3, atstype_funptr) ;
ATSstatic()
atstype_funptr
foo_0() ;

ATSstatic()
atstkind_t0ype(atstype_int)
add_1(atstkind_t0ype(atstype_int)) ;

/*
/home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test03.dats: 103(line=8, offs=5) -- 172(line=12, offs=4)
*/
/*
local: 
global: foo_0$0(level=0)
local: 
global: 
*/
ATSstatic()
atstype_funptr
foo_0()
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret0, atstype_funptr) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test03.dats: 103(line=8, offs=5) -- 172(line=12, offs=4)
*/
ATSINSflab(__patsflab_foo_0):
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test03.dats: 124(line=8, offs=26) -- 172(line=12, offs=4)
*/
/*
letpush(beg)
*/
/*
letpush(end)
*/

/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test03.dats: 165(line=11, offs=3) -- 168(line=11, offs=6)
*/
ATSINSmove(tmpret0, ATSPMVfunlab(add_1)) ;
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test03.dats: 124(line=8, offs=26) -- 172(line=12, offs=4)
*/
/*
INSletpop()
*/
ATSfunbody_end()
ATSreturn(tmpret0) ;
} /* end of [foo_0] */

/*
/home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test03.dats: 134(line=9, offs=7) -- 159(line=9, offs=32)
*/
/*
local: 
global: add_1$0(level=1)
local: 
global: 
*/
ATSstatic()
atstkind_t0ype(atstype_int)
add_1(atstkind_t0ype(atstype_int) arg0)
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret1, atstkind_t0ype(atstype_int)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test03.dats: 134(line=9, offs=7) -- 159(line=9, offs=32)
*/
ATSINSflab(__patsflab_add_1):
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test03.dats: 154(line=9, offs=27) -- 159(line=9, offs=32)
*/
ATSINSmove(tmpret1, atspre_g0int_add_int(arg0, ATSPMVi0nt(1))) ;

ATSfunbody_end()
ATSreturn(tmpret1) ;
} /* end of [add_1] */

/*
** for initialization(dynloading)
*/
ATSextern()
atsvoid_t0ype
_057_home_057_grad2_057_aren_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test03_056_dats__dynload()
{
ATSfunbody_beg()
ATSdynload(/*void*/)
ATSdynloadflag_ext(
_057_home_057_grad2_057_aren_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test03_056_dats__dynloadflag
) ;
ATSif(
ATSCKiseqz(
_057_home_057_grad2_057_aren_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test03_056_dats__dynloadflag
)
) ATSthen() {
ATSdynloadset(_057_home_057_grad2_057_aren_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test03_056_dats__dynloadflag) ;
/*
dynexnlst-initize(beg)
*/
/*
dynexnlst-initize(end)
*/
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test03.dats: 184(line=14, offs=11) -- 190(line=14, offs=17)
*/
ATSINSmove(statmp3, foo_0()) ;

/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test03.dats: 184(line=14, offs=11) -- 194(line=14, offs=21)
*/
ATSINSmove(statmp2, ATSfunclo_fun(statmp3, (atstkind_t0ype(atstype_int)), atstkind_t0ype(atstype_int))(ATSPMVi0nt(1))) ;

} /* ATSendif */
ATSfunbody_end()
ATSreturn_void(tmpret_void) ;
} /* end of [*_dynload] */

/* ****** ****** */

/* end-of-compilation-unit */