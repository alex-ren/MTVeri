
staload "../conats.sats"

fun foo1(x: int): int = x + 1

fun foo (): void = let
val q = foo1 (3)
val g = conats_mutex_create()
val (v | ()) = conats_mutex_acquire (g)
val () = conats_mutex_release (v | g)
val (v | ()) = conats_mutex_acquire (g)
val () = conats_mutex_release (v | g)
in
end

val () = foo ()

%{$
#assert main deadlockfree;

#assert main |= G sys_assertion;

%}
