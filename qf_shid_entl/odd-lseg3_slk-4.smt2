(set-logic QF_SHID)

(set-info :source |  Sleek solver
  http://loris-7.ddns.comp.nus.edu.sg/~project/s2/beta/
|)

(set-info :smt-lib-version 2.0)
(set-info :category "crafted")
(set-info :status sat)

; Sorts for locations, one by cell sort
(declare-sort Refnode 0)

; Types of cells in the heap

(declare-datatypes (
	(node 0)
	) (
	((c_node (nxt Refnode) ))
	)
)

; Type of heap

(declare-heap (Refnode node) 
)
; User defined predicate
(define-fun-rec olseg ((in Refnode)(p Refnode)) Bool
	(or 
			(pto in (c_node p ))
	(exists ((a Refnode)(b Refnode))
	 
		(sep 
			(pto in (c_node a ))
			(pto a (c_node b ))
			(olseg b p )
		)

		)

	)
	)


(check-sat) 
;; variables
(declare-const b Refnode)
(declare-const x Refnode)
(declare-const p Refnode)

(assert 
		(sep 
			(pto x (c_node b ))
			(olseg b p )
		)

)

(assert (not 
			(olseg x p )
))

(check-sat)
