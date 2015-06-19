
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
      val id = transform_i0de (i0de)
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
    val () = name := transform_i0de (i0de)

    //
    vtypedef env = itp0paralst
    implement list_foreach$fwork<f0arg><itp0paralst>(f0arg, paralst) = let
      val f0arg_node = f0arg.f0arg_node
      val para = (case+ f0arg_node of
                 | F0ARGnone (s0exp) => itp0para_create (transform (s0exp))
                 | F0ARGsome (i0de, s0exp) => let
                   val id = transform_i0de (i0de)
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


absvtype mymap (a:type, b:type)

extern fun mymap_new {a:type} {b:type} (): mymap (a, b)
extern fun mymap_destroy {a:type} {b:type} (m: mymap (a, b)): void

extern fun mymap_insert {a:type} {b:type} (
  m: !mymap (a, b), key: a, v: b): void

// runtime error if not exist
extern fun mymap_get {a:type} {b:type} (m: !mymap (a, b), key: a): b

vtypedef tagmap = mymap (itp0label, itp0instrlst)

// abstype instr_stack
// extern fun instr_stack_push (ins: itp0instrlst): void
// extern fun instr_stack_push (ins: itp0instrlst): void

// fun transform_inslst (inss: instrlst): itp0instrlst
implement transform_inslst (inss) = let

// handle branch instructions: ATSif
fun transform_inslst_loop1 (
  inss: instrlst, 
  res: &ptr? >> itp0instrlst,
  backto: itp0instrlst
  // ,
  // tagmap: !tagmap
  ): void =
  case+ inss of
  | list_nil () => (res := backto)
  | list_cons (ins, inss2) =>
    case+ ins.instr_node of
    // made from ATSif, ATSthen, ATSelse
    | ATSif (d0exp, instrlst, instrlstopt) => let
      // exp for condition
      val itp0exp = transform_exp (d0exp)

      // rest of the instructions
      var rest: ptr?
      val () = transform_inslst_loop1 (inss2, rest, backto)

      // ITP0INSredirect is always the last one in the list.
      val backto2 = list_cons (ITP0INSredirect (rest), list_nil ())

      var inssthen: ptr?
      val () = transform_inslst_loop1 (instrlst, inssthen, backto2)

      val insselseopt = (
        case+ instrlstopt of
        | Some (insselse0) => let
          var insselse: ptr?
          val () = transform_inslst_loop1 (insselse0, insselse, backto2)
        in
          Some (insselse)
        end
        | None () => None ()
      ): itp0instrlstopt

      val ins_ITP0if = ITP0INSif (itp0exp, inssthen, insselseopt)
      val () = res := list_cons (ins_ITP0if, rest)
    in end
    // 
    | ATSINSfgoto (label) => let
      val itp0label = transform_label (label)
      val ins = ITP0INSgoto (ref<itp0instrlst> (list_nil ()))  // to be updated later
    in 
      addone (res, ins, inss2, backto)
    end
    // label used for tail call optimization for a function
    | ATSINSflab (label) => let
      val itp0label = transform_label (label)
      val ins = ITP0INSlabel (itp0label)
    in 
      addone (res, ins, inss2, backto)
    end
    // 
    // created by ATSfunbody_beg() and ATSfunbody_end
    | ATSfunbodyseq (inssbody) => let
      val inssall = list_append<instr> (inssbody, inss2)
    in
      transform_inslst_loop1 (inssall, res, backto)
    end
    | ATSINSmove (i0de, d0exp) => let
      val id = transform_i0de (i0de)
      val exp = transform (d0exp)
      val ins = ITP0INSmove (id, exp)
    in
      addone (res, ins, inss2, backto)
    end
    | ATSINSmove_void (i0de, d0exp) => let
      val exp = transform (d0exp)
      val ins = ITP0INSmove_void (exp)
    in
      addone (res, ins, inss2, backto)
    end
    | ATSreturn (i0de) => let
      val id = transform_i0de (i0de)
      val ins = ITP0return (id)
    in
      addone (res, ins, inss2, backto)
    end
    | ATSreturn_void (i0de) => let
      val ins = ITP0return_void ()
    in
      addone (res, ins, inss2, backto)
    end
    | ATStailcalseq (inssbody) => let
      val inssall = list_append<instr> (inssbody, inss2)
    in
      transform_inslst_loop1 (inssall, res, backto)
    end
    | ATSINSmove_tlcal (i0de, d0exp) => let
      val id = transform_i0de (i0de)
      val exp = transform_exp (d0exp)
      val ins = ITP0INSmove (id, exp)
    in
      addone (res, ins, inss2, backto)
    end
    | ATSINSargmove_tlcal (i0de_arg, i0de_apy) => let
      val arg = transform_i0de (i0de_arg)
      val apy = create_exp_from_i0de (i0de_apy)
      val ins = ITP0INSmove (arg, apy)
    in
      addone (res, ins, inss2, backto)
    end
    | todo => let
      val () = res := list_nil ()
    in
      $raise nosupport ("error in transforming instr")
    end

and addone (res: &ptr? >> itp0instrlst,
            ins: itp0instr, 
            inss0: instrlst, 
            backto: itp0instrlst): void = let
  val () = res := list_cons {itp0instr}{0} (ins, _)
  val list_cons (_, rest1) = res
  val () = transform_inslst_loop1 (inss0, rest1, backto)
  prval () = fold@ (res)
in end

    
extern fun transform_inslst_loop_lab (inss: itp0instrlst, tagmap: !tagmap): void
// todo implement

var res: ptr?
val tagmap = mymap_new ()
val () = transform_inslst_loop1 (inss, res, list_nil ())
val () = transform_inslst_loop_lab (res, tagmap)

val () = mymap_destroy (tagmap)
in
  res
end

// end of transform_inslst_loop1



         


    







