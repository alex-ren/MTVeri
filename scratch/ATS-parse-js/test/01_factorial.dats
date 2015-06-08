
//
staload _(*anon*) =
  "prelude/DATS/integer.dats"
// end of [staload]

extern fun fact (n: int): int

implement fact (n) = if n = 0 then 1 else n * fact (n - 1)

implement
main () = 0 where {
  val ans = fact (3)
  val () = println! ("ans = ", ans)
  val () = assertloc (ans = 6)
} // end of [main]

(* ****** ****** *)

(* end of [fact.dats] *)



