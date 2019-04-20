(define (domain constructor)
    (:requirements :typing :strips :fluents)
    (:types agent location stick plane cone tower)
  
    (:functions
        (tower_levels ?t - tower) - number
        (bricks_on_level ?t - tower) - number
        (free_agents) - number
        (bricks_left) - number
        (planes_left) - number
        (cones_left) - number
        (levels_built ?t - tower) - number
    )
    (:predicates
	    (at ?a - agent ?x - location ?y - location ?z - location)
	    (available ?a - agent)
	    (tower_completed ?t - tower)
	    (has-switch ?s - switch ?x - location ?y - location ?z - location)
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

)