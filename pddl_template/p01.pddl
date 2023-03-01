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

    ; Hero location and carrying status
    (hero-at loc-1-2)

    ; Locationg <> Corridor Connections
    (connected loc-3-1 c3132)
    (connected loc-3-2 c3132)

    (connected loc-1-2 c1222)
    (connected loc-2-2 c1222)

    
    (connected loc-2-2 c2232)
    (connected loc-3-2 c2232)

    (connected loc-3-2 c3242)
    (connected loc-4-2 c3242)

    (connected loc-2-2 c2223)
    (connected loc-2-3 c2223)

    (connected loc-3-2 c3233)
    (connected loc-3-3 c3233)

    (connected loc-2-3 c2333)
    (connected loc-3-3 c2333)

    (connected loc-2-3 c2324)
    (connected loc-2-4 c2324)

    (connected loc-3-3 c3334)
    (connected loc-3-4 c3334)
     
    (connected loc-2-4 c2434)
    (connected loc-3-4 c2434)
    
    (connected loc-3-3 c3444)
    (connected loc-4-4 c3444)

    ; Key locations
    (keyloc key1 loc-2-2)
    (keyloc key2 loc-2-4)
    (keyloc key3 loc-4-2)
    (keyloc key4 loc-4-4)

    ; Locked corridors

    (is-locked c3132)
    (is-locked c2324)
    (is-locked c2434)
    (is-locked c3444)
    (is-locked c3242)

    (lockedcolor c3132 rainbow)
    (lockedcolor c2324 red)
    (lockedcolor c2434 red )
    (lockedcolor c3444 yellow)
    (lockedcolor c3242 purple)

    ; Risky corridors
    (is-risky c2324)
    (is-risky c2434)
    
    ; Key colours
    (key-color key1 red)
    (key-color key2 yellow)
    (key-color key3 rainbow)
    (key-color key4 purple)

    ; Key usage properties (one use, two use, etc)
    (multiple-use key1)
    (two-use key2)
    (one-use key3)
    (one-use key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-3-1)
    )
  )

)
