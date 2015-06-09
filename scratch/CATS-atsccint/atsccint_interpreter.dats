
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
// //
// (* ****** ****** *)
// //
staload "{$CATSPARSEMIT}/catsparse.sats"
// //
// staload "{$CATSPARSEMIT}/catsparse_syntax.sats"
// //
// staload "{$CATSPARSEMIT}/catsparse_emit.sats"
// //
// staload "{$CATSPARSEMIT}/catsparse_typedef.sats"

staload "./atsccint_interpreter.sats"
staload "./atsccint_program.sats"

implement interpret_toplevel (d0cs) = let
  // val y = $showtype(d0cs)
  val prog = program_new ()

  // collect global function definitions and type definitions.
  implement list_foreach$fwork<d0ecl><program> (x, prog) = let
    // todo
    val () = program_define_function (prog)
  in end

  // 
in
  prog
end


