
#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

// test for datatype

datatype mytype =
| cons of (int, int)
| nil of ()

fun foo (x: mytype): int =
case+ x of
| cons (aa, bb) => aa + bb
| nil () => 0


fun foo2 (x: int): mytype =
if x = 1 then cons (99, 100)
else nil ()


