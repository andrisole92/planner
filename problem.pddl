(define (problem BLOCKS-4-1)
    (:domain BLOCKS)
    (:objects E - tower)
    (:init 
        (tower_not_complete E)
        (= (bricks_on_level E) 0)
        (= (tower-cost E) 10)
        (= (free_agents) 10)
    )
    (:goal 
        (and 
            (>= (tower-cost E) 12)
            (= (free_agents) 10)
        )
    )
)