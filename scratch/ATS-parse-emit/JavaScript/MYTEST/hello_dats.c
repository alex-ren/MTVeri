/*
**
** The C code is generated by ATS/Postiats
** The starting compilation time is: 2015-4-3: 16h:27m
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
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/list.sats: 262(line=21, offs=1) -- 291(line=21, offs=30)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/DATS/list.dats: 357(line=27, offs=1) -- 396(line=28, offs=32)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/DATS/list.dats: 423(line=32, offs=1) -- 455(line=32, offs=33)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/DATS/list.dats: 482(line=36, offs=1) -- 512(line=36, offs=31)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/print.sats: 189(line=14, offs=1) -- 218(line=14, offs=30)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/DATS/list.dats: 513(line=37, offs=1) -- 545(line=37, offs=33)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/filebas.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/DATS/list.dats: 572(line=41, offs=1) -- 601(line=41, offs=30)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/list.sats: 262(line=21, offs=1) -- 291(line=21, offs=30)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/DATS/stream.dats: 359(line=27, offs=1) -- 398(line=28, offs=32)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/DATS/stream.dats: 425(line=32, offs=1) -- 457(line=33, offs=25)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/DATS/stream.dats: 461(line=35, offs=1) -- 491(line=35, offs=31)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/print.sats: 189(line=14, offs=1) -- 218(line=14, offs=30)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/DATS/stream.dats: 516(line=39, offs=1) -- 547(line=39, offs=32)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/reference.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/JSmath.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/JSdate.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/JSarray.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/JSglobal.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/Node.js/process.sats: 250(line=22, offs=1) -- 282(line=23, offs=25)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/Node.js/process.sats: 286(line=25, offs=1) -- 309(line=25, offs=24)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/contrib/libatscc/libatscc2js/SATS/Node.js/process.sats: 311(line=26, offs=1) -- 334(line=26, offs=24)
*/
/*
staload-prologues(end)
*/
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/projects/MEDIUM/ATS-parse-emit/JavaScript/MYTEST/hello.dats: 576(line=36, offs=1) -- 939(line=45, offs=3)
*/
ATSextcode_beg()
//
// file inclusion
//
var fs = require('fs');
eval(fs.readFileSync('./libatscc2js/CATS/basics_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/Node.js/basics_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/Node.js/fprint_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/Node.js/process_cats.js').toString());
ATSextcode_end()
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
ATSdyncst_mac(ats2nodejs_process_stdout)
ATSdyncst_mac(ats2nodejs_fprint_string)
ATSdyncst_mac(ats2nodejs_fprint_newline)
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
// ATSstatmpdec_void(statmp0) ;
// ATSstatmpdec_void(statmp1) ;
/*
** for initialization(dynloading)
*/
ATSdynloadflag_init(_057_home_057_grad2_057_aren_057_programs_057_ats2_github_057_ATS_055_Postiats_055_contrib_057_projects_057_MEDIUM_057_ATS_055_parse_055_emit_057_JavaScript_057_MYTEST_057_hello_056_dats__dynloadflag) ;
ATSextern()
atsvoid_t0ype
_057_home_057_grad2_057_aren_057_programs_057_ats2_github_057_ATS_055_Postiats_055_contrib_057_projects_057_MEDIUM_057_ATS_055_parse_055_emit_057_JavaScript_057_MYTEST_057_hello_056_dats__dynload()
{
ATSfunbody_beg()
ATSdynload(/*void*/)
ATSdynloadflag_sta(
_057_home_057_grad2_057_aren_057_programs_057_ats2_github_057_ATS_055_Postiats_055_contrib_057_projects_057_MEDIUM_057_ATS_055_parse_055_emit_057_JavaScript_057_MYTEST_057_hello_056_dats__dynloadflag
) ;
ATSif(
ATSCKiseqz(
_057_home_057_grad2_057_aren_057_programs_057_ats2_github_057_ATS_055_Postiats_055_contrib_057_projects_057_MEDIUM_057_ATS_055_parse_055_emit_057_JavaScript_057_MYTEST_057_hello_056_dats__dynloadflag
)
) ATSthen() {
ATSdynloadset(_057_home_057_grad2_057_aren_057_programs_057_ats2_github_057_ATS_055_Postiats_055_contrib_057_projects_057_MEDIUM_057_ATS_055_parse_055_emit_057_JavaScript_057_MYTEST_057_hello_056_dats__dynloadflag) ;
/*
dynexnlst-initize(beg)
*/
/*
dynexnlst-initize(end)
*/
/* (*nothing*) */
/*
emit_instr: loc0 = /home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/projects/MEDIUM/ATS-parse-emit/JavaScript/MYTEST/hello.dats: 522(line=32, offs=18) -- 553(line=32, offs=49)
*/
ATSINSmove_void(statmp0, ats2nodejs_fprint_string(ats2nodejs_process_stdout, ATSPMVstring("Hello world!"))) ;

/*
emit_instr: loc0 = /home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/projects/MEDIUM/ATS-parse-emit/JavaScript/MYTEST/hello.dats: 522(line=32, offs=18) -- 553(line=32, offs=49)
*/
ATSINSmove_void(statmp1, ats2nodejs_fprint_newline(ats2nodejs_process_stdout)) ;

} /* ATSendif */
ATSfunbody_end()
ATSreturn_void(tmpret_void) ;
} /* end of [*_dynload] */
ATSextern()
atsvoid_t0ype
hello_dynload()
{
ATSfunbody_beg()
ATSINSmove_void(tmpret_void, _057_home_057_grad2_057_aren_057_programs_057_ats2_github_057_ATS_055_Postiats_055_contrib_057_projects_057_MEDIUM_057_ATS_055_parse_055_emit_057_JavaScript_057_MYTEST_057_hello_056_dats__dynload()) ;
ATSfunbody_end()
ATSreturn_void(tmpret_void) ;
} // end-of-dynload-alias
/*
/home/grad2/aren/programs/ats2_github/ATS-Postiats-contrib/projects/MEDIUM/ATS-parse-emit/JavaScript/MYTEST/hello.dats: 978(line=49, offs=1) -- 1000(line=51, offs=3)
*/
ATSextcode_beg()
hello_dynload()
ATSextcode_end()

/* ****** ****** */

/* end-of-compilation-unit */
