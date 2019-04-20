(define (domain BLOCKS)
  	(:requirements :strips :fluents :typing)
  	(:types
		tower agent brick level cone - object
	)
	(:predicates 
        (tower_complete ?t - tower)
        (tower_not_complete ?t - tower)
		(start_complete_tower ?t -tower)
		(bricks_on_level ?t - tower)
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

	(:action start_install_brick
		:parameters (?t - tower)
		:precondition (and 
			(tower_not_complete ?t)
			(< (bricks_on_level ?t) 4)
		)
		:effect (and 
			(increase (bricks_on_level ?t) 1)
		)
	)
	
	
)
