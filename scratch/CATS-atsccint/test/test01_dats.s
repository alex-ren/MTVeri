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
D0Cdyncst_mac(i0de(atspre_g0int2int_int_int))
D0Cdyncst_mac(i0de(atspre_g0int_lte_int))
D0Cdyncst_mac(i0de(atspre_g0int_mul_int))
D0Cdyncst_mac(i0de(atspre_g0int_sub_int))
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
  ): S0Eide(atsvoid_t0ype)
)
D0Cfundecl(
FKstatic i0de(fact_1)(
  // f0marg
  ?: S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
)
D0Cfundecl(
FKstatic i0de(ATSLIB_056_prelude__lte_g0int_int__2__1)(
  // f0marg
  ?: S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  , ?: S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool))
)
D0Cfundecl(
FKstatic i0de(fact1_8)(
  // f0marg
  ?: S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  , ?: S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
)
D0Cfundecl(
FKstatic i0de(ATSLIB_056_prelude__lte_g0int_int__2__2)(
  // f0marg
  ?: S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  , ?: S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool))
)
D0Cfundecl(
FKstatic i0de(foo_0)(
  // f0marg
  ): S0Eide(atsvoid_t0ype) {
    // f0body
    // tmpdeclst
    // instrlst
    ATSfunbodyseq(
      // instrlst
      ATSINSflab(i0de(__patsflab_foo_0))
      ATSINSmove_void(i0de(tmpret0), ATSPMVempty(0))
    )
    ATSreturn_void(i0de(tmpret0))
  }
)
D0Cfundecl(
FKstatic i0de(fact_1)(
  // f0marg
  i0de(arg0): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int)) {
    // f0body
    // tmpdeclst
    var i0de(tmpret1): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    var i0de(tmp2): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool))
    var i0de(tmp8): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    var i0de(tmp9): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    // instrlst
    ATSfunbodyseq(
      // instrlst
      ATSINSflab(i0de(__patsflab_fact_1))
      ATSINSmove(i0de(tmp2), D0Eappid(i0de(ATSLIB_056_prelude__lte_g0int_int__2__1))(D0Eide(i0de(arg0)), ATSPMVi0nt(T_INT(10, 0))))
      ATSif(D0Eide(i0de(tmp2))) {
        // instrlst
        ATSINSmove_void(i0de(tmp7), D0Eappid(i0de(foo_0))())
        ATSINSmove(i0de(tmpret1), ATSPMVi0nt(T_INT(10, 1)))
      } else {
        // instrlst
        ATSINSmove(i0de(tmp9), D0Eappid(i0de(atspre_g0int_sub_int))(D0Eide(i0de(arg0)), ATSPMVi0nt(T_INT(10, 1))))
        ATSINSmove(i0de(tmp8), D0Eappid(i0de(fact_1))(D0Eide(i0de(tmp9))))
        ATSINSmove(i0de(tmpret1), D0Eappid(i0de(atspre_g0int_mul_int))(D0Eide(i0de(arg0)), D0Eide(i0de(tmp8))))
      }
    )
    ATSreturn(i0de(tmpret1))
  }
)
D0Cfundecl(
FKstatic i0de(ATSLIB_056_prelude__lte_g0int_int__2__1)(
  // f0marg
  i0de(arg0): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  , i0de(arg1): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool)) {
    // f0body
    // tmpdeclst
    var i0de(tmpret3__1): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool))
    var i0de(tmp4__1): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    // instrlst
    ATSfunbodyseq(
      // instrlst
      ATSINSflab(i0de(__patsflab_lte_g0int_int))
      ATSINSmove(i0de(tmp4__1), D0Eappid(i0de(atspre_g0int2int_int_int))(D0Eide(i0de(arg1))))
      ATSINSmove(i0de(tmpret3__1), D0Eappid(i0de(atspre_g0int_lte_int))(D0Eide(i0de(arg0)), D0Eide(i0de(tmp4__1))))
    )
    ATSreturn(i0de(tmpret3__1))
  }
)
D0Cfundecl(
FKstatic i0de(fact1_8)(
  // f0marg
  i0de(arg0): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  , i0de(arg1): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int)) {
    // f0body
    // tmpdeclst
    var i0de(apy0): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    var i0de(apy1): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    var i0de(tmpret10): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    var i0de(tmp11): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool))
    var i0de(tmp14): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    var i0de(tmp15): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    // instrlst
    ATSfunbodyseq(
      // instrlst
      ATSINSflab(i0de(__patsflab_fact1_8))
      ATSINSmove(i0de(tmp11), D0Eappid(i0de(ATSLIB_056_prelude__lte_g0int_int__2__2))(D0Eide(i0de(arg0)), ATSPMVi0nt(T_INT(10, 0))))
      ATSif(D0Eide(i0de(tmp11))) {
        // instrlst
        ATSINSmove(i0de(tmpret10), D0Eide(i0de(arg1)))
      } else {
        // instrlst
        ATSINSmove(i0de(tmp14), D0Eappid(i0de(atspre_g0int_sub_int))(D0Eide(i0de(arg0)), ATSPMVi0nt(T_INT(10, 1))))
        ATSINSmove(i0de(tmp15), D0Eappid(i0de(atspre_g0int_mul_int))(D0Eide(i0de(arg1)), D0Eide(i0de(arg0))))
        ATStailcalseq(
          // instrlst
          ATSINSmove_tlcal(i0de(apy0), D0Eide(i0de(tmp14)))
          ATSINSmove_tlcal(i0de(apy1), D0Eide(i0de(tmp15)))
          ATSINSargmove_tlcal(i0de(arg0), i0de(apy0))
          ATSINSargmove_tlcal(i0de(arg1), i0de(apy1))
          ATSINSfgoto(i0de(__patsflab_fact1_8))
        )
      }
    )
    ATSreturn(i0de(tmpret10))
  }
)
D0Cfundecl(
FKstatic i0de(ATSLIB_056_prelude__lte_g0int_int__2__2)(
  // f0marg
  i0de(arg0): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  , i0de(arg1): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
  ): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool)) {
    // f0body
    // tmpdeclst
    var i0de(tmpret3__2): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_bool))
    var i0de(tmp4__2): S0Eappid(i0de(atstkind_t0ype))(S0Eide(atstype_int))
    // instrlst
    ATSfunbodyseq(
      // instrlst
      ATSINSflab(i0de(__patsflab_lte_g0int_int))
      ATSINSmove(i0de(tmp4__2), D0Eappid(i0de(atspre_g0int2int_int_int))(D0Eide(i0de(arg1))))
      ATSINSmove(i0de(tmpret3__2), D0Eappid(i0de(atspre_g0int_lte_int))(D0Eide(i0de(arg0)), D0Eide(i0de(tmp4__2))))
    )
    ATSreturn(i0de(tmpret3__2))
  }
)
D0Cfundecl(
FKextern i0de(_057_home_057_alex_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test01_056_dats__dynload)(
  // f0marg
  ): S0Eide(atsvoid_t0ype) {
    // f0body
    // tmpdeclst
    // instrlst
    ATSfunbodyseq(
      // instrlst
      ATSdynload(0)
      ATSdynloadflag_ext(i0de(_057_home_057_alex_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test01_056_dats__dynloadflag))
      ATSif(ATSCKiseqz(D0Eide(i0de(_057_home_057_alex_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test01_056_dats__dynloadflag)))) {
        // instrlst
        ATSdynloadset(i0de(_057_home_057_alex_057_workspace_057_MTVeri_057_scratch_057_CATS_055_atsccint_057_test_057_test01_056_dats__dynloadflag))
      } else {
        // instrlst
      }
    )
    ATSreturn_void(i0de(tmpret_void))
  }
)