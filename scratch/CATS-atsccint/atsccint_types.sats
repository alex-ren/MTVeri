

//
#define
CATSPARSEMIT_targetloc "./.CATS-parsemit"
// //
// (* ****** ****** *)
// //
staload "{$CATSPARSEMIT}/catsparse.sats"

staload "./atsccint_basics.sats"


datatype itp0type_t =
| INT
| CHAR
| REC of (List0 itp0tyfld)
where 
itp0type = itp0type_t
and
itp0tyfld = '{
  name = itp0id,
  type = itp0type
}

fun itp0type_create_int (): itp0type

fun itp0type_create_rec (id: itp0id, List0 itp0tyfld): itp0type

