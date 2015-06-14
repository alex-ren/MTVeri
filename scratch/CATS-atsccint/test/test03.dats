
#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

// test for datatype


fun foo (): int -> int = let
  fun add (x: int): int = x + 1
in
  add
end

val xxx = foo () (1)

