// 06/16/2015
// aren@bu.edu
// This test case is for function call, return void, recursive call.

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

// test for function definition and tail call.

fun foo (): void = ()

fun fact (x: int): int = if x <= 0 then let
  val () = foo ()
in
  1
end
else x * fact (x - 1)

fun fact1 (x:int, accu: int): int =
  if x <= 0 then accu
  else fact1 (x - 1, accu * x)
// implement main0 () = let
//   val x = fact 3
//   val () = print (x)
//   val () = print ("\n")
// in end



