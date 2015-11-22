(* ****** ******* *)
// atsccint_emit_syntax.dats
// Start: 2015/11/18
// Zhiqiang Ren
// aren@bu.edu
(* ****** ******* *)
 
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
staload "./aux_lib.sats"
//
#define
CATSPARSEMIT_targetloc "./.CATS-parsemit"
//
staload "{$CATSPARSEMIT}/catsparse.sats"
//
staload "./atsccint_emit_syntax.sats"
//
#codegen2("datcon", d0ecl_node)
#codegen2("datcon", token_node)
#codegen2("datcon", fkind_node)
#codegen2("datcon", instr_node)

#ifdef
CODEGEN2
#then
#else
#include "syntax_codegen2.hats"

(* ****** ****** *)

#define :: cons

implement emit_text (text) = EUstring text
implement emit_int (n) = EUint n

implement emit_newline () = EUnewline

implement emit_indent () = EUindent
implement emit_unindent () = EUunindent
implement emit_lwrapper () = EUlwrapper
implement emit_rwrapper () = EUrwrapper

fun fprint_indent (out: FILEref, level: int): void =
if level > 0 then let
  val () = fprint (out, "  ")
in
  fprint_indent (out, level - 1)
end

implement fprint_emit_unit_list (out, eus) = let
fun aux_level (out: FILEref, eus: eulist, level: int): void =
case+ eus of
| nil () => ()
| eu :: eus =>
  case+ eu of
  | EUindent () => aux_level (out, eus, level + 1)
  | EUunindent () => aux_level (out, eus, level - 1)
  | EUlwrapper () => (fprint (out, "("); aux_level (out, eus, level))
  | EUrwrapper () => (fprint (out, ")"); aux_level (out, eus, level))
  | EUnewline () => (fprint (out, "\n");
                    fprint_indent (out, level);
                    aux_level (out, eus, level)
                    )
  | EUstring (text) => (fprint (out, text); aux_level (out, eus, level))
  | EUint (n) => (fprint (out, n); aux_level (out, eus, level))
  | EUlist (eus0) => (aux_level (out, eus0, level);
                     aux_level (out, eus, level)
                     )
in
  aux_level (out, eus, 0)
end

(* ****** ****** *)

implement emit_d0eclist (d0cs) = let
  fun aux (d0cs: d0eclist): eulist =
  case+ d0cs of
  | nil () => nil
  | d0c :: d0cs => let
    val eu = emit_d0ecl d0c
    val eus = aux (d0cs)
  in
    emit_newline () :: eu :: eus
  end
in
case+ d0cs of
| d0c :: d0cs => emit_text ("// d0eclist") :: emit_newline () ::
      emit_d0ecl (d0c) :: aux (d0cs)
| nil () => emit_text ("// d0eclist") :: nil
end
  
implement
emit_d0ecl
  (d0c) = let
  val node = d0c.d0ecl_node
in
//
case node of
//
| D0Cinclude s0tring => EUlist (
  emit_text (datcon_d0ecl_node node) :: 
  emit_lwrapper () ::
  emit_text (token2string (s0tring)) ::
  emit_rwrapper () :: nil
)
| D0Cifdef (i0de, d0ecs) => EUlist (
  emit_text (datcon_d0ecl_node node) ::
  emit_lwrapper () :: emit_i0de (i0de) :: emit_rwrapper () :: emit_newline () ::
  emit_lwrapper () :: 
  emit_indent () ::
  emit_newline () ::
  EUlist (emit_d0eclist (d0ecs)) ::
  emit_unindent () ::
  emit_newline () ::
  emit_rwrapper () :: nil
)
// | D0Cifndef _ => ()
// //
// | D0Ctypedef (id, def) =>
//     typedef_insert (id.i0dex_sym, def)
//   // end of [D0Ctypedef]
// //
// | D0Cassume (id) =>
//   {
//     val () = emit_ENDL (out)
//     val () =
//       emit_text (out, "// ATSassume(")
//     val () = (
//       emit_i0de (out, id); emit_text (out, ")\n")
//     ) (* end of [val] *)
//   }
// //
| D0Cdyncst_mac i0de => EUlist (
  // Just for comment. No special usage.
  emit_text (datcon_d0ecl_node node) ::
  emit_lwrapper () :: emit_i0de (i0de) :: emit_rwrapper () :: nil
)
// //
// | D0Cdyncst_extfun _ => ()
// //
// | D0Cdyncst_valdec _ => ()
// //
// | D0Cdyncst_valimp
//     (id, s0e) => {
//     val () = emit_ENDL (out)
//     val () = (
//       emit_text (out, "var "); emit_i0de (out, id)
//     ) (* end of [val] *)
//     val () = emit_text (out, "\n")
//   }
// //
// | D0Cextcode(toks) =>
//   {
//     val () = emit_ENDL (out)
//     val () =
//       emit_text (out, ATSEXTCODE_BEG)
//     // end of [val]
//     val () = emit_extcode (out, toks) // HX: verbatim output
//     val () =
//       emit_text (out, ATSEXTCODE_END)
//     // end of [val]
//     val ((*void*)) = emit_newline (out)
//   } (* end of [D0Cextcode] *)
// //
// | D0Cstatmp(tmp, opt) =>
//   {
//     val () = emit_ENDL (out)
//     val () = (
//       case+ opt of
//       | Some _ => () | None () => emit_text(out, "/*\n")
//     ) (* end of [val] *)
//     val () = (
//       emit_text (out, "var "); emit_tmpvar (out, tmp); emit_ENDL (out)
//     ) (* end of [val] *)
//     val () = (
//       case+ opt of
//       | Some _ => () | None () => emit_text(out, "*/\n")
//     ) (* end of [val] *)
//   } (* end of [D0Cstatmp] *)
// //
| D0Cfundecl (fk, f0d) => EUlist (
  emit_text (datcon_d0ecl_node node) :: emit_lwrapper () ::
  emit_newline () :: emit_indent () :: 
  emit_text (fkind2string fk) :: emit_text (" ") ::
  emit_f0decl (f0d) ::
  emit_unindent () ::
  emit_newline () :: emit_rwrapper () :: nil
)
// //
// | D0Cclosurerize
//     (fl, env, arg, res) =>
//   {
//     val () = emit_closurerize (out, fl, env, arg, res)
//   }
// //
// | D0Cdynloadflag_init(flag) => (
// //
// // HX-2015-05-22:
// // it is skipped as JS does not have a link-time!
// //
//   ) (* end of [D0Cdynloadflag_init] *)
// //
// | D0Cdynloadflag_minit(flag) => (
//     emit_text (out, "// dynloadflag_minit\n");
//     emit_text (out, "var "); emit_tmpvar (out, flag); emit_text (out, " = 0;\n")
//   ) (* end of [D0Cdynloadflag_minit] *)
// //
| _ => emit_text (datcon_d0ecl_node node)
end // end of [emit_d0ecl]



implement emit_i0de (i0de) = let
  val name = symbol_get_name i0de.i0dex_sym
in
  EUlist (
  emit_text ("i0de") ::
  emit_lwrapper () ::
  emit_text (name) ::
  emit_rwrapper () ::
  nil
  )
end

implement emit_f0decl (f0d) = let
  val node = f0d.f0decl_node
in
  case+ node of
  | F0DECLnone head => emit_f0head head
  | F0DECLsome (head, body) => EUlist (
    emit_f0head (head) :: emit_text (" ") :: emit_text ("{") ::
    emit_indent () :: emit_newline () ::
    emit_f0body (body) :: 
    emit_unindent () :: emit_newline () :: emit_text ("}") :: nil
  )
end

implement emit_f0head (f0head) = let
  val node = f0head.f0head_node
  val+ F0HEAD (i0de, f0marg, s0exp) = node
in
  EUlist (
  emit_i0de (i0de) :: emit_text ("(") ::
  emit_newline () :: emit_f0marg (f0marg) :: 
  emit_newline () :: emit_text (")") ::
  emit_text (": ") :: emit_s0exp (s0exp) :: nil
)
end

implement emit_f0body (f0body) = let
  val node = f0body.f0body_node
  val+ F0BODY (tmpdeclst, instrlst) = node
  val eu1 = EUlist (emit_tmpdeclst (tmpdeclst))
  val eu2 = EUlist (emit_instrlst (instrlst))
in
  EUlist (emit_text ("// f0body") :: 
          emit_newline () :: eu1 :: emit_newline () :: eu2 :: nil)
end

implement emit_f0marg (f0marg) = let
  val node = f0marg.f0marg_node
  fun aux (args: f0arglst): eulist =
  case+ args of
  | nil () => nil ()
  | arg :: args => emit_newline () ::
                   emit_text (", ") :: (emit_f0arg arg) :: aux (args)
in
  case node of
  | arg :: args => EUlist ( emit_text ("// f0marg") ::
    emit_newline () :: EUlist ((emit_f0arg arg) :: aux (args)) ::
    nil)
  | nil () => emit_text ("// f0marg")
end

implement emit_s0exp (s0exp) = emit_text "s0exp"  // todo

implement emit_f0arg (f0arg) = let
  val node = f0arg.f0arg_node
in
  case+ node of
  | F0ARGnone (s0exp) => EUlist (
    emit_text ("?: ") :: emit_s0exp (s0exp) :: nil)
  | F0ARGsome (i0de, s0exp) => EUlist (
    emit_i0de (i0de) :: emit_text (": ") :: 
    emit_s0exp (s0exp) :: nil)
end

implement emit_tmpdeclst (tmpdeclst) = let
  fun aux (tmpdecs: tmpdeclst): eulist =
  case+ tmpdecs of
  | nil () => nil ()
  | tmpdec :: tmpdecs => 
      emit_newline () :: emit_tmpdec (tmpdec) :: aux (tmpdecs)
in
case+ tmpdeclst of
| nil () => emit_text ("// tmpdeclst") :: nil ()
| tmpdec :: tmpdecs => emit_text ("// tmpdeclst") :: 
                   emit_newline () :: emit_tmpdec (tmpdec) :: aux (tmpdecs)
end

implement emit_instrlst (instrlst) = let
  fun aux (instrs: instrlst): eulist =
  case+ instrs of
  | nil () => nil ()
  | instr :: instrs => emit_newline () :: emit_instr (instr) :: aux (instrs)
in
case+ instrlst of
| nil () => emit_text ("// instrlst") :: nil
| instr :: instrs => emit_text ("// instrlst") ::
                 emit_newline () :: emit_instr (instr) :: aux (instrs)
end
  


implement emit_tmpdec (tmpdec) = let
  val node = tmpdec.tmpdec_node
in
  case+ node of
  | TMPDECnone (i0de) => EUlist (emit_text ("var ") ::
    emit_i0de (i0de) :: emit_text (": ?") :: nil)
  | TMPDECsome (i0de, s0exp) => EUlist (emit_text ("var ") ::
    emit_i0de (i0de) :: emit_text (": ") :: 
    emit_s0exp (s0exp) :: nil)
end

implement emit_instr (instr) = let
  val node = instr.instr_node
  val datcon = datcon_instr_node node
in
case+ node of
| ATSif  // This is used in if expression.
  (
    d0e, inss, inssopt
  ) => let
    val inss_else = (case+ inssopt of
    | Some (inss) => inss
    | None () => nil
    ): instrlst
  in
    EUlist (
    emit_text (datcon) :: emit_lwrapper () :: 
    emit_d0exp (d0e) :: emit_rwrapper () :: emit_text (" {") ::
    emit_indent () :: emit_newline () :: EUlist (emit_instrlst (inss)) ::
    emit_unindent () :: emit_newline () :: emit_text ("} else {") ::
    emit_indent () :: emit_newline () ::EUlist (emit_instrlst (inss_else)) ::
    emit_unindent () :: emit_newline () :: emit_text ("}") :: nil
  )
  end // end of [ATSif]
//
// | ATSifthen (d0e, inss) =>
//   {
// //
//     val-list_cons (ins, _) = inss
// //
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "if(")
//     val () = emit_d0exp (out, d0e)
//     val () = emit_text (out, ") ")
//     val () = emit_instr (out, ins)
//   }
// //
// | ATSifnthen (d0e, inss) =>
//   {
// //
//     val-list_cons (ins, _) = inss
// //
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "if(!")
//     val () = emit_d0exp (out, d0e)
//     val ((*closing*)) = emit_text (out, ") ")
//     val () = emit_instr (out, ins)
//   }
// //
// | ATSbranchseq (inss) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "// ATSbranchseq(...)")
//   }
// //
// | ATScaseofseq (inss) =>
//   {
// //
//     val tls =
//       caseofseq_get_tmplablst (ins0)
//     // end of [val]
//     val () = the_branchlablst_set (tls)
// //
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "// ATScaseofseq_beg")
//     val () = emit_ENDL (out)
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "tmplab_js = 1;")
//     val () = emit_ENDL (out)
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "while(true) {")
//     val () = emit_ENDL (out)
//     val () = emit_nspc (out, ind+2)
//     val () = emit_text (out, "tmplab = tmplab_js; tmplab_js = 0;")
//     val () = emit_ENDL (out)
//     val () = emit_nspc (out, ind+2)
//     val () = emit_text (out, "switch(tmplab) {\n")
// //
//     val () = emit2_branchseqlst (out, ind+4, inss)
// //
//     val () = emit_nspc (out, ind+2)
//     val () = emit_text (out, "} // end-of-switch\n")
// //
//     val () = emit_nspc (out, ind+2)
//     val () =
//       emit_text (out, "if (tmplab_js === 0) break;\n")
//     // end of [val]
// //
//     val () = emit_nspc (out, ind)
//     val ((*closing*)) = emit_text (out, "} // endwhile\n")
// //
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "// ATScaseofseq_end")
// //
//     val () = the_branchlablst_unset ((*void*))
// //
//   } (* end of [ATScaseofseq] *)
// //
| ATSfunbodyseq (instrs) =>
  // This is used to wrap all the instructions in a function body.
  EUlist (
  emit_text (datcon) :: emit_lwrapper () ::
  emit_indent () :: emit_newline () :: EUlist (emit_instrlst (instrs)) ::
  emit_unindent () :: emit_newline () :: emit_rwrapper () :: nil
  )
| ATSreturn (i0de) => EUlist (
    emit_text (datcon) :: emit_lwrapper () ::
    emit_i0de (i0de) :: emit_rwrapper () :: nil )
//
| ATSreturn_void (i0de) => EUlist (
    emit_text (datcon) :: emit_lwrapper () ::
    emit_i0de (i0de) :: emit_rwrapper () :: nil )
// //
// | ATSINSlab (lab) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "case ")
//     val () =
//     (
//       emit_tmplab_index (out, lab); emit_COLON (out)
//     ) (* end of [val] *)
//     val () =
//     (
//       emit_text (out, " // "); emit_label (out, lab)
//     ) (* end of [val] *)
//   } (* end of [ATSINSlab] *)
// //
// | ATSINSgoto (lab) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () =
//       emit_text (out, "{ tmplab_js = ")
//     // end of [val]
//     val () = emit_tmplab_index (out, lab)
//     val ((*closing*)) = emit_text (out, "; break; }")
//   } (* end of [ATSINSgoto] *)
// //
| ATSINSflab (flab) =>  // Create a label.
  EUlist (emit_text (datcon) :: emit_lwrapper () ::
          emit_label (flab) :: emit_rwrapper () :: nil)
//   {
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "// ")
//     val () = emit_label (out, flab)
//   } (* end of [ATSINSflab] *)
// //
| ATSINSfgoto (flab) => EUlist (
  emit_text (datcon) :: emit_lwrapper () :: emit_label (flab) ::
  emit_rwrapper () :: nil )
  // (* end of [ATSINSfgoto] *)
//
// | ATSINSfreeclo (d0e) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "// ")
//     val () = emit_text (out, "ATSINSfreeclo")
//     val () = emit_LPAREN (out)
//     val () = emit_d0exp (out, d0e)
//     val () = emit_RPAREN (out)
//     val () = emit_SEMICOLON (out)
//   }
// | ATSINSfreecon (d0e) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "// ")
//     val () = emit_text (out, "ATSINSfreecon")
//     val () = emit_LPAREN (out)
//     val () = emit_d0exp (out, d0e)
//     val () = emit_RPAREN (out)
//     val () = emit_SEMICOLON (out)
//   }
// //
| ATSINSmove (tmp, d0e) => EUlist (
    emit_text (datcon) :: emit_lwrapper () ::
    emit_i0de (tmp) :: emit_text (", "):: emit_d0exp (d0e) ::
    emit_rwrapper () :: nil )
//
| ATSINSmove_void (tmp, d0e(*command*)) => 
  EUlist (emit_text (datcon) :: emit_lwrapper () :: 
          emit_i0de (tmp) :: emit_text(", ") :: emit_d0exp (d0e) ::
          emit_rwrapper () :: nil)
//
// | ATSINSmove_nil (tmp) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = emit_tmpvar (out, tmp)
//     val () = emit_text (out, " = ")
//     val () = emit_text (out, "null")
//     val () = emit_SEMICOLON (out)
//   }
// | ATSINSmove_con0 (tmp, tag) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = emit_tmpvar (out, tmp)
//     val () = (
//       emit_text (out, " = "); emit_PMVint (out, tag)
//     ) (* end of [val] *)
//     val () = emit_SEMICOLON (out)
//   }
// //
// | ATSINSmove_con1 _ =>
//     emit2_ATSINSmove_con1 (out, ind, ins0)
// //
// | ATSINSmove_boxrec _ =>
//     emit2_ATSINSmove_boxrec (out, ind, ins0)
// //
// | ATSINSmove_delay _ =>
//     emit2_ATSINSmove_delay (out, ind, ins0)
// | ATSINSmove_lazyeval _ =>
//     emit2_ATSINSmove_lazyeval (out, ind, ins0)
// //
| ATStailcalseq (instrs) =>
  // These instructions are for tail call.
  EUlist (
  emit_text (datcon) :: emit_lwrapper () ::
  emit_indent () :: emit_newline () :: EUlist (emit_instrlst (instrs)) ::
  emit_unindent () :: emit_newline () :: emit_rwrapper () :: nil
  )
  // end of [ATStailcalseq]
//
| ATSINSmove_tlcal (tmp, d0e) => EUlist (
    emit_text (datcon) :: emit_lwrapper () ::
    emit_i0de (tmp) :: emit_text (", "):: emit_d0exp (d0e) ::
    emit_rwrapper () :: nil )
// (* end of [ATSINSmove_tlcal] *)
//
| ATSINSargmove_tlcal (tmp1, tmp2) => EUlist (
  emit_text (datcon) :: emit_lwrapper () :: emit_i0de (tmp1) ::
  emit_text (", ") :: emit_i0de (tmp2) :: emit_rwrapper () :: nil )
  // (* end of [ATSINSargmove_tlcal] *)
//
// | ATSINSextvar_assign (ext, d0e_r) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = emit_d0exp (out, ext)
//     val () = emit_text (out, " = ")
//     val () = emit_d0exp (out, d0e_r)
//     val () = emit_SEMICOLON (out)
//   }
// | ATSINSdyncst_valbind (d2c, d0e_r) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = emit_i0de (out, d2c)
//     val () = emit_text (out, " = ")
//     val () = emit_d0exp (out, d0e_r)
//     val () = emit_SEMICOLON (out)
//   }
// //
// | ATSINScaseof_fail (errmsg) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "ATSINScaseof_fail")
//     val () = emit_LPAREN (out)
//     val () = emit_PMVstring (out, errmsg)
//     val () = emit_RPAREN (out)
//     val () = emit_SEMICOLON (out)
//   }
// | ATSINSdeadcode_fail (__tok__) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = emit_text (out, "ATSINSdeadcode_fail()")
//     val () = emit_SEMICOLON (out)
//   }
// //
| ATSdynload (dummy) => EUlist (
  emit_text (datcon) :: emit_lwrapper () :: emit_int (dummy) :: 
  emit_rwrapper () :: nil )
//
| ATSdynloadset (flag) => EUlist (
  emit_text (datcon) :: emit_lwrapper () :: emit_i0de (flag) ::
  emit_rwrapper () :: nil )
//
// | ATSdynloadfcall (fcall) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = (
//       emit_tmpvar (out, fcall); emit_text (out, "(/*void*/) ; // dynloading")
//     ) (* end of [val] *)
//   }
// //
// | ATSdynloadflag_sta (flag) =>
//   {
//     val () = emit_nspc (out, ind)
//     val () = fprint! (out, "// ATSdynloadflag_sta(", flag, ")")
//   }
| ATSdynloadflag_ext (flag) => EUlist (
  emit_text (datcon) :: emit_lwrapper () :: emit_i0de (flag) ::
  emit_rwrapper () :: nil )
//
| _ => EUlist (emit_text (datcon) :: emit_text ("todo") :: nil) // todo
end  // end of [emit_instr]

implement emit_label (label) = emit_i0de (label)
implement emit_d0exp (d0e) = emit_text ("d0exp todo")

//
//

implement token2string (tok) = let
  val node = tok.token_node
  val node_str = datcon_token_node node
  val str = (
  case- node of
  | T_STRING (str) => str
  | T_IDENT_alp (str) => str
  | _ => datcon_token_node tok.token_node
  )
in
  node_str + "(" + str + ")"
end

implement fkind2string (fk) = datcon_fkind_node fk.fkind_node


  
#endif

