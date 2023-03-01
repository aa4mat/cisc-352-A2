(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-2)
    (is-free)

    ; Locationg <> Corridor Connections
    (is-corridor loc-1-2 loc-2-2)
    (is-corridor loc-2-2 loc-1-2)

    (is-corridor loc-2-1 loc-2-2)
    (is-corridor loc-2-2 loc-2-1)

    (is-corridor loc-2-2 loc-2-3)
    (is-corridor loc-2-3 loc-2-2)

    (is-corridor loc-3-2 loc-4-2)
    (is-corridor loc-4-2 loc-3-2)

    (connected loc-1-2 c1222)
    (connected loc-2-2 c1222)

    (connected loc-2-1 c2122)
    (connected loc-2-2 c2122)

    (connected loc-2-2 c2223)
    (connected loc-2-3 c2223)

    (connected loc-2-2 c2232)
    (connected loc-3-2 c2232)

    (connected loc-3-2 c3242)
    (connected loc-4-2 c3242)


    ; Key locations
    (key-at key1 loc-1-2)
    (key-at key2 loc-2-1)
    (key-at key3 loc-2-2)
    (key-at key4 loc-2-3)


    ; Locked corridors
    
    (is-locked c1222)
    (is-locked c2122)
    (is-locked c2223)
    (is-locked c2232)
    (is-locked c3242)

    (lock-colour c1222 yellow)
    (lock-colour c2122 purple)
    (lock-colour c2223 yellow)
    (lock-colour c2232 green)
    (lock-colour c3242 rainbow)

    ; Risky corridors

    ; Key colours
    (key-colour key1 green)
    (key-colour key2 rainbow)
    (key-colour key3 purple)
    (key-colour key4 yellow)

    ; Key usage properties (one use, two use, etc)
    (one-use key1)
    (one-use key2)
    (one-use key3)
    (two-use key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-2)
    )
  )

)
