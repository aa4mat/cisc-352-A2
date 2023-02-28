(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 loc-3-3 loc-2-4 loc-3-4 loc-4-4 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init
    ;  not (hero-holding key1)
    ;  not (hero-holding key2)
    ;  not (hero-holding key3)
    ;  not (hero-holding key4)
     

    ; Hero location and carrying status
    (hero-at loc-1-2)   ; start state
    ; initially not carrying any keys - any states 'unobserved' are considered false
    ; so no need to explicitly mention e.g. "not (hero-holding key1)", etc.

    ; (move-possible loc-3-1 loc--)
    ; (move-possible loc-1-2 loc--)   ; start state
    ; (move-possible loc-2-2 loc--)
    ; (move-possible loc-3-2 loc--)
    ; (move-possible loc-4-2 loc--)
    ; (move-possible loc-2-3 loc--)
    ; (move-possible loc-3-3 loc--)
    ; (move-possible loc-2-4 loc--)
    ; (move-possible loc-3-4 loc--)
    ; (move-possible loc-4-4 loc--)   ; all valid locations that the hero can be at

    ; Locationg <> Corridor Connections
    (corr loc-3-1 loc-3-2)
    (corr loc-1-2 loc-2-2)
    (corr loc-2-2 loc-3-2)
    (corr loc-3-2 loc-4-2)
    (corr loc-2-2 loc-2-3)
    (corr loc-3-2 loc-3-3)
    (corr loc-2-3 loc-3-3)
    (corr loc-2-3 loc-3-4)
    (corr loc-3-3 loc-3-4)
    (corr loc-2-4 loc-3-4)
    (corr loc-3-4 loc-4-4)

    ; Key locations
    (key-at loc-2-2)
    (key-at loc-2-4)
    (key-at loc-4-4)
    (key-at loc-2-4)

    ; Locked corridors
    (locked-corr c2324 red)
    (locked-corr c2434 red)
    (locked-corr c3444 yellow)
    (locked-corr c3242 purple)

    ; Risky corridors
    (is-risky c2324)
    (is-risky c2434)

    ; Key colours
    (key-colour loc-2-2 red)
    (key-colour loc-2-4 yellow)
    (key-colour loc-4-4 purple)
    (key-colour loc-2-4 rainbow)

    ; Key usage properties (one use, two use, etc)
    (key-usage red )
  )
  (:goal
    (and
      ; Hero's final location goes here
    )
  )

)
