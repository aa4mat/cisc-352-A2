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
        
        ; Indicates a room
        (room ?loc - location)
        
        ; Indicates a corridor
        (corridor ?loc-1 ?loc-2 - location)

        ; Indicates the corridor's location
        (corridor-at ?cor - corridor)
        
        ; Indicates checking the corridor is between hero's location and the 
        ; ohter room or not
        
        ; Indicates a lock is in the corridor
        (lock-at ?cor - corridor)
        
        ; Indicates checking the corridor is locked or not
        (is-lock ?cor - corridor)
        
        ; Indicates checking the corridor is riskly or not
        (is-risky ?cor - corridor)
        
        ; Indicates a key
        (key ?k - key)
        
        ; Indicates a key's location
        (key-at ?k - key ?loc - location)
        
        ; Indicates checking the key is at the location or not
        (is-key-loc ?k - key ?loc - location)
        
        ; Indicates the hero's arm is free
        (free ?k - key)

        ; Indicates checking the hero's arm is free or not
        (is-free ?k - key)
        
        ; Indicates the hero is carrying a key
        (carry ?k - key)

        ; Indicates checking the hero's arm is carrying a key or not
        (is-carry ?k - key)

        ; Indicates the location is messy
        (messy ?loc - location)
        
        ; Indicates checking the location is messy or not
        (is-messy ?loc - location)
        
        ; Indicates key usage
        ;(key-usage ?k - key ?col - colour ?u - usage)
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
    
    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;    - the location is not messy
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and

            ; Indicates hero at ?loc
            (hero-at ?loc)
            
            ; Indicates checking ?k at ?loc or not
            (is-key-loc ?k ?loc)

            ; Indicates hero's arm is free
            (is-free ?k)

            ; Indicates checking ?loc is messy or not
            (is-messy ?loc)
            ; if ?loc is messy, can't pick up the key
            
            ; else pick up the key
            ; which is in :effect below

        )

        :effect (and

            ; Indicates the key is picked up
            ; (not (key-at ?k ?loc))
            
            ; Indicates the hero is carrying the key
            (carry ?k)
            
            ; Indicates the hero's arm is not free
            (not (free ?k))

        )
    )
)
