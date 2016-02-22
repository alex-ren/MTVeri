// 12/02/2015
// aren@bu.edu
// This test case is for handling exceptions.

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

exception exp0 of ()
exception exp1 of (int)
exception exp2 of (int, string)

fun foo (x: int): int =
if x = 0 then $raise exp0 ()
else if x = 1 then $raise exp1 (x)
else if x = 2 then $raise exp2 (x, "a")
else 3



