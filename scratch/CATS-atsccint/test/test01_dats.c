/*
**
** The C code is generated by ATS/Postiats
** The starting compilation time is: 2015-6-19: 16h:34m
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
ATSdyncst_mac(atspre_g0int2int_int_int)
ATSdyncst_mac(atspre_g0int_lte_int)
ATSdyncst_mac(atspre_g0int_mul_int)
ATSdyncst_mac(atspre_g0int_sub_int)
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
ATSstatic()
atsvoid_t0ype
foo_0() ;

ATSstatic()
atstkind_t0ype(atstype_int)
fact_1(atstkind_t0ype(atstype_int)) ;

#if(0)
#if(0)
ATSextern()
atstkind_t0ype(atstype_bool)
ATSLIB_056_prelude__lte_g0int_int__2(atstkind_t0ype(atstyvar_type(tk)), atstkind_t0ype(atstype_int)) ;
#endif // end of [QUALIFIED]
#endif // end of [TEMPLATE]

ATSstatic()
atstkind_t0ype(atstype_bool)
ATSLIB_056_prelude__lte_g0int_int__2__1(atstkind_t0ype(atstype_int), atstkind_t0ype(atstype_int)) ;

ATSstatic()
atstkind_t0ype(atstype_int)
fact1_8(atstkind_t0ype(atstype_int), atstkind_t0ype(atstype_int)) ;

ATSstatic()
atstkind_t0ype(atstype_bool)
ATSLIB_056_prelude__lte_g0int_int__2__2(atstkind_t0ype(atstype_int), atstkind_t0ype(atstype_int)) ;

/*
/home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 127(line=6, offs=5) -- 144(line=6, offs=22)
*/
/*
local: 
global: foo_0$0(level=0)
local: 
global: 
*/
ATSstatic()
atsvoid_t0ype
foo_0()
{
/* tmpvardeclst(beg) */
// ATStmpdec_void(tmpret0) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 127(line=6, offs=5) -- 144(line=6, offs=22)
*/
ATSINSflab(__patsflab_foo_0):
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 142(line=6, offs=20) -- 144(line=6, offs=22)
*/
ATSINSmove_void(tmpret0, ATSPMVempty()) ;
ATSfunbody_end()
ATSreturn_void(tmpret0) ;
} /* end of [foo_0] */

/*
/home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 150(line=8, offs=5) -- 240(line=13, offs=22)
*/
/*
local: foo_0$0(level=0), fact_1$0(level=0)
global: foo_0$0(level=0), fact_1$0(level=0)
local: 
global: 
*/
ATSstatic()
atstkind_t0ype(atstype_int)
fact_1(atstkind_t0ype(atstype_int) arg0)
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret1, atstkind_t0ype(atstype_int)) ;
ATStmpdec(tmp2, atstkind_t0ype(atstype_bool)) ;
// ATStmpdec_void(tmp7) ;
ATStmpdec(tmp8, atstkind_t0ype(atstype_int)) ;
ATStmpdec(tmp9, atstkind_t0ype(atstype_int)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 150(line=8, offs=5) -- 240(line=13, offs=22)
*/
ATSINSflab(__patsflab_fact_1):
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 174(line=8, offs=29) -- 180(line=8, offs=35)
*/
ATSINSmove(tmp2, ATSLIB_056_prelude__lte_g0int_int__2__1(arg0, ATSPMVi0nt(0))) ;

/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 171(line=8, offs=26) -- 240(line=13, offs=22)
*/
ATSif(
tmp2
) ATSthen() {
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 186(line=8, offs=41) -- 218(line=12, offs=4)
*/
/*
letpush(beg)
*/
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 201(line=9, offs=12) -- 207(line=9, offs=18)
*/
ATSINSmove_void(tmp7, foo_0()) ;

/*
letpush(end)
*/

/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 213(line=11, offs=3) -- 214(line=11, offs=4)
*/
ATSINSmove(tmpret1, ATSPMVi0nt(1)) ;
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 186(line=8, offs=41) -- 218(line=12, offs=4)
*/
/*
INSletpop()
*/
} ATSelse() {
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 234(line=13, offs=16) -- 239(line=13, offs=21)
*/
ATSINSmove(tmp9, atspre_g0int_sub_int(arg0, ATSPMVi0nt(1))) ;

/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 228(line=13, offs=10) -- 240(line=13, offs=22)
*/
ATSINSmove(tmp8, fact_1(tmp9)) ;

/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 224(line=13, offs=6) -- 240(line=13, offs=22)
*/
ATSINSmove(tmpret1, atspre_g0int_mul_int(arg0, tmp8)) ;

} /* ATSendif */
ATSfunbody_end()
ATSreturn(tmpret1) ;
} /* end of [fact_1] */

#if(0)
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats: 29152(line=807, offs=15) -- 29193(line=807, offs=56)
*/
/*
local: 
global: lte_g0int_int$2$0(level=0)
local: 
global: 
*/
ATSextern()
/*
imparg = tk(4526)
tmparg = S2Evar(tk(4526))
tmpsub = None()
*/
atstkind_t0ype(atstype_bool)
ATSLIB_056_prelude__lte_g0int_int__2(atstkind_t0ype(atstyvar_type(tk)) arg0, atstkind_t0ype(atstype_int) arg1)
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret3, atstkind_t0ype(atstype_bool)) ;
ATStmpdec(tmp4, atstkind_t0ype(atstyvar_type(tk))) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats({$PATSPRE}/DATS/integer.dats): 29138(line=807, offs=1) -- 29193(line=807, offs=56)
*/
ATSINSflab(__patsflab_lte_g0int_int):
/*
emit_instr: loc0 = /home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats({$PATSPRE}/DATS/integer.dats): 29179(line=807, offs=42) -- 29191(line=807, offs=54)
*/
ATSINSmove(tmp4, PMVtmpltcst(g0int2int<S2Eextkind(atstype_int), S2Evar(tk(4526))>)(arg1)) ;

/*
emit_instr: loc0 = /home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats({$PATSPRE}/DATS/integer.dats): 29161(line=807, offs=24) -- 29193(line=807, offs=56)
*/
ATSINSmove(tmpret3, PMVtmpltcst(g0int_lte<S2Evar(tk(4526))>)(arg0, tmp4)) ;

ATSfunbody_end()
ATSreturn(tmpret3) ;
} /* end of [ATSLIB_056_prelude__lte_g0int_int__2] */
#endif // end of [TEMPLATE]

/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats: 29152(line=807, offs=15) -- 29193(line=807, offs=56)
*/
/*
local: 
global: lte_g0int_int$2$1(level=1)
local: 
global: 
*/
ATSstatic()
/*
imparg = tk(4526)
tmparg = S2Evar(tk(4526))
tmpsub = Some(tk(4526) -> S2Eextkind(atstype_int))
*/
atstkind_t0ype(atstype_bool)
ATSLIB_056_prelude__lte_g0int_int__2__1(atstkind_t0ype(atstype_int) arg0, atstkind_t0ype(atstype_int) arg1)
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret3__1, atstkind_t0ype(atstype_bool)) ;
ATStmpdec(tmp4__1, atstkind_t0ype(atstype_int)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats({$PATSPRE}/DATS/integer.dats): 29138(line=807, offs=1) -- 29193(line=807, offs=56)
*/
ATSINSflab(__patsflab_lte_g0int_int):
/*
emit_instr: loc0 = /home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats({$PATSPRE}/DATS/integer.dats): 29179(line=807, offs=42) -- 29191(line=807, offs=54)
*/
ATSINSmove(tmp4__1, atspre_g0int2int_int_int(arg1)) ;

/*
emit_instr: loc0 = /home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats({$PATSPRE}/DATS/integer.dats): 29161(line=807, offs=24) -- 29193(line=807, offs=56)
*/
ATSINSmove(tmpret3__1, atspre_g0int_lte_int(arg0, tmp4__1)) ;

ATSfunbody_end()
ATSreturn(tmpret3__1) ;
} /* end of [ATSLIB_056_prelude__lte_g0int_int__2__1] */

/*
/home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 246(line=15, offs=5) -- 330(line=17, offs=31)
*/
/*
local: fact1_8$0(level=0)
global: fact1_8$0(level=0)
local: 
global: 
*/
ATSstatic()
atstkind_t0ype(atstype_int)
fact1_8(atstkind_t0ype(atstype_int) arg0, atstkind_t0ype(atstype_int) arg1)
{
/* tmpvardeclst(beg) */
ATStmpdec(apy0, atstkind_t0ype(atstype_int)) ;
ATStmpdec(apy1, atstkind_t0ype(atstype_int)) ;
ATStmpdec(tmpret10, atstkind_t0ype(atstype_int)) ;
ATStmpdec(tmp11, atstkind_t0ype(atstype_bool)) ;
ATStmpdec(tmp14, atstkind_t0ype(atstype_int)) ;
ATStmpdec(tmp15, atstkind_t0ype(atstype_int)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 246(line=15, offs=5) -- 330(line=17, offs=31)
*/
ATSINSflab(__patsflab_fact1_8):
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 283(line=16, offs=6) -- 289(line=16, offs=12)
*/
ATSINSmove(tmp11, ATSLIB_056_prelude__lte_g0int_int__2__2(arg0, ATSPMVi0nt(0))) ;

/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 280(line=16, offs=3) -- 330(line=17, offs=31)
*/
ATSif(
tmp11
) ATSthen() {
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 295(line=16, offs=18) -- 299(line=16, offs=22)
*/
ATSINSmove(tmpret10, arg1) ;
} ATSelse() {
/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 314(line=17, offs=15) -- 319(line=17, offs=20)
*/
ATSINSmove(tmp14, atspre_g0int_sub_int(arg0, ATSPMVi0nt(1))) ;

/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 321(line=17, offs=22) -- 329(line=17, offs=30)
*/
ATSINSmove(tmp15, atspre_g0int_mul_int(arg1, arg0)) ;

/*
emit_instr: loc0 = /home/grad2/aren/workspace/MTVeri/scratch/CATS-atsccint/test/test01.dats: 307(line=17, offs=8) -- 330(line=17, offs=31)
*/
ATStailcal_beg()
ATSINSmove_tlcal(apy0, tmp14) ;
ATSINSmove_tlcal(apy1, tmp15) ;
ATSINSargmove_tlcal(arg0, apy0) ;
ATSINSargmove_tlcal(arg1, apy1) ;
ATSINSfgoto(__patsflab_fact1_8) ;
ATStailcal_end()

} /* ATSendif */
ATSfunbody_end()
ATSreturn(tmpret10) ;
} /* end of [fact1_8] */

/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats: 29152(line=807, offs=15) -- 29193(line=807, offs=56)
*/
/*
local: 
global: lte_g0int_int$2$2(level=1)
local: 
global: 
*/
ATSstatic()
/*
imparg = tk(4526)
tmparg = S2Evar(tk(4526))
tmpsub = Some(tk(4526) -> S2Eextkind(atstype_int))
*/
atstkind_t0ype(atstype_bool)
ATSLIB_056_prelude__lte_g0int_int__2__2(atstkind_t0ype(atstype_int) arg0, atstkind_t0ype(atstype_int) arg1)
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret3__2, atstkind_t0ype(atstype_bool)) ;
ATStmpdec(tmp4__2, atstkind_t0ype(atstype_int)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats({$PATSPRE}/DATS/integer.dats): 29138(line=807, offs=1) -- 29193(line=807, offs=56)
*/
ATSINSflab(__patsflab_lte_g0int_int):
/*
emit_instr: loc0 = /home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats({$PATSPRE}/DATS/integer.dats): 29179(line=807, offs=42) -- 29191(line=807, offs=54)
*/
ATSINSmove(tmp4__2, atspre_g0int2int_int_int(arg1)) ;

/*
emit_instr: loc0 = /home/grad2/aren/programs/ats2_github/ATS-Postiats/prelude/DATS/integer.dats({$PATSPRE}/DATS/integer.dats): 29161(line=807, offs=24) -- 29193(line=807, offs=56)
*/
ATSINSmove(tmpret3__2, atspre_g0int_lte_int(arg0, tmp4__2)) ;

ATSfunbody_end()
ATSreturn(tmpret3__2) ;
} /* end of [ATSLIB_056_prelude__lte_g0int_int__2__2] */

/*
** for initialization(dynloading)
*/
ATSextern()
atsvoid_t0ype
_057_home_057_grad2_057_aren_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test01_056_dats__dynload()
{
ATSfunbody_beg()
ATSdynload(/*void*/)
ATSdynloadflag_ext(
_057_home_057_grad2_057_aren_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test01_056_dats__dynloadflag
) ;
ATSif(
ATSCKiseqz(
_057_home_057_grad2_057_aren_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test01_056_dats__dynloadflag
)
) ATSthen() {
ATSdynloadset(_057_home_057_grad2_057_aren_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test01_056_dats__dynloadflag) ;
/*
dynexnlst-initize(beg)
*/
/*
dynexnlst-initize(end)
*/
} /* ATSendif */
ATSfunbody_end()
ATSreturn_void(tmpret_void) ;
} /* end of [*_dynload] */

/* ****** ****** */

/* end-of-compilation-unit */
