(define (problem 4a_l3) (:domain constructor)
    (:objects
	    t1 - tower
    )
    (:init
        (= (tower_levels t1) 0)
	    (= (free_agents) 4)
        (= (bricks_left) 12)
        (= (planes_left) 12)
        (= (cones_left) 1)
        (= (levels_built) 0)
    )
    (:goal (and
	        (= (free_agents) 4)
	        (= (levels_built) 3)
	        (= (tower_levels t1) 3)
	        (completed t1)
        )   
    )
)