

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define
CATSPARSEMIT_targetloc "./.CATS-parsemit"

staload "{$CATSPARSEMIT}/catsparse.sats"

datatype value_node =
| VPTR of (ptr)

datatype type_t =
| INT
| CHAR

datatype instruction_node =
| DEC
| GOTO of (ref instr_lst)
where
instruction = '{
    instr_loc = loc_t, instr_node = instruction_node
}
and
instr_lst = List0 instruction


abstype function_type
typedef function = function_type

abstype para_type
typedef para = para_type
typedef para_lst = List0 para

fun function_create (name: symbol, paras: para_lst, body: instr_lst): function





absvtype program_type
vtypedef program = program_type

fun program_new (): program

fun program_define_function (p: &program): void






