(define (problem BLOCKS-4-1)
    (:domain BLOCKS)
    (:objects A C D B E)
    (:init 
        (= (tower-cost E) 10)
    )
    (:goal 
        (AND 
            (>= (tower-cost E) 20)
        )
    )
)