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
        
        ; Hero related:

        ; Indicates hero's location
        (hero-at ?loc - location)

        ; Indicates checking the hero's arm is carrying a key or not
        (is-carry ?k - key)

        ; Indicates checking the hero's arm is free or not
        (is-free ?k - key)
        
        ;-----------------------------------------------------------------
        
        ; Room related:
        
        ; Indicates the room is messy
        (messy ?loc - location)

        ; Indicates checking the room is messy or not
        (is-messy ?loc - location)
        
        ;-----------------------------------------------------------------
        
        ; Corridor related:
        
        ; Indicates there is a connection between room and corridor
        (connected ?loc - location ?cor - corridor)
        
        ; Indicates checking the corridor is locked or not
        (is-locked ?cor - corridor)
        
        ; Indicates the colour of the lock
        (lock-colour ?cor - corridor ?colour - colour)
        
        ; Indicates checking the corridor is riskly or not
        (is-risky ?cor - corridor)
        
        ; Indicates the corridor is collapsed or not
        (is-collapsed ?cor - corridor)
        
        ;-----------------------------------------------------------------
        
        ; Key related:

        ; Indicates a key's location
        (key-at ?k - key ?loc - location)

        ; Indicates the colour of the key
        (key-colour ?k - key ?colour - colour)
        
        ; Indicates the key can't use anymore
        (cant-use ?k - key)

        ; Indicates the key have one use
        (one-use ?k - key)

        ; Indicates the key have two use
        (two-use ?k - key)

        ; Indicates the key have multiple use
        (multiple-use ?k - key)
        
        ; Indicates a lock is in the corridor
        ;(lock-at ?cor - corridor)
        
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
                        
            (hero-at ?from)
            (connected ?from ?cor)
            (connected ?to ?cor)
            (not (is-locked ?cor))

        )

        :effect (and
                
                (hero-at ?to)
                (not (hero-at ?from))
                (when (is-risky ?cor)
                    (and
                        (is-collapsed ?cor)
                        (is-messy ?to)
                    )
                )
                
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

            (hero-at ?loc)
            (key-at ?k ?loc)
            (is-free ?k)
            (not (is-messy ?loc))

        )

        :effect (and

            (is-carry ?k)
            (not (is-free ?k))

        )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and

            ; IMPLEMENT ME

        )

        :effect (and

            ; IMPLEMENT ME

        )
    )


    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left,
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and

            ; IMPLEMENT ME

        )

        :effect (and

            ; IMPLEMENT ME

        )
    )

    ;Hero can clean a location if
    ;    - the hero is at location ?loc,
    ;    - the location is messy
    ;Effect will be that the location is no longer messy
    (:action clean

        :parameters (?loc - location)

        :precondition (and

            ; IMPLEMENT ME

        )

        :effect (and

            ; IMPLEMENT ME

        )
    )

)
