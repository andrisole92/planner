(define (problem BLOCKS-4-1)
    (:domain BLOCKS)
    (:objects A C D B E)
    (:init 
        (CLEAR B)
        (ONTABLE D)
        (ON B C)
        (ON C A)
        (ON A D)
        (HANDEMPTY)
        (tower_complete E)
        (= (tower-cost E) 10)
    )
    (:goal 
        (AND 
            (>= (tower-cost E) 20)
        )
    )
)