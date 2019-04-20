(define (domain constructor)
    (:requirements :typing :strips :fluents)
    (:types agent location stick plane cone tower capability)
  
    (:functions
        (tower_levels ?t - tower) - number
        (bricks_on_level ?t - tower) - number
        (free_agents)
        (bricks_left) - number
        (planes_left) - number
        (cones_left) - number
        (levels_built ?t - tower) - number
    )
    (:predicates
	    (tower_completed ?t - tower)
	    (start_tower_completed ?t - tower)
	    (capable_of ?a - agent ?c - capability)
    )

    

    (:action start_install_brick
        :parameters (?t - tower)
        :precondition (and 
            (not (tower_completed ?t))
            (< (bricks_on_level ?t) 4)
            )
        :effect (and
            (increase (bricks_on_level ?t) 1)
        )
    )
    
    (:action install_brick
        :parameters (?t - tower)
        :precondition (and 
            (not (tower_completed ?t))
            (< (bricks_on_level ?t) 4)
            )
        :effect (and
            (increase (bricks_on_level ?t) 1)
        )
    )
    
    (:action install_plane
        :parameters (?t - tower)
        :precondition (and
            (not (tower_completed ?t))
            (= (bricks_on_level ?t) 4)
            (< (levels_built ?t) 3)
        )
        :effect (and
            (increase (levels_built ?t) 1)
            (assign (bricks_on_level ?t) 0)
        )
    )
    
    (:action install_cone
        :parameters (?t - tower)
        :precondition (and
            (not (tower_completed ?t))
            (= (tower_levels ?t) 3)
            (= (bricks_on_level ?t) 4)
        )
        :effect (and 
            (tower_completed ?t)
        )
    )
    
    (:action start_complete_tower
        :parameters (?t - tower)
        :precondition (and 
            (not (tower_completed ?t))
            (>= (free_agents) 2)
        )
        :effect (and
            (start_tower_completed ?t)
            (decrease (free_agents) 2)
        )
    )
    
    (:action end_complete_tower
        :parameters (?t - tower)
        :precondition (and (start_tower_completed ?t))
        :effect (and
            (tower_completed ?t)
            (increase (free_agents) 2)
        )
    )

)