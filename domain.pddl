(define (domain BLOCKS)
  	(:requirements :strips :fluents :typing)
  	(:types
			tower agent brick level cone - object
		)
	(:predicates 
      (tower_complete ?t - tower)
			(cone_installed ?t - tower)
      (tower_not_complete ?t - tower)
			(started_complete_tower ?t -tower)
			(start_install_level ?t -tower)
			(started_install_brick ?t -tower)
  )
    
	(:functions
    	(tower-cost ?t - tower)
			(bricks_on_level ?t - tower)
			(levels_on_tower ?t - tower)
			(bricks_in_process ?t - tower)
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
		:precondition (and 
			(tower_not_complete ?t)
			(cone_installed ?t)
		)
		:effect (and 
			(started_complete_tower ?t)
			(decrease (free_agents) 2)
		)
	)

	(:action end_complete_tower
		:parameters (?t - tower)
		:precondition (and (started_complete_tower ?t))
		:effect (and 
			(tower_complete ?t)
			(increase (free_agents) 2)
		)
	)

	(:action releaseAgent
		:parameters ()
		:precondition (and (< (free_agents) 10))
		:effect (and (increase (free_agents) 1))
	)
	
	(:action start_install_brick
		:parameters (?t - tower)
		:precondition (and 
			(> (free_agents) 2)
			(tower_not_complete ?t)
			(< (bricks_on_level ?t) 4)
		)
		:effect (and 
			(increase (bricks_in_process ?t) 1)
			(decrease (free_agents) 2)
		)
	)

	(:action end_install_brick
			:parameters (?t - tower)
			:precondition (and
				(> (bricks_in_process ?t) 0)
			)
			:effect (and 
				(decrease (bricks_in_process ?t) 1)
				(increase (bricks_on_level ?t) 1)
				(increase (free_agents) 2)
			)
	)
	

	(:action start_install_level
			:parameters (?t - tower)
			:precondition (and 
				(tower_not_complete ?t)
				(= (bricks_on_level ?t) 4)
			)
			:effect (and 
				(start_install_level ?t)
				(assign (bricks_on_level ?t) 0)
			)
	)

	(:action end_install_level
			:parameters (?t - tower)
			:precondition (and 
				(start_install_level ?t)
			)
			:effect (and 
				(increase (levels_on_tower ?t) 1)
				(not (start_install_level ?t))
			)
	)
	


	(:action start_install_cone
			:parameters (?t - tower)
			:precondition (and 
				(tower_not_complete ?t)
				(= (bricks_on_level ?t) 4)
			)
			:effect (and 
				(cone_installed ?t)
				(assign (bricks_on_level ?t) 0)
			)
	)
	
)
