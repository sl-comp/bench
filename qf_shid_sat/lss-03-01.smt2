(set-logic QF_SHID)

(set-info :source |
  Quang Loc Le Q.Le@tees.ac.uk
|)
(set-info :smt-lib-version 2.0)
(set-info :category "crafted")
(set-info :status unsat)
(set-info :version "2018-06-15")

; Sorts for locations, one by cell sort
(declare-sort RefGTyp 0)

; Types of cells in the heap

(declare-datatypes (
	(GTyp 0)
	) (
	((c_GTyp (f0 RefGTyp) (f1 RefGTyp) ))
	)
)

; Type of heap

(declare-heap (RefGTyp GTyp) 
)
; User defined predicates
(define-funs-rec (
	(P ((x RefGTyp)) Bool
	)

	(R ((x RefGTyp)) Bool
	)

	(Q ((x RefGTyp)(y RefGTyp)) Bool
	)

        (S1 ((x RefGTyp)(y RefGTyp)(z RefGTyp)) Bool
	)
		)
		(
	(or 
		(and 
			(= (as nil RefGTyp) x)
			(_ emp RefGTyp GTyp)
		)

	
		(and 
			(distinct (as nil RefGTyp) x)
			(Q x x )
		)

	)
	
		(and 
			(distinct (as nil RefGTyp) x)
			(P x )
		)

	(or (exists ((d RefGTyp)(c RefGTyp))
	 
		(and 
			(= (as nil RefGTyp) y)
			(distinct (as nil RefGTyp) x)
		(sep 
			(pto x (c_GTyp d c ))
			(P d )
		)
		)
		)

         (exists ((d RefGTyp)(c RefGTyp))
	 
		(and 
			(distinct (as nil RefGTyp) y)
		(sep 
			(pto y (c_GTyp d c ))
			(Q x c )
		)
		)
		)

             (exists ((d RefGTyp))
	 
		(and 
			(distinct (as nil RefGTyp) d)
		        (S1 d y d )

		)

		)

	   
        )

        (or (exists ((c RefGTyp))

		(and 
			(= (as nil RefGTyp) x)
		(sep 
			(pto y (c_GTyp x c ))
                        (pto z (c_GTyp c c ))
			(P z )
		)
		)
		)

             (exists ((c RefGTyp)(d RefGTyp))
	 
		(and 
			(= (as nil RefGTyp) c)
                        (= (as nil RefGTyp) d)
		(sep
                        (pto x (c_GTyp c d ))
			(Q x y)
		)

		)

		)

	        )
		)
)


(check-sat) 
;; variables
(declare-const x0 RefGTyp)

(assert 
			(R x0 )
)

(check-sat)