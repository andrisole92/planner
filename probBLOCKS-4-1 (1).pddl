(define (problem BLOCKS-4-1)
    (:domain BLOCKS)
    (:objects A C D B E)
    (:INIT 
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
    (ON D C)
    (ON C A)
    (ON A B)
    (>= (tower-cost E) 20)
    
    
    ))
)