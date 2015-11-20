(* ****** ******* *)
// aux_lib.dats
// Start: 2015/11/18
// Zhiqiang Ren
// aren@bu.edu
(* ****** ******* *)

#include "share/atspre_staload.hats"

staload
UN = "prelude/SATS/unsafe.sats"

staload "aux_lib.sats"

implement aux_string_append (s1, s2) = let
  val s = string_append (s1, s2)
  val ret = $UN.castvwtp0 {string} (s)
in
  ret
end

