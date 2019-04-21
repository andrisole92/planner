﻿(define (domain BLOCKS)
  	(:requirements :strips :fluents :typing)
  	(:types
		tower agent brick level cone - object
	)
	(:predicates 
        (tower_complete ?t - tower)
        (tower_not_complete ?t - tower)
		(started_complete_tower ?t -tower)
    )
    
	(:functions
    	(tower-cost ?t - tower)
		(bricks_on_level ?t - tower)
		(free_agents)
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
		:effect (and (started_complete_tower ?t))
	)

	(:action end_complete_tower
		:parameters (?t - tower)
		:precondition (and (started_complete_tower ?t))
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
