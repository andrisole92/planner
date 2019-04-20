(define (domain BLOCKS)
  (:requirements :strips :fluents)
	(:predicates (on ?x ?y)
        (tower_complete ?t)
	       (ontable ?x)
	       (clear ?x)
	       (handempty)
	       (holding ?x)
	       
    )
    
(:functions
    (tower-cost ?t)
)

(:action inc
    :parameters (?t)
    :precondition (and (tower_complete ?t))
    :effect (and
        (increase (tower-cost ?t) 2)
    )
)
		   		   
)
