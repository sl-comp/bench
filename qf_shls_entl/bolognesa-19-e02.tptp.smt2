(set-logic QF_SHLS)

(set-info :source |
A. Rybalchenko and J. A. Navarro Perez.
[Separation Logic + Superposition Calculus = Heap Theorem Prover]
[PLDI 2011]
http://navarroj.com/research/papers.html#pldi11
|)
(set-info :smt-lib-version 2.0)
(set-info :category "random") 
(set-info :status sat)
(set-info :version "2014-05-28")

; Sorts for locations, one by cell sort
(declare-sort RefSll_t 0)

; Types of cells in the heap

(declare-datatypes (
	(Sll_t 0)
	) (
	((c_Sll_t (next RefSll_t) ))
	)
)

; Type of heap

(declare-heap (RefSll_t Sll_t) 
)

(define-fun-rec ls ((in RefSll_t)(out RefSll_t)) Bool
	(or 
		(and 
			(= in out)
			(_ emp RefSll_t Sll_t)
		)

		(exists ((u RefSll_t))
	 
		(and 
			(distinct in out)
		(sep 
			(pto in (c_Sll_t u ))
			(ls u out )
		)

		)

		)

	)
)


(check-sat) 
;; variables
(declare-const x0 RefSll_t)
(declare-const x1 RefSll_t)
(declare-const x2 RefSll_t)
(declare-const x3 RefSll_t)
(declare-const x4 RefSll_t)
(declare-const x5 RefSll_t)
(declare-const x6 RefSll_t)
(declare-const x7 RefSll_t)
(declare-const x8 RefSll_t)
(declare-const x9 RefSll_t)
(declare-const x10 RefSll_t)
(declare-const x11 RefSll_t)
(declare-const x12 RefSll_t)
(declare-const x13 RefSll_t)
(declare-const x14 RefSll_t)
(declare-const x15 RefSll_t)
(declare-const x16 RefSll_t)
(declare-const x17 RefSll_t)
(declare-const x18 RefSll_t)
(declare-const x19 RefSll_t)
(declare-const x20 RefSll_t)
(declare-const x21 RefSll_t)
(declare-const x22 RefSll_t)
(declare-const x23 RefSll_t)

(assert 
		(and 
			(= (as nil RefSll_t) (as nil RefSll_t))
		(sep 
			(ls x6 x13 )
			(pto x8 (c_Sll_t x1 ))
			(pto x7 (c_Sll_t x16 ))
			(pto x17 (c_Sll_t x1 ))
			(ls x11 x19 )
			(pto x16 (c_Sll_t x11 ))
			(pto x2 (c_Sll_t x5 ))
			(pto x15 (c_Sll_t x7 ))
			(ls x5 x19 )
			(ls x19 x12 )
			(pto x9 (c_Sll_t x14 ))
			(pto x18 (c_Sll_t x11 ))
			(ls x4 x16 )
			(pto x13 (c_Sll_t x2 ))
			(pto x14 (c_Sll_t x10 ))
			(pto x3 (c_Sll_t x17 ))
			(pto x10 (c_Sll_t x5 ))
			(pto x12 (c_Sll_t x14 ))
			(pto x1 (c_Sll_t x5 ))
		)

		)

)

(assert (not 
		(sep 
			(ls x8 x1 )
			(ls x9 x14 )
			(ls x6 x2 )
			(ls x2 x5 )
			(ls x3 x17 )
			(ls x17 x5 )
			(ls x15 x16 )
			(ls x4 x16 )
			(ls x16 x11 )
			(ls x18 x19 )
			(ls x19 x12 )
			(ls x12 x19 )
		)

))

(check-sat)
