
staload "share/atspre_staload.hats"

//
#define
CATSPARSEMIT_targetloc "./.CATS-parsemit"
// //
// (* ****** ****** *)
// //
staload "{$CATSPARSEMIT}/catsparse.sats"

//
staload "./atsccint_basics.sats"
staload "./atsccint_types.sats"
staload "./atsccint_program.sats"

staload "./atsccint_transform.sats"


implement transform_d0eclist (d0ecs) = let
  var prog = itp0program_new ()

  vtypedef env = itp0program

  // collect global function definitions and type definitions.
  implement list_foreach$fwork<d0ecl><env> (dec, prog) = let
  in 
    case dec.d0ecl_node of
    // #include directive
    | D0Cinclude (path) => let
      val- T_STRING (str) = path.token_node
    in
      println! ("#include ", str, " skipped")
    end
    // #ifdef directive
    | D0Cifdef (i0de, d0eclist) => println! ("D0Cifdef skipped")
    // #ifndef directive
    | D0Cifndef (i0de, d0eclist) => println! ("D0Cnifdef skipped")
    // # typedef directive
    | D0Ctypedef (i0de, tyrec) => let
      val id = transform (i0de)
      val type = transform (tyrec)
    in
      itp0program_define_types (prog, id, type)
    end
    // todo what's this?
    | D0Cassume i0de => println! ("D0Cassume for ", i0de,  "skipped")
    // todo what's this?
    | D0Cdyncst_mac i0de => println! ("D0Cdyncst_mac for ", i0de,  "skipped")
    // todo what's this?
    | D0Cdyncst_extfun (i0de, s0explst, s0exp) => 
        println! ("function declaration for ", i0de)
    // todo what's this
    | D0Cdyncst_valdec (i0de, s0exp) =>
       println! ("D0Cdyncst_valdec for ", i0de)
    // todo what's this
    | D0Cdyncst_valimp (i0de, s0exp) => 
       println! ("D0Cdyncst_valimp for ", i0de)
    // external code
    | D0Cextcode (tokenlst) =>
        println! ("D0Cextcode skipped")
    // todo what's this
    | D0Cstatmp (i0de, s0expopt) => 
       println! ("D0Cstatmp for ", i0de)
    | D0Cfundecl (fkind, f0decl) => let
      val func = transform_fun (f0decl)
      val name = itp0func_get_name (func)
    in
      itp0program_define_func (prog, name, func)
    end

    // todo what's this
    | D0Cclosurerize (
       i0de, s0exp(*env*), s0exp(*arg*), s0exp(*res*)
       ) (* end of [D0Cclosurerize] *)
       => println! ("D0Cclosurerize for ", i0de)
    // todo what's this
    | D0Cdynloadflag_init (i0de) =>
        println! ("D0Cdynloadflag_init for ", i0de)
    // todo what's this
    | D0Cdynloadflag_minit (i0de) =>
        println! ("D0Cdynloadflag_minit for ", i0de)
  end

  val () = list_foreach_env<d0ecl><env> (d0ecs, prog)
in
  prog
end

implement transform_i0de (i0de) = itp0id_create (i0de.i0de_sym)

implement transform_type_rec (tyrec) = let
  val ty_node = tyrec.tyrec_node

  vtypedef env = List0 itp0tyfld
  var tyfldlst =  list_nil ()

  // collect global function definitions and type definitions.
  implement list_foreach$fwork<tyfld><env> (tyfld0, tyfldlst) = let
    val+ TYFLD (i0de, s0exp) = tyfld0.tyfld_node
    val id = transform_i0de (i0de)
    val ty = transform_type (s0exp)
    val tyfld = '{name=id, type = ty}
    val () = tyfldlst := list_cons (tyfld, tyfldlst)
  in end

  val tyfldlst = list_reverse_append (tyfldlst, list_nil ())
in
  REC (tyfldlst)
end





















////
implement transform_fun (f0decl) = 
      case+ f0decl.f0decl_node of
      | F0DECLnone (f0head)






