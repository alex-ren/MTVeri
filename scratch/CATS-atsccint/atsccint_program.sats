
(*
*
* The file contains data structures used to define a program.
*
*
*
*
*)

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define
CATSPARSEMIT_targetloc "./.CATS-parsemit"

staload "{$CATSPARSEMIT}/catsparse.sats"

staload "./atsccint_basics.sats"
staload "./atsccint_types.sats"

datatype itp0exp =
| ITP0EXPid of (itp0id)
| todo


datatype itp0value_node =
| VPTR of (ptr)
where
itp0value = '{
  value_type = itp0type_t,
  value_node = itp0value_node
}


datatype itp0instr_node =
| ITP0INSif of (itp0exp, itp0instrlst, itp0instrlstopt)
| ITP0INSgoto of (ref itp0instrlst)
// This must be the last of the instruction list.
// The instruction is formed from "if" instruction
| ITP0INSredirect of (itp0instrlst)
| ITP0INSlabel of (itp0label)
| ITP0INSmove of (itp0id, itp0exp)
| ITP0INSmove_void of (itp0exp)
| ITP0return of (itp0id)
| ITP0return_void of ()

where
itp0instr = itp0instr_node
// '{
//     instr_loc = loc_t, instr_node = itp0instr_node
// }
and itp0instrlst = List0 itp0instr
and itp0instrlstopt = Option itp0instrlst

typedef itp0ip = itp0instrlst


abstype itp0func_t
typedef itp0func = itp0func_t

fun itp0func_get_name (func: itp0func): symbol

abstype itp0para_t
typedef itp0para = itp0para_t
typedef itp0paralst = List0 itp0para

symintr itp0para_create
fun itp0para_create_withname (id: itp0id, ty: itp0type): itp0para
fun itp0para_create_noname (ty: itp0type): itp0para
overload itp0para_create with itp0para_create_withname
overload itp0para_create with itp0para_create_noname

fun itp0func_create (name: itp0id, paras: itp0paralst, body: itp0instrlst): itp0func






absvtype itp0program_t
vtypedef itp0program = itp0program_t

fun itp0program_new (): itp0program

fun itp0program_define_func (p: !itp0program, 
                             name: symbol,
                             func: itp0func
                            ): void

fun itp0program_define_types (p: !itp0program, id: itp0id, type: itp0type): void






