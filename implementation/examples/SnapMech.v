 (**
   This file contains the coq implementation of the .
 **)
From Coq
     Require Import QArith.QArith QArith.Qminmax QArith.Qabs QArith.Qreals
     micromega.Psatz Reals.Reals.

From Snapv
     Require Import 
     Expressions Command ExpressionTransitions
     CommandSemantics Maps Imp Hoare.

(** Error bound validator **)

Open Scope R_scope.


Definition Snap (a: R) (Lam: R) (B: R) (eps: R) :=
	SEQ (UNIF01 (Var R 1)) 
	(SEQ (UNIF1 (Var R 2)) 
		(ASGN (Var R 3) 
			(Binop Clamp (Const REAL B) 
				(Binop Round (Const REAL Lam)
					(Binop Plus (Const REAL a)
						(Binop Mult (Const REAL eps)
							(Binop Mult (Var R 2)
								(Unop Ln (Var R 1)))))))))
  .

Close Scope R_scope.