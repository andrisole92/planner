(define (problem ppp) 
    (:domain constructor)
    (:objects
	    t1 - tower
	    t2 - tower
    )
    (:init
        (= (bricks_on_level t1) 0)
        (= (bricks_on_level t2) 0)
        (= (tower_levels t1) 0)
        (= (tower_levels t2) 0)
        (= (levels_built t1) 0)
        (= (levels_built t2) 0)
	    (= (free_agents) 4)
        (= (bricks_left) 12)
        (= (planes_left) 12)
        (= (cones_left) 1)

        (not (tower_completed t1))
        (not (tower_completed t2))
    )
    (:goal (and
	        (not (tower_completed t1))
	        (not (tower_completed t2))
        )   
    )
)