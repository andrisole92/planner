(define (domain BLOCKS)
  	(:requirements :strips :fluents :typing)
  	(:types
		tower - object
	)
	(:predicates 
        (tower_complete ?t - tower)
    )
    
(:functions
    (tower-cost ?t - tower)
)

(:action inc
    :parameters (?t - tower)
    :precondition (and (tower_complete ?t))
    :effect (and
        (increase (tower-cost ?t) 2)
    )
)

)
