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

        ; One predicate given for free!
        (hero-at ?loc - location)
        ; (hero-through ?cor - corridor)

        (key-at ?loc - location ?col - colour)
        ; key location according to the map + colour of the key
        (key-colour ?loc - location ?col - colour)

        (locked-corr ?corr - corridor ?col - colour)

        (is-risky ?cor - corridor)  ; is the corridor risky?

        (is-collapsed ?cor - corridor)  ; is the corridor collapsed?

        (is-messy ?loc - location)  ; is the room at location messy?

        (hero-holding ?k - key)             ; currently held key?
        ; in lists - holding
        (corr ?from ?to - location)         ; corridor exists between 2 locations 
        ; (looks like 'exists' is a keyword)
        ; IMPLEMENT ME

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

        :precondition (and  (hero-at ?from)
                            (corr ?from ?to)
                            ; add door isn't locked
        )

        :effect (and  (not (hero-at ?from))
                      (hero-at ?to)
                      (when (is-risky ?cor)
                      (and
                         (is-collapsed ?cor)
                         (is-messy ?to))
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

            ; IMPLEMENT ME

        )

        :effect (and

            ; IMPLEMENT ME

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
