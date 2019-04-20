(define (domain BLOCKS)
  (:requirements :strips :fluents :typing)
	(:predicates (on ?x ?y)
        (tower_complete ?t)  
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
