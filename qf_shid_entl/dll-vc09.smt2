(set-logic QF_SHID)

(set-info :source |
C. Enea, O. Lengal, M. Sighireanu, and T. Vojnar
[Compositional Entailment Checking for a Fragment of Separation Logic]
http://www.liafa.univ-paris-diderot.fr/spen
|)
(set-info :smt-lib-version 2.0)
(set-info :category "crafted")
(set-info :status unsat)
(set-info :version "2014-06-09")

; Sorts for locations, one by cell sort
(declare-sort RefDll_t 0)

; Types of cells in the heap

(declare-datatypes (
	(Dll_t 0)
	) (
	((c_Dll_t (next RefDll_t) (prev RefDll_t) ))
	)
)

; Type of heap

(declare-heap (RefDll_t Dll_t) 
)

(define-fun-rec dll ((fr RefDll_t)(bk RefDll_t)(pr RefDll_t)(nx RefDll_t)) Bool
	(or 
		(and 
			(= fr nx)
			(= bk pr)
			(_ emp RefDll_t Dll_t)
		)

		(exists ((u RefDll_t))
	 
		(and 
			(distinct fr nx)
			(distinct bk pr)
		(sep 
			(pto fr (c_Dll_t u pr ))
			(dll u bk fr nx )
		)

		)

		)

	)
)


(check-sat) 
;; variables
(declare-const x RefDll_t)
(declare-const y RefDll_t)
(declare-const z RefDll_t)
(declare-const x1 RefDll_t)
(declare-const x2 RefDll_t)
(declare-const x3 RefDll_t)
(declare-const x4 RefDll_t)

(assert 
		(and 
			(distinct x z)
			(distinct z x1)
			(distinct z x2)
			(distinct z x3)
			(distinct z x4)
			(distinct y z)
		(sep 
			(pto x (c_Dll_t x1 (as nil RefDll_t) ))
			(pto x1 (c_Dll_t x2 x ))
			(pto x2 (c_Dll_t x3 x1 ))
			(pto x3 (c_Dll_t x4 x2 ))
			(pto x4 (c_Dll_t y x3 ))
			(pto y (c_Dll_t z x4 ))
		)

		)

)

(assert (not 
			(dll x y (as nil RefDll_t) z )
))

(check-sat)
