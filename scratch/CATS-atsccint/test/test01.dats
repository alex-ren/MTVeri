#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun fact (x: int): int = if x <= 0 then 1
  else x * fact (x - 1)

// implement main0 () = let
//   val x = fact 3
//   val () = print (x)
//   val () = print ("\n")
// in end

