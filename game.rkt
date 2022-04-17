#lang racket

(require "cardsSet.rkt") ; Se importa el TDA cardsSet a game.

; _______________________ PARÁMETROS _______________________________

; Descripción de los parámetros a recibir en la función constructor.
; numPlayers: Entero que señala la cantidad de jugadores. 
; cardsSet: Conjunto válido de cartas.
; mode: Función que permite determinar la modalidad de juego.
; createRandom: Función que permite determinar un número aleatóreo.

; _______________________ CONSTRUCTOR _______________________________

; Función a partir de la cual se crea e inicializa un tablero a partir de los parámetros de entrada.
; Dominio: numPlayers(int) X cardsSet X mode (fn) X rndFn (fn)
; Recorrido: game -> Corresponde a la estructura que alberga el área de juego, las piezas disponibles, jugadores
; registrados, sus ;; cartas y el estado del juego, entre otros elementos
; Ejemplo de Uso: (define game1 (game 4 (cardsSet (list 1 2 3) 5 5 randomFn) stackMode randomFn))
(define game
  (lambda(numPlayers cardsSet mode randomFn)
    (cond
      [(isGame? numPlayers cardsSet mode randomFn) 
       (list cardsSet cardsSet '() 0 mode randomFn)]
      [else null]))) ; null retorna una lista vacia, es lo mismo que '() o (list).

; Función de pertenenecia para game, valida que game sea precisamente, un game.
; Dominio: game (game)
; Recorrido: boolean
(define isGame?
  (lambda (numPlayers cardsSet mode randomFn)
    (cond
      [(and (integer? numPlayers) mode randomFn)
       #t]
      [else #f])))

; _______________________ SELECTORES _______________________________
; Función selectora que obtiene la baraja inicial
; Dominio: game (game)
; Recorrido: integer
(define getCardsSet
  (lambda(game)
    (car game)
    ))

; Función selectora que obtiene la baraja modificada
; Dominio: game (game)
; Recorrido: list
(define getCardsLeft
  (lambda(game)
    (car (cdr game)
    )))

; Función selectora que obtiene la lista de jugadores
; Dominio: game (game)
; Recorrido: list
(define getPlayers
  (lambda(game)
    (car (cdr (cdr game)
    ))))


; Función selectora que obtiene el número de jugadores
; Dominio: game (game)
; Recorrido: integer
(define getNumPlayers
  (lambda(game)
    (car (cdr (cdr (cdr game)
    )))))

; Función selectora que obtiene el modo de juego
; Dominio: game (game)
; Recorrido: mode
(define getModeGame
  (lambda(game)
    (car (cdr (cdr (cdr (cdr game)
    ))))))

; Función selectora que obtiene un número aleatoreo
; Dominio: game (game)
; Recorrido: integer
(define getRandomFn
  (lambda(game)
    (car (cdr (cdr (cdr (cdr (cdr game)
    )))))))
; _______________________ MODIFICADORES _______________________________



; Función modificadora que entrega una nueva lista con el cardsSet modificado.
; Dominio: game X newCardsSet
; Recorrido: game (list)
(define setCardsSet
  (lambda(game newCardsSet)
     (list newCardsSet (getCardsLeft game) (getPlayers game)(getNumPlayers game)(getModeGame game) (getRandomFn game))
    ))

; Función modificadora que entrega una nueva lista con la baraja de juego modificada.
; Dominio: game X newCardsSet
; Recorrido: game (list)
(define setCardsLeft
    (lambda(game newCardsLeft)
      (list (getCardsSet game) newCardsLeft (getPlayers game)(getNumPlayers game)(getModeGame game) (getRandomFn game))
      ))


; Función mutuadora que entrega una nueva lista con los nuevos jugadores modificados.
; Dominio: game X newPlayers
; Recorrido: game (list)
(define setPlayers
  (lambda(game newPlayers)
     (list (getCardsSet game) (getCardsLeft game) newPlayers (getNumPlayers game) (getModeGame game) (getRandomFn game))
    ))

; Función mutuadora que entrega una nueva lista con el número de jugadores modificado.
; Dominio: game X newNumPlayers
; Recorrido: game (list)
(define setNumPlayers
  (lambda(game newNumPlayers)
     (list (getCardsSet game) (getCardsLeft game) (getPlayers game)newNumPlayers (getModeGame game) (getRandomFn game))))


; Función modificadora que entrega una nueva lista con el modo de juego modificado.
; Dominio: game X newMode
; Recorrido: game (list)
(define setMode
  (lambda(game newMode)
     (list (getCardsSet game) (getCardsLeft game) (getPlayers game)(getNumPlayers game) newMode (getRandomFn game))))

; Función modificadora que entrega una nueva lista con el número aleatoreo modificado.
; Dominio: game X newRandom
; Recorrido: game (list)
(define setRandom
  (lambda(game newRandom)
     (list (getCardsSet game) (getCardsLeft game) (getPlayers game)(getNumPlayers game)(getModeGame game) newRandom)))

; _______________________ FUNCIONALIDADES _______________________________

; Función que permite retirar y voltear las dos cartas superiores del stack de cartas en el
; juego y las dispone en el área de juego.
; Dominio: cardsSet
; Recorrido: cardsSet
; Ejemplo de Uso: uso interno de la función como parte del constructor
; game (game 4 (cardsSet (list 1 2 3) 5 5 randomFn) stackMode randomFn)
(define stackMode
  (lambda(cardsSet)
    (reverse cardsSet)
    (append (list(car (reverse cardsSet)) (list(cadr (reverse cardsSet)))))
    (setCardsLeft (append (list(car (reverse cardsSet)) (list(cadr (reverse cardsSet))))) game)
    ))

; Función para registrar a un jugador en un juego. Los jugadores tienen un nombre único y no puede
; exceder la cantidad de jugadores registrados.
; Dominio: string, game
; Recorrido: game
; Ejemplo de Uso: (register “user1” (game 4 (cardsSet (list 1 2 3) 5 5 randomFn) 5 5 randomFn) stackMode randomFn))
(define register
  (lambda(user game)
    (cons user game)
    (setPlayers (user game))
    (setNumPlayers (+ (getNumPlayers game) 1)
    )))

; Función que retorna el usuario a quién le corresponde jugar en el turno.
; Dominio: game
; Recorrido: string
; Ejemplo de Uso: (whoseTurnIsIt? (game 4 (cardsSet (list 1 2 3) 5 5 randomFn) stackMode randomFn))
(define whoseTurnIsIt?
  (lambda(game)
    (null)
    ))

; Función que permite realizar una jugada a partir de la acción especificadas por la función currificada action.
; Las jugadas parten sin una acción especificada, lo que activa internamente el uso de la función stackMode para
; el trabajo sobre las cartas.
; Dominio: game, action
; Recorrido: game
; Ejemplo de Uso: (define myGame (game 4 (cardsSet (list 1 2 3) 5 5 randomFn) stackMode randomFn))
; (play mGame null randomFn)
; (play mGame pass randomFn)
; (play mGame (spotIt “A”) randomFn)
; (play mGame finish randomFn)
(define play
  (lambda(game action)
    (null)))

; Función que retorna el estado actual del juego
; Dominio: game
; Recorrido: string
; Ejemplo de Uso: (status (game 4 (cardsSet (list 1 2 3) 5 5 randomFn) stackMode randomFn))
(define status
  (lambda(game)
    (null)))

; Función que retorna el puntaje de un jugador a partir de su nombre de usuario.
; Dominio: game
; Recorrido: integer
; Ejemplo de Uso: (score (game 4 (cardsSet (list 1 2 3) 5 5 randomFn) stackMode randomFn) “user3”)
(define score
  (lambda(game)
    (null)))

; Función que convierte un juego/partida a una representación basada en strings que posteriormente pueda
; visualizarse a través de la función display.
; Domino: game
; Recorrido: string
; Ejemplo de Uso: (game->string (game 4 (cardsSet (list 1 2 3) 5 5 randomFn) stackMode randomFn))

(define game->string
  (lambda(game)
    (displayln "--------------")
    (displayln "Dobble Game")
    (displayln "--------------")
    (stringsGame game)))

(define stringsGame
  (lambda(game)
    (cond [(null? game)
        (displayln "--------------")]
    [else (displayln (car game))
    (stringsGame (cdr game))])))


; Función que permite agregar cartas a un set de manera manual procurando verificar que las cartas
; incorporadas no violan las restricciones de un set válido, aunque incompleto. Por tanto, no pueden ocurrir
; situaciones como que dos cartas en el set tienen más de una figura en común. Si una violación ocurre, se devuelve
; el conjunto de entrada.
; Dominio: cardSet card
; Recorrido: cardSet
; Ejemplo de Uso: (addCard
; (addCard
; (addCard emptyCardsSet (card “A” “B”))
; (card “B” “C”))
; (card “A” “C”))
(define addCard
  (lambda(cardsSet card)
    (cons card cardsSet)))

; Función que permite retirar y voltear la carta en el tope del stack y una de las cartas del usuario seleccionada
; de manera aleatoria a partir de la función de aleatorización registrada en el juego.
; Al terminar un turno, si el jugador acierta se ubican en la base del stack, de lo contrario
; la carta del jugador vuelva a sus cartas y la del stack vuelve a la base de éste.
; Dominio: cardsSet
; Recorrido: cardsSet
; Ejemplo de Uso: uso interno de la función como parte del constructor game
; Ejemplo 1: (game 4 (cardsSet (list 1 2 3) 5 5 randomFn) (emptyHandsStackMode (cardsSet (list 1 2 3) 5 5 randomFn)) randomFn)
; Ejemplo 2: (emptyHandsStackMode (cardsSet (list 1 2 3) 5 5 randomFn))
(define emptyHandsStackMode
  (lambda(cardsSet)
    (reverse cardsSet)
    (cons (car (reverse cardsSet)) (list(nthCard cardsSet (randomFn 0 (length cardsSet)))))))
                                                   
; _______________________ MODO DE JUEGO PROPIO _______________________________


; Crea tu propia modalidad de juego sin romper las reglas generales del juego y sin afectar los
; dominios y recorridos de las funciones base. En concreto, debe se tratada igual que la función
; stackMode y emptyHandsMode.

; Modo de juego reverseStackMode: Toma las dos primeras cartas del mazo. Modo de juego
; Similar al modo stackMode. stackMode toma las primeras dos cartas del tope y las da vuelta
; reverseStackMode hace lo contrario y toma las dos primeras cartas del mazo y las da vuelta.
; Dominio: cardsSet
; Recorrido: cardsSet
; Ejemplo de Uso: uso interno de la función como parte del constructor game
; (game 4 (cardsSet (list 1 2 3) 5 5 randomFn) reverseStackMode randomFn)
(define reverseStackMode
  (lambda(cardsSet)
    (reverse cardsSet)
    (append (list(car (cardsSet)) (list(cadr (cardsSet)))))))