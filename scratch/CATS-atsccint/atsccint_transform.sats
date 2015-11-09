

//
#define
CATSPARSEMIT_targetloc "./.CATS-parsemit"
// //
// (* ****** ****** *)
// //
staload "{$CATSPARSEMIT}/catsparse.sats"

//
staload "./atsccint_program.sats"
staload "./atsccint_basics.sats"
staload "./atsccint_types.sats"

abstype transformer_t = ptr

fun transformer_create (): transformer_t

fun transformer_trans_d0eclist (
  cvt: transformer_t,
  d0ecs: d0eclist)
  : itp0program

symintr .transform
overload .transform with transformer_trans_d0eclist

(* ************ Used internally ************ *)
// symintr transform

// basics
fun transform_i0de (i0de: i0de): itp0id
fun transform_label (label: label): itp0label


// type
fun transform_type_rec (typec: tyrec): itp0type
fun transform_type (s0exp: s0exp): itp0type

overload transform with transform_type_rec
overload transform with transform_type

// declaration
fun transform_fun (f0decl: f0decl): itp0func

// expression
fun transform_exp (e0: d0exp): itp0exp
fun create_exp_from_i0de (e: i0de): itp0exp

// instruction
fun transform_inslst (inss: instrlst): itp0instrlst



