(define (domain BLOCKS)
  (:requirements :strips :fluents :typing)
	(:predicates (on ?x ?y)
        (tower_complete ?t)
	       (ontable ?x)
	       (clear ?x)
	       (handempty)
	       (holding ?x)
	       
    )
    
(:functions
    (tower-cost ?t)
)

(:action inc
    :parameters (?t)
    :precondition (and (tower_complete ?t))
    :effect (and
        (increase (tower-cost ?t) 2)
    )
)
  (:action pick-up
	     :parameters (?x)
	     :precondition (and (clear ?x) (ontable ?x) (handempty))
	     :effect
	     (and (not (ontable ?x))
		   (not (clear ?x))
		   (not (handempty))
		   (holding ?x)))

  (:action put-down
	     :parameters (?x)
	     :precondition (holding ?x)
	     :effect
	     (and (not (holding ?x))
		   (clear ?x)
		   (handempty)
		   (ontable ?x)))
  (:action stack
	     :parameters (?x ?y)
	     :precondition (and (holding ?x) (clear ?y))
	     :effect
	     (and (not (holding ?x))
		   (not (clear ?y))
		   (clear ?x)
		   (handempty)
		   (on ?x ?y)))
  (:action unstack
	     :parameters (?x ?y)
	     :precondition (and (on ?x ?y) (clear ?x) (handempty))
	     :effect
	     (and (holding ?x)
		   (clear ?y)
		   (not (clear ?x))
		   (not (handempty))
		   (not (on ?x ?y))))
		   
		   
)
