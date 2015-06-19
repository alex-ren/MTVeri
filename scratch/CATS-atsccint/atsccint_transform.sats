

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

symintr transform

fun transform_d0eclist (d0ecs: d0eclist): itp0program

fun transform_i0de (i0de: i0de): itp0id
fun transform_label (label: label): itp0label


fun transform_type_rec (typec: tyrec): itp0type
fun transform_type (s0exp: s0exp): itp0type

fun transform_fun (f0decl: f0decl): itp0func


overload transform with transform_d0eclist
overload transform with transform_type_rec
overload transform with transform_type

fun transform_exp (e: d0exp): itp0exp
fun create_exp_from_i0de (e: i0de): itp0exp

overload transform with transform_exp

fun transform_inslst (inss: instrlst): itp0instrlst

