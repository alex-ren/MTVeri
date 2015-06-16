
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

// fun transform_type_rec (typec: tyrec): itp0type
implement transform_type_rec (tyrec) = let
  val ty_node = tyrec.tyrec_node

  //
  vtypedef env = List0 itp0tyfld
  // collect global function definitions and type definitions.
  implement list_foreach$fwork<tyfld><env> (tyfld0, itp0tyfldlst) = let
    val+ TYFLD (i0de, s0exp) = tyfld0.tyfld_node
    val id = transform_i0de (i0de)
    val ty = transform_type (s0exp)
    val tyfld = '{name=id, type = ty}
    val () = itp0tyfldlst := list_cons (tyfld, itp0tyfldlst)
  in end

  var itp0tyfldlst =  list_nil ()
  val () = list_foreach_env<tyfld><env> (ty_node, itp0tyfldlst)
  val itp0tyfldlst = list_reverse_append (itp0tyfldlst, list_nil ())
  //
in
  REC (itp0tyfldlst)
end

// fun transform_fun (f0decl: f0decl): itp0func
implement transform_fun (f0decl) = let
  val f0decl_node = f0decl.f0decl_node
  var name: itp0id?
  var paras: itp0paralst?
  fun get_fun_header (head: f0head, 
                      name: &itp0id? >> itp0id,
                      paras: &itp0paralst? >> itp0paralst
                     ): void = let
    val node = head.f0head_node
    val+ F0HEAD (i0de, f0marg, s0exp) = node
    val () = name := transform (i0de)

    //
    vtypedef env = itp0paralst
    implement list_foreach$fwork<f0arg><itp0paralst>(f0arg, paralst) = let
      val f0arg_node = f0arg.f0arg_node
      val para = (case+ f0arg_node of
                 | F0ARGnone (s0exp) => itp0para_create (transform (s0exp))
                 | F0ARGsome (i0de, s0exp) => let
                   val id = transform (i0de)
                   val ty = transform (s0exp)
                 in
                   itp0para_create (id, ty)
                 end
                 )
      val () = paralst := list_cons (para, paralst)
    in end

    var paralst = list_nil ()
    val () = list_foreach_env<f0arg><itp0paralst>(f0marg.f0marg_node, paralst)
    val paralst = list_reverse_append (paralst, list_nil ())
    val () = paras := paralst
  in end  // end of [get_fun_header]
in
  case+ f0decl_node of
  | F0DECLnone (f0head) => let
    val () = get_fun_header (f0head, name, paras)
    val body = list_nil ()
    val func = itp0func_create (name, paras, body)
    prval () = topize (name) // explicit topizatio
    prval () = topize (paras) // explicit topizatio
  in
    func
  end
  | F0DECLsome (f0head, f0body) => let
    val () = get_fun_header (f0head, name, paras)
    val+ F0BODY (tmpdeclst, instrlst) = f0body.f0body_node
    // // todo tmpdeclst

    val body = transform_inslst (instrlst)
    val func = itp0func_create (name, paras, body)

    prval () = topize (name) // explicit topizatio
    prval () = topize (paras) // explicit topizatio
  in
    func
  end
end


abstype mymap (a:type, b:t@ype)

extern fun {b:t@ype} mymap_create {a:type} (): mymap (a, b)
extern fun {b:t@ype} mymap_insert {a:type} (m: mymap (a, b), key: a, v: &b): b

// runtime error if not exist
extern fun {b:t@ype} mymap_get {a:type} (key: a): b

typedef insmap = mymap (itp0label, itp0instr)
////
// fun transform_inslst (inss: instrlst): itp0instrlst
implement transform_inslst (inss) = let
fun transform_inslst_loop (inss: instrlst, m: mymap 
    







