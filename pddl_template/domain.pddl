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

        ;Room and key:
        
        ;The connection between room and corridor
        (connected ?loc - location ?cor - corridor)

        ;The key at ?loc location
        (key-at ?k - key ?loc - location)

        ; Indicates the location is messy
        (messy ?loc - location)

        ; Indicates checking the location is messy or not
        (is-messy ?loc - location)

        ; is the corridor locked?
        (is-locked ?cor - corridor)

        ; Lock Locked and lock colour
        (lock-colour ?cor - corridor ?colour - colour)

        ; is the corridor risky?
        (is-risky ?cor - corridor)

        ; is the corridor collapsed?
        (is-collapsed ?cor - corridor)

        ; Key colour
        (key-colour ?k - key ?colour - colour)

        ;key can't use
        (cant-use ?k - key)

        ; One use
        (one-use ?k - key)

        ; two use left
        (two-use ?k - key)

        ; multiple use
        (multiple-use ?k - key)

        ;-----------------------------------------------------------------

        ;hero itself :

        ; Indicates hero's location
        (hero-at ?loc - location)

        ; Indicates checking the hero's arm is carrying a key or not
        (is-carry ?k - key)

        ; Indicates checking the hero's arm is free or not
        (is-free ?k - key)

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
                            (connected ?from ?cor)
                            (connected ?to ?cor)
                            (not (is-locked ?cor))

            ; IMPLEMENT ME

        )

        :effect (and    (not (hero-at ?from))
                        (hero-at ?to)
                        (when (is-risky ?cor)
                        (and
                          (is-collapsed ?cor)
                          (is-messy ?to)))

            ; IMPLEMENT ME

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
            (hero-at ?loc)
            (is-carry ?k)

            ; The hero can unlock the lock
            (connected ?loc ?cor)
            (is-locked ?cor)
            (not (cant-use ?k))

            ; Color of the key and the lock are same
            (key-colour ?k ?col)
            (lock-colour ?cor ?col)

        )

        :effect (and

            ; IMPLEMENT ME
            (not (is-locked ?cor))

            (when (one-use ?k)
                (and
                    ; Update usage number of the key
                    (not (one-use ?k))
                    (cant-use ?k)
                )
            )
            (when (two-use ?k)
                (and
                    (not (two-use ?k))
                    (one-use ?k)
                )
            )

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
            (hero-at ?loc)
            (is-messy ?loc)

        )

        :effect (and

            ; IMPLEMENT ME
            (not(is-messy ?loc))

        )
    )

)
