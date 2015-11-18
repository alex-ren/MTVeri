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
//
#define
CATSPARSEMIT_targetloc "./.CATS-parsemit"
//
staload "{$CATSPARSEMIT}/catsparse.sats"
//
staload "./atsccint_emit_syntax.sats"
//
#codegen2("datcon", d0ecl_node)

#ifdef
CODEGEN2
#then
#else
#include "syntax_codegen2.hats"
//
(* ****** ****** *)
(* ****** ****** *)

implement emit_d0eclist (out, d0cs, level) = let
fun loop (out: FILEref, d0cs: d0eclist, level: int): void =
case+ d0cs of
| list_nil () => ()
| list_cons (d0c, d0cs) => let
  val () = emit_d0ecl (out, d0c, level)
in
  loop (out, d0cs, level)
end
in
  loop (out, d0cs, level)
end
  

implement
emit_d0ecl
  (out, d0c, level) = let
  val node = d0c.d0ecl_node
in
//
case node of
//
| D0Cinclude s0tring => (
  emit_indent (out, level);
  emit_text (out, datcon_d0ecl_node node);
  emit_text (out, "(");
  emit_text (out, token2string (s0tring));
  emit_text (out, ")\n")
)
| _ => ()
//
// | D0Cifdef _ => ()
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
// | D0Cdyncst_mac _ => ()
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
// | D0Cfundecl (fk, f0d) => emit_f0decl (out, f0d)
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
end // end of [emit_d0ecl]

implement emit_text (out, text) = fprint_string (out, text)

implement emit_indent (out, level) = if level > 0 then let
  val () = emit_text (out, "  ")
in
  emit_indent (out, level - 1)
end
else ()

implement token2string (tok) =
case- tok.token_node of
| T_STRING (str) => str

#endif
