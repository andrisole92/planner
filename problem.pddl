(define (problem BLOCKS-4-1)
    (:domain BLOCKS)
    (:objects E - tower)
    (:init 
        (tower_complete E)
        (= (tower-cost E) 10)
    )
    (:goal 
        (AND 
            (>= (tower-cost E) 80)
        )
    )
)