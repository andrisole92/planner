(define (domain BLOCKS)
  	(:requirements :strips :fluents :typing)
  	(:types
		tower agent brick level cone - object
	)
	(:predicates 
        (tower_complete ?t - tower)
        (tower_not_complete ?t - tower)
		(start_complete_tower ?t -tower)
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
	(:action start_complete_tower
		:parameters (?t - tower)
		:precondition (and (tower_not_complete ?t))
		:effect (and (tower_complete ?t))
	)
	
)
