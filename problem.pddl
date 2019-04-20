(define (problem BLOCKS-4-1)
    (:domain BLOCKS)
    (:objects E - tower)
    (:init 
        (tower_not_complete E)
        (= (tower-cost E) 10)
    )
    (:goal 
        (and 
            (>= (tower-cost E) 80)
        )
    )
)