// two producer and two consumer, two condition variables, using signal, deadlock

staload "../conats.sats"
staload "prelude/SATS/unsafe.sats"

(* ************* ************* *)
absvtype buffer (obj:viewt@ype, m:int, n:int)// linear abstract type
vtypedef buffer (obj:viewt@ype) = [m,n:nat|m >= n]buffer (obj, m, n)

// extern fun buffer_isemp // Is buffer empty?
//   {a:viewt@ype}{m,n:nat} (buf: !buffer (a, m, n)): bool (n == 0)
// extern fun buffer_isful // Is buffer full?
//   {a:viewt@ype}{m,n:nat} (buf: !buffer (a, m, n)): bool (m == n)
// //
// extern fun buffer_insert // Insert into a non-full buffer.
//   {a:viewt@ype}{m,n:nat | m > n} (buf: !buffer(a, m, n) >>
//                                     buffer(a, m, n+1), x: a): void
// extern fun buffer_remove // Remove from a non-empty buffer.
//   {a:viewt@ype}{m,n:nat | n > 0} (buf: !buffer(a, m, n) >>
//                                     buffer(a, m, n-1)): a

local
  // treat buffer (a, m, n) as buffer (int, 1, n)
  assume buffer (a, m, n) = atomref (int)
in
  fun buffer_isemp {a:viewt@ype} {m,n:nat} (
    buf: !buffer (a, m, n)): bool (n == 0) = let
    val n = cast{int n} (conats_atomref_get (buf))
  in
    n = 0
  end

  fun buffer_isful {a:viewt@ype} {m,n:nat} (
    buf: !buffer (a, m, n)): bool (m == n) = let
    val n = cast{int n} (conats_atomref_get (buf))
    val m = cast{int m} 1
  in
    m = n
  end
    
  fun buffer_insert {a:viewt@ype} {m,n:nat | m > n} (
    buf: !buffer(a, m, n) >> buffer(a, m, n+1), x: a): void = let
    val n = conats_atomref_get (buf)
    val () = conats_atomref_update (buf, n + 1)
    prval _ = castvwtp0 {int} (x)
  in end
  
  fun buffer_remove {a:viewt@ype} {m,n:nat | n > 0} (
    buf: !buffer(a, m, n) >> buffer(a, m, n-1)): a = let
    val n = conats_atomref_get (buf)
    val () = conats_atomref_update (buf, n - 1)
  in
    castvwtp0 {a} (0)
  end

  // Construct the model of whole system.
  // Create a buffer of length 1.
  fun buffer_create {a:viewt@ype} (): buffer (a, 1, 1) =
    conats_atomref_create (0)
end

//
vtypedef sbuffer (obj:viewt@ype) = shared_t (buffer (obj), 2)
//
// // producing an item
// extern fun produce_item {obj: viewt@ype} (): obj
// //
// // consuming a given item
// extern fun consume_item {obj: viewt@ype} (x: obj): void

local
  // treat buffer (a, m, n) as buffer (int, 1, n)
in
  fun produce_item {obj: viewt@ype} (): obj = castvwtp0 {obj} (0)
  fun consume_item {obj: viewt@ype} (x: obj): void = let
    prval _ = castvwtp0 {int} (x)
  in end
end
//
extern fun consumer {obj:viewt@ype} (sbuf: sbuffer (obj)): void
extern fun producer {obj:viewt@ype} (sbuf: sbuffer (obj)): void

#define NOTEMP 0
#define NOTFUL 1

// Keep adding elements into buffer.
fun fproducer {a:vt@ype} (s: sbuffer (a), data: a): void = let
  val buf = conats_shared_acquire (s)

  fun insert (buf: buffer (a), data: a): buffer (a) = let
    val isful = buffer_isful (buf)
  in
    if isful then let
      val buf = conats_sharedn_condwait (s, NOTEMP, buf)
    in
      insert (buf, data)
    end else let 
      val isnil = buffer_isemp (buf)
      val () = buffer_insert (buf, data)
    in
      if isnil then conats_sharedn_signal (s, NOTFUL, buf)
      else buf
    end
  end
  
  val buf = insert (buf, data)
  val () = conats_shared_release (s, buf); 
in
  ()
end

implement producer {obj} (s) = let
  val () = fproducer {obj} (s, produce_item ())
in
  producer {obj} (s)
end

//

// Keep removing elements from buffer.
fun fconsumer {a:vt@ype} (s: sbuffer (a)):<fun1> a = let
  val buf = conats_shared_acquire (s)

  fun takeout (buf: buffer (a)):<cloref1> (buffer (a), a) = let
    val isnil = buffer_isemp (buf)
  in
    if isnil then let
      val buf = conats_sharedn_condwait (s, NOTFUL, buf)
    in
      takeout (buf)
    end else let
      val isful = buffer_isful (buf)
      val data = buffer_remove (buf)
    in
      if isful then let
        // Omitting the following would cause deadlock
      in (buf, data) end
      else (buf, data)
    end
  end

  val (buf, data) = takeout (buf)
  val () = conats_shared_release (s, buf); 
in
  data
end

implement consumer {obj} (s) = let
  val () = consume_item (fconsumer {obj} (s))
in
  consumer {obj} (s)
end

// Create a buffer for model construction.
val buf = buffer_create ()

// Turn a linear buffer into a shared buffer.
val s = conats_sharedn_create {buffer (int)} (buf, 2)


val tid1 = conats_tid_allocate ()
val tid2 = conats_tid_allocate ()

val () = conats_thread_create {int} (
  lam x => producer {int} (s), 0, tid1)
val () = conats_thread_create {int} (
  lam x => consumer {int} (s), 0, tid2)

// List the properties for model checking.

%{$
#assert main deadlockfree;

// #assert main |= G sys_assertion;

%}


