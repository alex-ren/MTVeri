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

#ifdef
CODEGEN2
#then
#else
#include "syntax_codegen2.hats"

(* ****** ****** *)

#define :: cons

implement emit_text (text) = EUstring text

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
  | EUlist (eus0) => (aux_level (out, eus0, level);
                     aux_level (out, eus, level)
                     )
in
  aux_level (out, eus, 0)
end

(* ****** ****** *)

implement emit_d0eclist (d0cs) = let
  fun loop (d0cs: d0eclist): eulist =
  case+ d0cs of
  | list_nil () => nil 
  | list_cons (d0c, d0cs) => let
    val eu = emit_d0ecl d0c
    val eus = emit_d0eclist (d0cs)
  in
    eu :: emit_newline () :: eus
  end
in
  loop (d0cs)
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
  emit_text (datcon_d0ecl_node node) :: 
  emit_newline () :: emit_lwrapper () :: emit_indent () ::
    emit_newline () :: emit_text (fkind2string fk) :: emit_text (" ") ::
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
    emit_f0head (head) :: emit_text (" ") :: emit_lwrapper () ::
    emit_indent () :: emit_newline () ::
    emit_f0body (body) :: 
    emit_unindent () :: emit_newline () :: emit_rwrapper () :: nil
  )
end

implement emit_f0head (f0head) = let
  val node = f0head.f0head_node
  val+ F0HEAD (i0de, f0marg, s0exp) = node
in
  EUlist (
  emit_i0de (i0de) :: 
  emit_text ("(") :: emit_f0marg (f0marg) :: emit_text (")") ::
  emit_text (": ") :: emit_s0exp (s0exp) :: nil
)
end

implement emit_f0body (f0body) = emit_text "f0body"

implement emit_f0marg (f0marg) = let
  val node = f0marg.f0marg_node
  fun aux (args: f0arglst): eulist =
  case+ args of
  | nil () => nil ()
  | arg :: args => emit_text (", ") :: (emit_f0arg arg) :: aux (args)
in
  case node of
  | arg :: args => EUlist ((emit_f0arg arg) :: aux (args))
  | nil () => EUlist (nil)
end

implement emit_s0exp (s0exp) = emit_text "s0exp"

implement emit_f0arg (f0arg) = emit_text "f0arg"
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

