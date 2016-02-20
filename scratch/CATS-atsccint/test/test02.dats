// 05/16/2015
// aren@bu.edu
// This test case is for datatype.

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

// test for datatype

datatype mytype =
| cons of (int, int)
| nil of ()

fun foo (x: int): mytype =
if x = 1 then cons (1, 2)
else nil ()

fun foo2 (x: mytype): int = 0

