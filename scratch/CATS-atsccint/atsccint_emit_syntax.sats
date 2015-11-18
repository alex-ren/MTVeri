(* ****** ******* *)
// atsccint_emit_syntax.sats
// Start: 2015/11/18
// Zhiqiang Ren
// aren@bu.edu
(* ****** ******* *)



#define
CATSPARSEMIT_targetloc "./.CATS-parsemit"
//
staload "{$CATSPARSEMIT}/catsparse.sats"

(* ****** ****** *)
//
typedef
emit_type_level
  (a:t@ype) = (FILEref, a, int) -> void
//
typedef
emit_type
  (a:t@ype) = (FILEref, a) -> void
//
(* ****** ****** *)
//

fun emit_d0eclist: emit_type_level (d0eclist)
fun emit_d0ecl: emit_type_level (d0ecl)



fun emit_text : emit_type (string)
fun emit_indent (out: FILEref, level: int): void


fun token2string (tok: s0tring): string














fun emit_ENDL : FILEref -> void
fun emit_SPACE : FILEref -> void
//
fun emit_COLON : FILEref -> void
fun emit_COMMA : FILEref -> void
fun emit_SEMICOLON : FILEref -> void

fun{} datcon_d0ecl_node : (d0ecl_node) -> string


