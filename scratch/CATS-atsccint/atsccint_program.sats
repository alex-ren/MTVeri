

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define
CATSPARSEMIT_targetloc "./.CATS-parsemit"

staload "{$CATSPARSEMIT}/catsparse.sats"

staload "./atsccint_basics.sats"
staload "./atsccint_types.sats"

datatype itp0value_node =
| VPTR of (ptr)
where
itp0value = '{
  value_type = itp0type_t,
  value_node = itp0value_node
}


datatype itp0instr_node =
| DEC
| GOTO of (ref itp0instr_lst)
where
itp0instr = '{
    instr_loc = loc_t, instr_node = itp0instr_node
}
and
itp0instr_lst = List0 itp0instr

typedef itp0ip = itp0instr_lst


abstype itp0func_t
typedef itp0func = itp0func_t

fun itp0func_get_name (func: itp0func): symbol

abstype itp0para_t
typedef itp0para = itp0para_t
typedef itp0para_lst = List0 itp0para

fun ipt0func_create (name: symbol, paras: itp0para_lst, body: itp0instr_lst): itp0func





absvtype itp0program_t
vtypedef itp0program = itp0program_t

fun itp0program_new (): itp0program

fun itp0program_define_func (p: !itp0program, 
                             name: symbol,
                             func: itp0func
                            ): void

fun itp0program_define_types (p: !itp0program, id: itp0id, type: itp0type): void






