(define (problem BLOCKS-4-1)
    (:domain BLOCKS)
    (:objects E - tower)
    (:init 
        (tower_not_complete E)
        (= (bricks_on_level E) 0)
        (= (levels_on_tower E) 0)
        (= (tower-cost E) 10)
        (= (free_agents) 10)
    )
    (:goal 
        (and 
            ; (tower_complete ?t)
            (>= (tower-cost E) 12)
            (= (free_agents) 10)
            ; (= (levels_on_tower ?t) 1)
        )
    )
)