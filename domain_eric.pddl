(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates

        ; Indicates hero's location
        (hero-at ?loc - location)
        
        ; Indicates a corridor
        (corridor ?loc-1 ?loc-2 - location)

        ; Indicates the corridor's location
        (corridor-at ?cor - corridor)
        
        ; Indicates check the corridor is between current location or not
        
        ; Indicates a lock in corridor
        (lock-at ?cor - corridor)
        
        ; Indicates checking the corridor is lock or not
        (is-lock ?cor - corridor)
        
        ; Indicates checking the corridor is riskly or not
        (is-risky ?cor - corridor)  ; is the corridor risky?
        
        ; Indicates a key, its location and colour
        ;(key-at ?k - key ?loc - location ?col - colour)
        
        ; key location according to the map + colour of the key
        ;(key-colour ?loc - location ?col - colour)

    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - hero will move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky" (also causing a mess in the ?to location)
    (:action move

        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and
            
            ; Indicates hero at ?from
            (hero-at ?from)
            
            ; Indicates corridor between ?from and ?to
            (corridor ?from ?to)
            
            ; Indicates corridor at ?cor
            (corridor-at ?cor - corridor)
            
            ; Indicates checking ?cor exists between ?from and ?to
            
            
            ; Indicates checking is lock in ?cor
            (is-lock ?cor - corridor)
            ; if there is a locked door change ?to to another location
            ; whcih I'm not sure can be done or not
            ; maybe need to restart :action move
            
            ; else move to ?to
            ; which is in :effect below
            
        )

        :effect (and
            
            ; Indicates hero at location ?to
            (hero-at ?to)
            
            ; Indicates hero not at location ?from
            (not (hero-at ?from))
            
            ; Indicates checking the corridor is riskly or not
            ; if not riskly move on
            
        )
    )
)
