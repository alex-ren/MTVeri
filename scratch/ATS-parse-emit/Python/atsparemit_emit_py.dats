(* ****** ****** *)
//
// ATS-parse-emit-python
//
(* ****** ****** *)
//
// HX-2014-08-04: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"
//
(* ****** ****** *)
//
staload "./atsparemit_emit.sats"
//
(* ****** ****** *)
//
staload "./atsparemit_typedef.dats"
//
(* ****** ****** *)

local

staload
TM = "libc/SATS/time.sats"
stadef time_t = $TM.time_t

in (* in-of-local *)

implement
emit_time_stamp (out) = let
//
var tm: time_t
val () = tm := $TM.time_get ()
val (pfopt | p_tm) = $TM.localtime (tm)
//
val () = emit_text (out, "######\n");
val () = emit_text (out, "## The Python3 code is generated by atscc2py\n")
val () = emit_text (out, "## The starting compilation time is: ")
//
val () =
if
p_tm > 0
then let
  prval Some_v @(pf1, fpf1) = pfopt
  val tm_min = $TM.tm_get_min (!p_tm)
  val tm_hour = $TM.tm_get_hour (!p_tm)
  val tm_mday = $TM.tm_get_mday (!p_tm)
  val tm_mon = 1 + $TM.tm_get_mon (!p_tm)
  val tm_year = 1900 + $TM.tm_get_year (!p_tm)
  prval () = fpf1 (pf1)
in
  $extfcall
  (
    void
  , "fprintf"
  , out, "%i-%i-%i: %2ih:%2im\n", tm_year, tm_mon, tm_mday, tm_hour, tm_min
  )
end // end of [then]
else let
  prval None_v () = pfopt
in
  emit_text (out, "**TIME-ERROR**\n")
end // end of [else]
//
val () = emit_text (out, "######\n")
//
in
  // emit_newline (out)
end // end of [emit_time_stamp]

end // end of [local]

(* ****** ****** *)
//
implement
emit_PMVint
  (out, tok) = let
//
val-T_INT(base, rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_PMVint]
//
implement
emit_PMVintrep
  (out, tok) = let
//
val-T_INT(base, rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_PMVintrep]
//
(* ****** ****** *)
//
implement
emit_PMVbool
  (out, tfv) =
(
  emit_text (out, if tfv then "True" else "False")
) (* end of [emit_PMVbool] *)
//
(* ****** ****** *)

implement
emit_PMVfloat
  (out, tok) = let
//
val-T_FLOAT(base, rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_PMVfloat]

(* ****** ****** *)

implement
emit_PMVstring
  (out, tok) = let
//
val-T_STRING(rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_PMVstring]

(* ****** ****** *)

implement
emit_PMVi0nt
  (out, tok) = let
//
val-T_INT(base, rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_PMVi0nt]

(* ****** ****** *)

implement
emit_PMVf0loat
  (out, tok) = let
//
val-T_FLOAT(base, rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_PMVf0loat]

(* ****** ****** *)
//
implement
emit_PMVempty
  (out, _) = emit_text (out, "None")
//  
implement
emit_PMVextval
  (out, toks) = emit_tokenlst (out, toks)
//
(* ****** ****** *)
//
implement
emit_PMVfunlab
  (out, flab) = emit_label (out, flab)
//
(* ****** ****** *)

implement
emit_PMVcfunlab
  (out, fl, d0es) =
{
//
val () =
  emit_label (out, fl)
val () =
  emit_text (out, "__closurerize")
//
val () = emit_LPAREN (out)
val () = emit_d0explst (out, d0es)
val () = emit_RPAREN (out)
//
} (* end of [emit_PMVcfunlab] *)

(* ****** ****** *)

implement
emit_CSTSPmyloc
  (out, tok) = let
//
val-T_STRING(rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_CSTSPmyloc]

(* ****** ****** *)

implement
emit_ATSCKpat_con0
  (out, d0e, tag) =
{
  val () =
  emit_text (out, "ATSCKpat_con0(")
  val () = (
    emit_d0exp (out, d0e); emit_text (out, ", "); emit_int (out, tag); emit_RPAREN (out)
  ) (* end of [val] *)
} (* end of [emit_ATSCKpat_con0] *)

implement
emit_ATSCKpat_con1
  (out, d0e, tag) =
{
  val () =
  emit_text (out, "ATSCKpat_con1(")
  val () = (
    emit_d0exp (out, d0e); emit_text (out, ", "); emit_int (out, tag); emit_RPAREN (out)
  ) (* end of [val] *)
} (* end of [emit_ATSCKpat_con1] *)

(* ****** ****** *)
//
implement
emit_tmpvar
  (out, tmp) = emit_i0de (out, tmp)
//
(* ****** ****** *)

implement
emit_d0exp
  (out, d0e0) = let
in
//
case+
d0e0.d0exp_node of
//
| D0Eide (tmp) =>
  {
    val () = emit_tmpvar (out, tmp)
  }
//
| D0Eappid (fid, d0es) =>
  {
    val () = emit_i0de (out, fid)
    val () = emit_LPAREN (out)
    val () = emit_d0explst (out, d0es)
    val () = emit_RPAREN (out)
  }
| D0Eappexp (d0e, d0es) =>
  {
    val () = emit_d0exp (out, d0e)
    val () = emit_LPAREN (out)
    val () = emit_d0explst (out, d0es)
    val () = emit_RPAREN (out)
  }
//
| D0Elist (d0es) =>
  {
    val () = emit_text (out, "D0Elist")
    val () = emit_LPAREN (out)
    val () = emit_d0explst (out, d0es)
    val () = emit_RPAREN (out)
  }
//
| ATSPMVint (int) => emit_PMVint (out, int)
| ATSPMVintrep (int) => emit_PMVintrep (out, int)
//
| ATSPMVbool (tfv) => emit_PMVbool (out, tfv)
//
| ATSPMVfloat (flt) => emit_PMVfloat (out, flt)
//
| ATSPMVstring (str) => emit_PMVstring (out, str)
//
| ATSPMVi0nt (tok) => emit_PMVi0nt (out, tok)
| ATSPMVf0loat (tok) => emit_PMVfloat (out, tok)
//
| ATSPMVempty (_) => emit_PMVempty (out, 0)
| ATSPMVextval (toklst) => emit_PMVextval (out, toklst)
//
| ATSPMVrefarg0 (d0e) => emit_d0exp (out, d0e)
| ATSPMVrefarg1 (d0e) => emit_d0exp (out, d0e)
//
| ATSPMVfunlab (fl) => emit_PMVfunlab (out, fl)
| ATSPMVcfunlab
    (knd, fl, d0es) => emit_PMVcfunlab (out, fl, d0es)
//
| ATSPMVcastfn
    (_(*fid*), _(*s0e*), arg) => emit_d0exp (out, arg)
//
| ATSCSTSPmyloc (tok) => emit_CSTSPmyloc (out, tok)
//
| ATSCKpat_con0
    (d0e, tag) => emit_ATSCKpat_con0 (out, d0e, tag)
| ATSCKpat_con1
    (d0e, tag) => emit_ATSCKpat_con1 (out, d0e, tag)
//
| ATSSELcon _ => emit_SELcon (out, d0e0)
| ATSSELrecsin _ => emit_SELrecsin (out, d0e0)
| ATSSELboxrec _ => emit_SELboxrec (out, d0e0)
| ATSSELfltrec _ => emit_text (out, "ATSSELfltrec(...)")
//
| ATSextfcall
    (_fun, _arg) => {
    val () = emit_i0de (out, _fun)
    val () = emit_d0exparg (out, _arg)
  } (* end of [ATSextfcall] *)
| ATSextmcall
    (_obj, _mtd, _arg) => {
//
    val () = emit_d0exp (out, _obj)
    val () = emit_DOT (out)
    val () = emit_d0exp (out, _mtd)
//
    val () = emit_d0exparg (out, _arg)
//
  } (* end of [ATSextmcall] *)
//
| ATSfunclo_fun
    (d2e, _(*arg*), _(*res*)) => emit_d0exp (out, d2e)
| ATSfunclo_clo
    (d2e, _(*arg*), _(*res*)) =>
  (
    emit_d0exp (out, d2e);
    emit_LBRACKET (out); emit_int (out, 0); emit_RBRACKET (out)
  ) (* end of [ATSfunclo_clo] *)
//
end // end of [emit_d0exp]

(* ****** ****** *)

local

fun
loop
(
  out: FILEref, d0es: d0explst, i: int
) : void =
(
case+ d0es of
| list_nil () => ()
| list_cons (d0e, d0es) => let
    val () =
      if i > 0 then emit_text (out, ", ")
    // end of [val]
  in
    emit_d0exp (out, d0e); loop (out, d0es, i+1)
  end // end of [list_cons]
)

in (* in-of-local *)

implement
emit_d0explst (out, d0es) = loop (out, d0es, 0)
implement
emit_d0explst_1 (out, d0es) = loop (out, d0es, 1)

end // end of [local]

(* ****** ****** *)

implement
emit_d0exparg
  (out, d0es) = 
{
//
val () = emit_LPAREN (out)
val () = emit_d0explst (out, d0es)
val () = emit_RPAREN (out)
//
} (* end of [emit_d0exparg] *)

(* ****** ****** *)
//
extern
fun
tyrec_labsel
  (tyrec: tyrec, lab: symbol): int
//
implement
tyrec_labsel
  (tyrec, lab) = let
//
fun loop
(
  xs: tyfldlst, i: int
) : int =
(
case+ xs of
| list_cons (x, xs) => let
    val TYFLD (id, s0e) = x.tyfld_node
  in
    if lab = id.i0de_sym then i else loop (xs, i+1)
  end // end of [list_cons
| list_nil ((*void*)) => ~1(*error*)
)
//
in
  loop (tyrec.tyrec_node, 0)
end // end of [tyrec_labsel]
//
(* ****** ****** *)

implement
emit_SELcon
  (out, d0e) = let
//
val-ATSSELcon
  (d0rec, s0e, id) = d0e.d0exp_node
val-S0Eide (name) = s0e.s0exp_node
val-~Some_vt (s0rec) = typedef_search_opt (name)
//
val index = tyrec_labsel (s0rec, id.i0de_sym)
//
val () =
  emit_d0exp (out, d0rec)
//
val () = emit_LBRACKET (out)
val () = emit_int (out, index)
val () = emit_RBRACKET (out)
//
in
  // nothing
end // end of [emit_SELcon]

(* ****** ****** *)

implement
emit_SELrecsin
  (out, d0e) = let
//
val-ATSSELrecsin
  (d0rec, s0e, id) = d0e.d0exp_node
//
in
  emit_d0exp (out, d0rec)
end // end of [emit_SELrecsin]

(* ****** ****** *)

implement
emit_SELboxrec
  (out, d0e) = let
//
val-ATSSELboxrec
  (d0rec, s0e, id) = d0e.d0exp_node
val-S0Eide (name) = s0e.s0exp_node
val-~Some_vt (s0rec) = typedef_search_opt (name)
//
val index = tyrec_labsel (s0rec, id.i0de_sym)
//
val () =
  emit_d0exp (out, d0rec)
//
val () = emit_LBRACKET (out)
val () = emit_int (out, index)
val () = emit_RBRACKET (out)
//
in
  // nothing
end // end of [emit_SELboxrec]

(* ****** ****** *)
//
implement
emit_COMMENT_line (out) =
  emit_text (out, "#COMMENT_line\n")
//
implement
emit_COMMENT_block (out) = ((*ignored*))
//
(* ****** ****** *)

local

fun
aux0_arglst
(
  out: FILEref
, s0es: s0explst
, n0: int, i: int
) : void =
(
case+ s0es of
| list_nil () => ()
| list_cons
    (s0e, s0es) => let
    val () =
    if n0+i > 0 then emit_text (out, ", ")
    val () =
    (
      emit_text (out, "arg"); emit_int (out, i)
    ) (* end of [val] *)
  in
    aux0_arglst (out, s0es, n0, i+1)
  end // end of [list_cons]
) (* end of [aux0_arglst] *)

fun
aux0_envlst
(
  out: FILEref
, s0es: s0explst
, n0: int, i: int
) : void =
(
case+ s0es of
| list_nil () => ()
| list_cons
    (s0e, s0es) => let
    val () =
    if n0+i > 0 then emit_text (out, ", ")
    val () =
    (
      emit_text (out, "env"); emit_int (out, i)
    ) (* end of [val] *)
  in
    aux0_envlst (out, s0es, n0, i+1)
  end // end of [list_cons]
) (* end of [aux0_envlst] *)

fun
aux1_envlst
(
  out: FILEref
, s0es: s0explst, i: int
) : int =
(
case+ s0es of
| list_nil () => (i)
| list_cons
    (s0e, s0es) => let
    val () =
    if i > 0 then emit_text (out, ", ")
    val () =
    (
      emit_text (out, "cenv");
      emit_LBRACKET (out); emit_int (out, i+1); emit_RBRACKET (out)
    ) (* end of [val] *)
  in
    aux1_envlst (out, s0es, i+1)
  end // end of [list_cons]
) (* end of [aux1_envlst] *)

in (* in-of-local *)

implement
emit_closurerize
(
  out, fl, env, arg, res
) = let
//
val-S0Elist(s0es_env) = env.s0exp_node
val-S0Elist(s0es_arg) = arg.s0exp_node
//
val () = emit_ENDL (out)
val () = emit_text (out, "def ")
val () = emit_label (out, fl)
val () =
emit_text (out, "__closurerize(")
val () = aux0_envlst (out, s0es_env, 0, 0)
val ((*closing*)) = emit_text (out, "):\n")
//
val () = emit_nspc (out, 2)
val () = emit_text (out, "def ")
val () = emit_label (out, fl)
val () = emit_text (out, "__cfun(")
val () = emit_text (out, "cenv")
val () = aux0_arglst (out, s0es_arg, 1, 0)
val () = emit_text (out, "): return ")
val () =
(
  emit_label (out, fl); emit_LPAREN (out)
)
val n0 = aux1_envlst (out, s0es_env, 0)
val () = aux0_arglst (out, s0es_arg, n0, 0)
val ((*closing*)) = emit_text (out, ")\n")
//
val () = emit_nspc (out, 2)
val () = emit_text (out, "return (")
val () = emit_label (out, fl)
val () = emit_text (out, "__cfun, ")
val () = aux0_envlst (out, s0es_env, 0, 0)
val ((*closing*)) = emit_text (out, ")")
//
val () = emit_newline (out)
//
in
  // nothing
end // end of [emit_closurerize]

end // end of [local]

(* ****** ****** *)

(* end of [atsparemit_emit_py.dats] *)
