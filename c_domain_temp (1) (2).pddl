(define (domain constructor)
    (:requirements :typing :strips :fluents :durative-actions)
    (:types agent location stick plane cone tower)
  
    (:functions
        (tower_levels ?t - tower) - number
        (tower_completed ?t - tower) - number
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
	    (complete ?t - tower)
	    (has-switch ?s - switch ?x - location ?y - location ?z - location)
    )
    (:durative-action install_brick
        :parameters (?t - tower)
        :duration (= ?duration #1)
        :condition (at start (and 
            (not (tower_completed ?t))
            (< (bricks_on_level ?t) 4)
            ))
        :effect (at end (and
            (increase (bricks_on_level ?t) 1)
        ))
    )
    
    (:durative-action install_brick
        :parameters (?t - tower)
        :duration (= ?duration #1)
        :condition (at start (and 
            (not (tower_completed ?t))
            (< (bricks_on_level ?t) 4)
            ))
        :effect (at end (and
            (increase (bricks_on_level ?t) 1)
        ))
    )
    
    (:durative-action install_plane
        :parameters (?t - tower)
        :duration (= ?duration #1)
        :condition (at start (and
            (not (tower_completed ?t))
            (= (bricks_on_level ?t) 4)
            (< (levels_built ?t) 3)
        ))
        :effect (at end (and
            (increase (levels_built ?t) 1)
            (assign (bricks_on_level ?t) 0)
        ))
    )
    
    (:durative-action install_cone
        :parameters (?t - tower)
        :duration (= ?duration #1)
        :condition (at start (and
            (not (tower_completed ?t))
            (= (tower_levels ?t) 3)
            (= (bricks_on_level ?t) 4)
        ))
        :effect (at end (and 
            (tower_completed ?t)
        ))
    )

)