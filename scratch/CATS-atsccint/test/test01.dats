#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

// test for function definition and tail call.

fun fact (x: int): int = if x <= 0 then 1
  else x * fact (x - 1)

fun fact1 (x:int, accu: int): int =
  if x <= 0 then accu
  else fact1 (x - 1, accu * x)
// implement main0 () = let
//   val x = fact 3
//   val () = print (x)
//   val () = print ("\n")
// in end

