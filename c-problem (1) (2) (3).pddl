(define (problem ppp) 
    (:domain constructor)
    (:objects
	    t1 - tower
	    t2 - tower
	    carry_things - capability
	    weld_things - capability
	    cry - capability
    )
    (:init
        (= (bricks_on_level t1) 0)
        (= (bricks_on_level t2) 0)
        (= (tower_levels t1) 0)
        (= (tower_levels t2) 0)
        (= (levels_built t1) 0)
        (= (levels_built t2) 0)
	    (= (free_agents) 1)
        (= (bricks_left) 12)
        (= (planes_left) 12)
        (= (cones_left) 1)
    )
    (:goal (and
	            (tower_completed t1)
	            (tower_completed t2)
        )   
    )
)