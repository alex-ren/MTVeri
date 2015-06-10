
#define
CATSPARSEMIT_targetloc "./.CATS-parsemit"
//
(* ****** ****** *)
//
staload "{$CATSPARSEMIT}/catsparse.sats"

(* ****** ****** *)

staload "./atsccint_program.sats"

(* ****** ****** *)

abstype atsccint_value_type

fun interpret_toplevel (d0cs: d0eclist): program


absviewtype scope

fun scope_new (): scope
fun scope_get_ip (s: !scope): ip
fun scope_set_ip (ip: ip, s: !scope): void
fun scope_get_value (s: !scope, name: symbol): value
fun scope_add_value (s: !scope, name: symbol, v: value): bool
fun scope_update_value (s: !scope, name: symbol, v: value): bool


absviewtype stack_type
vtypedef stack = stack_type

abstype value_type
typedef value = value_type

fun stack_create (): stack

fun stack_push_layer (s: !stack): void
fun stack_pop_layer (s: !stack): void

fun stack_add_value (s: !stack, sym: symbol, v: value): bool
fun stack_get_value (s: !stack, sym: symbol, v: &value? >> value): bool



