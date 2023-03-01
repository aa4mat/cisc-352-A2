(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-1-1 loc-2-1 loc-3-1 loc-4-1 loc-1-2 loc-2-2 loc-1-3 loc-2-3 loc-3-3 - location
    c1121 c2131 c3141 c1112 c2122 c1222 c1213 c1323 c2333 - corridor
    key1 key2 key3 key4 key5 key6 key7 key8 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-3)
    (is-free)

    ; Existing corridors
    (is-corridor loc-1-1 loc-2-1)
    (is-corridor loc-2-1 loc-1-1)

    (is-corridor loc-2-1 loc-3-1)
    (is-corridor loc-3-1 loc-2-1)

    (is-corridor loc-3-1 loc-4-1)
    (is-corridor loc-4-1 loc-3-1)

    (is-corridor loc-1-1 loc-1-2)
    (is-corridor loc-1-2 loc-1-1)

    (is-corridor loc-2-1 loc-2-2)
    (is-corridor loc-2-2 loc-2-1)

    (is-corridor loc-1-2 loc-2-2)
    (is-corridor loc-2-2 loc-1-2)

    (is-corridor loc-1-2 loc-2-3)
    (is-corridor loc-2-3 loc-1-2)

    (is-corridor loc-1-3 loc-2-3)
    (is-corridor loc-2-3 loc-1-3)

    (is-corridor loc-2-3 loc-3-3)
    (is-corridor loc-3-3 loc-2-3)
    
    ; Locationg <> Corridor Connections
    (connected loc-1-1 c1121)
    (connected loc-2-1 c1121)

    (connected loc-2-1 c2131)
    (connected loc-3-1 c2131)
    
    (connected loc-3-1 c3141)
    (connected loc-4-1 c3141)

    (connected loc-1-2 c1112)
    (connected loc-1-1 c1112)

    (connected loc-2-1 c2122)
    (connected loc-2-2 c2122)

    (connected loc-1-2 c1222)
    (connected loc-2-2 c1222)

    (connected loc-1-2 c1213)
    (connected loc-1-3 c1213)

    (connected loc-1-3 c1323)
    (connected loc-2-3 c1323)

    (connected loc-2-3 c2333)
    (connected loc-3-3 c2333)

    ; Key locations
    (key-at key1 green)
    (key-at key2 green)
    (key-at key3 purple)
    (key-at key4 yellow)
    (key-at key5 purple)
    (key-at key6 green)
    (key-at key7 red)
    (key-at key8 rainbow)

    ; Locked corridors
    (is-locked c1121)
    (is-locked c2131)
    (is-locked c3141)
    (is-locked c1112)
    (is-locked c1222)
    (is-locked c1213)
    (is-locked c1323)
    (is-locked c2333)

    ; Colour of the locks and locations
    (is-locked c1121 yellow)
    (is-locked c2131 green)
    (is-locked c3141 rainbow) 
    (is-locked c1112 green)
    (is-locked c1222 red)
    (is-locked c1213 green) 
    (is-locked c1323 purple)
    (is-locked c2333 purple)

    ; Risky corridors
    (is-risky c1222)

    ; Key colours
    (key-colour key1 green)
    (key-colour key2 green)
    (key-colour key3 purple)
    (key-colour key4 yellow)
    (key-colour key5 purple)
    (key-colour key6 green)
    (key-colour key7 red)
    (key-colour key8 rainbow)

    ; Key usage properties (one use, two use, etc)
    (multiple-use key7)
    (two-use key4)
    (one-use key1)
    (one-use key2)
    (one-use key3)
    (one-use key5)
    (one-use key6)
    (one-use key8)
  )

  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-1)
    )
  )

)
