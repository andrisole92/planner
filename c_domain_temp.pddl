(define (domain constructor)
    (:requirements :typing :strips :fluents :durative-actions)
    (:types agent location stick plane cone tower)
  
    (:functions
        (tower_levels ?t - tower) - number
        (free_agents) - number
        (bricks_left) - number
        (planes_left) - number
        (cones_left) - number
        (levels_built) - number
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
        :condition (at start (and (not (completed ?t))))
        :effect (at end )
    )
    
    (:durative-action install_plane
        :parameters (?t - tower)
        :duration (= ?duration #1)
        :condition (at start (and (not (completed ?t))))
        :effect (at end )
    )
    
    (:durative-action install_cone
        :parameters (?t - tower)
        :duration (= ?duration #1)
        :condition (at start (and (not (completed ?t))))
        :effect (at end (and (completed ?t)))
    )

)