// d0eclist
D0Cifdef(i0de(_ATS_CCOMP_HEADER_NONE_))
(
  // d0eclist
  D0Cinclude(T_STRING("pats_ccomp_config.h"))
  D0Cinclude(T_STRING("pats_ccomp_basics.h"))
  D0Cinclude(T_STRING("pats_ccomp_typedefs.h"))
  D0Cinclude(T_STRING("pats_ccomp_instrset.h"))
  D0Cinclude(T_STRING("pats_ccomp_memalloc.h"))
  D0Cifdef(i0de(_ATS_CCOMP_EXCEPTION_NONE_))
  (
    // d0eclist
    D0Cinclude(T_STRING("pats_ccomp_memalloca.h"))
    D0Cinclude(T_STRING("pats_ccomp_exception.h"))
  )
)
D0Cifdef(i0de(_ATS_CCOMP_PRELUDE_NONE_))
(
  // d0eclist
  D0Cinclude(T_STRING("prelude/CATS/basics.cats"))
  D0Cinclude(T_STRING("prelude/CATS/integer.cats"))
  D0Cinclude(T_STRING("prelude/CATS/pointer.cats"))
  D0Cinclude(T_STRING("prelude/CATS/bool.cats"))
  D0Cinclude(T_STRING("prelude/CATS/char.cats"))
  D0Cinclude(T_STRING("prelude/CATS/float.cats"))
  D0Cinclude(T_STRING("prelude/CATS/integer_ptr.cats"))
  D0Cinclude(T_STRING("prelude/CATS/integer_fixed.cats"))
  D0Cinclude(T_STRING("prelude/CATS/memory.cats"))
  D0Cinclude(T_STRING("prelude/CATS/string.cats"))
  D0Cinclude(T_STRING("prelude/CATS/strptr.cats"))
  D0Cinclude(T_STRING("prelude/CATS/fprintf.cats"))
  D0Cinclude(T_STRING("prelude/CATS/filebas.cats"))
  D0Cinclude(T_STRING("prelude/CATS/list.cats"))
  D0Cinclude(T_STRING("prelude/CATS/option.cats"))
  D0Cinclude(T_STRING("prelude/CATS/array.cats"))
  D0Cinclude(T_STRING("prelude/CATS/arrayptr.cats"))
  D0Cinclude(T_STRING("prelude/CATS/arrayref.cats"))
  D0Cinclude(T_STRING("prelude/CATS/matrix.cats"))
  D0Cinclude(T_STRING("prelude/CATS/matrixptr.cats"))
)
D0Cifdef(i0de(_ATS_CCOMP_PRELUDE_USER_))
(
  // d0eclist
  D0Cinclude(T_IDENT_alp(_ATS_CCOMP_PRELUDE_USER_))
)
D0Cifdef(i0de(_ATS_CCOMP_PRELUDE_USER2_))
(
  // d0eclist
  D0Cinclude(T_IDENT_alp(_ATS_CCOMP_PRELUDE_USER2_))
)
D0Cinclude(T_STRING("libc/CATS/stdio.cats"))
D0Cinclude(T_STRING("libc/sys/CATS/types.cats"))
D0Cinclude(T_STRING("libc/sys/CATS/stat.cats"))
D0Cinclude(T_STRING("libc/sys/CATS/types.cats"))
D0Cinclude(T_STRING("libc/CATS/stdio.cats"))
D0Cinclude(T_STRING("libc/sys/CATS/types.cats"))
D0Ctypedef
D0Cdyncst_mac(i0de(atspre_g0int2int_int_int))
D0Cdyncst_mac(i0de(atspre_g0int_eq_int))
D0Cifdef(i0de(_ATS_CCOMP_EXCEPTION_NONE_))
(
  // d0eclist
  D0Cfundecl(
  FKextern i0de(the_atsexncon_initize)(
    // f0marg
    i0de(d2c): S0Eide(atstype_exnconptr)
    , i0de(exnmsg): S0Eide(atstype_string)
    ): S0Eide(atsvoid_t0ype)
  )
)
D0Cfundecl(
FKstatic i0de(foo_0)(
  // f0marg
  ?: S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eide(atstype_boxed)
)
D0Cfundecl(
FKstatic i0de(ATSLIB_056_prelude__eq_g0int_int__1__1)(
  // f0marg
  ?: S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  , ?: S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool))
)
D0Cfundecl(
FKstatic i0de(foo2_5)(
  // f0marg
  ?: S0Eide(atstype_boxed)
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
)
D0Cfundecl(
FKstatic i0de(foo_0)(
  // f0marg
  i0de(arg0): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eide(atstype_boxed) {
    // f0body
    // tmpdeclst
    var i0de(tmpret0): S0Eide(atstype_boxed)
    var i0de(tmp1): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool))
    // instrlst
    ATSfunbodyseq(
      // instrlst
      ATSINSflab(i0de(__patsflab_foo_0))
      ATSINSmove(i0de(tmp1), D0Eappid(i0de(ATSLIB_056_prelude__eq_g0int_int__1__1))(D0Eide(i0de(arg0)), ATSPMVi0nt(T_INT(10, 1))))
      ATSif(D0Eide(i0de(tmp1))) {
        // instrlst
        ATSINSmove_con1todo
      } else {
        // instrlst
        ATSINSmove_niltodo
      }
    )
    ATSreturn(i0de(tmpret0))
  }
)
D0Cfundecl(
FKstatic i0de(ATSLIB_056_prelude__eq_g0int_int__1__1)(
  // f0marg
  i0de(arg0): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  , i0de(arg1): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool)) {
    // f0body
    // tmpdeclst
    var i0de(tmpret2__1): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool))
    var i0de(tmp3__1): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    // instrlst
    ATSfunbodyseq(
      // instrlst
      ATSINSflab(i0de(__patsflab_eq_g0int_int))
      ATSINSmove(i0de(tmp3__1), D0Eappid(i0de(atspre_g0int2int_int_int))(D0Eide(i0de(arg1))))
      ATSINSmove(i0de(tmpret2__1), D0Eappid(i0de(atspre_g0int_eq_int))(D0Eide(i0de(arg0)), D0Eide(i0de(tmp3__1))))
    )
    ATSreturn(i0de(tmpret2__1))
  }
)
D0Cfundecl(
FKstatic i0de(foo2_5)(
  // f0marg
  i0de(arg0): S0Eide(atstype_boxed)
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int)) {
    // f0body
    // tmpdeclst
    var i0de(tmpret6): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    // instrlst
    ATSfunbodyseq(
      // instrlst
      ATSINSflab(i0de(__patsflab_foo2_5))
      ATSINSmove(i0de(tmpret6), ATSPMVi0nt(T_INT(10, 0)))
    )
    ATSreturn(i0de(tmpret6))
  }
)
D0Cfundecl(
FKextern i0de(_057_home_057_alex_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test02_056_dats__dynload)(
  // f0marg
  ): S0Eide(atsvoid_t0ype) {
    // f0body
    // tmpdeclst
    // instrlst
    ATSfunbodyseq(
      // instrlst
      ATSdynload(0)
      ATSdynloadflag_ext(i0de(_057_home_057_alex_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test02_056_dats__dynloadflag))
      ATSif(ATSCKiseqz(D0Eide(i0de(_057_home_057_alex_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test02_056_dats__dynloadflag)))) {
        // instrlst
        ATSdynloadset(i0de(_057_home_057_alex_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test02_056_dats__dynloadflag))
      } else {
        // instrlst
      }
    )
    ATSreturn_void(i0de(tmpret_void))
  }
)