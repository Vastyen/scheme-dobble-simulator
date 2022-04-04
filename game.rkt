#lang racket

(require "cardsSet.rkt")

;; _______________________ PARÁMETROS _______________________________

;; Descripción de los parámetros a recibir en la función constructor.
;; numPlayers: Entero que señala la cantidad de jugadores. 
;; cardsSet: Conjunto válido de cartas.
;; mode: Función que permite determinar la modalidad de juego.
;; createRandom: Función que permite determinar un número aleatóreo.

;; _______________________ CONSTRUCTOR _______________________________


;; Función a partir de la cual se crea e inicializa un tablero a partir de los parámetros de entrada.
;; Dominio: numPlayers(int) X cardsSet X mode (fn) X rndFn (fn)
;; Recorrido: game -> Corresponde a la estructura que alberga el área de juego, las piezas disponibles, jugadores
;; registrados, sus ;; cartas y el estado del juego, entre otros elementos
;; Ejemplo de Uso: (define game1 (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
(define game
  (lambda(numPlayers cardsSet mode createRandom)
    (cond
      [(isGame? numPlayers cardsSet mode createRandom) 
       (list numPlayers cardsSet mode createRandom)]
      [else null]))) ; null retorna una lista vacia, es lo mismo que '() o (list).

;; Función de Pertenenecia para game, valida que game sea precisamente, un game.
;; Dominio: game (game)
;; Recorrido: boolean
(define isGame?
  (lambda (numPlayers cardsSet mode createRandom)
    (cond
      [(and (integer? numPlayers) (cardsSet? cardsSet) 
            mode createRandom)
       #t]
      [else #f])))

;; _______________________ SELECTORES _______________________________

;; Función selectora que obtiene el número de jugadores
;; Dominio: game (game)
;; Recorrido: integer
(define getNumPlayers
  (lambda(game)
    (car game)
    ))

;; Función selectora que obtiene el cardsSet
;; Dominio: game (game)
;; Recorrido: list
(define getCardsSet
  (lambda(game)
    (car (cdr game)
    )))

;; Función selectora que obtiene el modo de juego
;; Dominio: game (game)
;; Recorrido: list
(define getMode
  (lambda(game)
    (car (cdr (cdr game)
    ))))

;; Función selectora que obtiene el número random
;; Dominio: game (game)
;; Recorrido: integer
(define getRandom
  (lambda(game)
    (car (cdr (cdr (cdr game)
    )))))

;; _______________________ MUTUADORES _______________________________


;; Función mutuadora que entrega una nueva lista con el número de jugadores modificado.
;; Dominio: game X newNumPlayers
;; Recorrido: game (list)
(define setNumPlayers
  (lambda(game newNumPlayers)
     (list newNumPlayers (getCardsSet game) (getMode game) (getRandom game))
     ))

;; Función mutuadora que entrega una nueva lista con el cardsSet modificado.
;; Dominio: game X newCardsSet
;; Recorrido: game (list)
(define setCardsSet
  (lambda(game newCardsSet)
     (list (getNumPlayers game) newCardsSet (getMode game) (getRandom game))
     ))

;; Función mutuadora que entrega una nueva lista con el modo de juego modificado.
;; Dominio: game X newMode
;; Recorrido: game (list)
(define setMode
  (lambda(game newMode)
     (list (getNumPlayers game) (getCardsSet game) newMode (getRandom game))
     ))

;; Función mutuadora que entrega una nueva lista con el número aleatoreo modificado.
;; Dominio: game X newRandom
;; Recorrido: game (list)
(define setRandom
  (lambda(game newRandom)
     (list (getNumPlayers game) (getCardsSet game) (getMode game) newMode)
     ))

;; _______________________ FUNCIONALIDADES _______________________________



;; Función que permite retirar y voltear las dos cartas superiores del stack de cartas en el
;; juego y las dispone en el área de juego.
;; Dominio: cardsSet
;; Recorrido: cardsSet
;; Ejemplo de Uso: uso interno de la función como parte del constructor
;; game (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn)
(define stackMode
  (lambda(cardsSet)
    (null)
    ))

;; Función para registrar a un jugador en un juego. Los jugadores tienen un nombre único y no puede
;; exceder la cantidad de jugadores registrados.
;; Dominio: string, game
;; Recorrido: game
;; Ejemplo de Uso: (register “user1” (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
(define register
  (lambda(user game)
    (null)
    ))

;; Función que retorna el usuario a quién le corresponde jugar en el turno.
;; Dominio: game
;; Recorrido: string
;; Ejemplo de Uso: (whoseTurnIsIt? (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
(define whoseTurnIsIt?
  (lambda(game)
    (null)
    ))

;; Función que permite realizar una jugada a partir de la acción especificadas por la función currificada action.
;; Las jugadas parten sin una acción especificada, lo que activa internamente el uso de la función stackMode para
;; el trabajo sobre las cartas.
;; Dominio: game, action
;; Recorrido: game
;; Ejemplo de Uso: (define myGame (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
;; (play mGame null randomFn)
;; (play mGame pass randomFn)
;; (play mGame (spotIt “A”) randomFn)
;; (play mGame finish randomFn)
(define play
  (lambda(game action)
    (null)
    ))

;; Función que retorna el estado actual del juego
;; Dominio: game
;; Recorrido: string
;; Ejemplo de Uso: (status (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
(define status
  (lambda(game)
    (null)
    ))

;; Función que retorna el puntaje de un jugador a partir de su nombre de usuario.
;; Dominio: game
;; Recorrido: integer
;; Ejemplo de Uso: (score (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn) “user3”)
(define score
  (lambda(game)
    (null)
    ))

;; Función que convierte un juego/partida a una representación basada en strings que posteriormente pueda
;; visualizarse a través de la función display.
;; Domino: game
;; Recorrido: string
;; Ejemplo de Uso: (game->string (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
(define game->string
  (lambda(game)
    (null)
    ))

;; Función que permite agregar cartas a un set de manera manual procurando verificar que las cartas
;; incorporadas no violan las restricciones de un set válido, aunque incompleto. Por tanto, no pueden ocurrir
;; situaciones como que dos cartas en el set tienen más de una figura en común. Si una violación ocurre, se devuelve
;; el conjunto de entrada.
;; Dominio: cardSet card
;; Recorrido: cardSet
;; Ejemplo de Uso: (addCard
;; (addCard
;; (addCard emptyCardsSet (card “A” “B”))
;; (card “B” “C”))
;; (card “A” “C”))
(define addCard
  (lambda(cardsSet card)
    (null)
    ))

;; Función que permite retirar y voltear la carta en el tope del stack y una de las cartas del usuario seleccionada
;; de manera aleatoria a partir de la función de aleatorización registrada en el juego.
;; Al terminar un turno, si el jugador acierta se ubican en la base del stack, de lo contrario
;; la carta del jugador vuelva a sus cartas y la del stack vuelve a la base de éste.
;; Dominio: cardsSet
;; Recorrido: cardsSet
;; Ejemplo de Uso: uso interno de la función como parte del constructor game
;; (game 4 (cardsSet (list “A” “B” “C”)) emptyHandsStackMode randomFn)
(define empyHandsStackMode
  (lambda(cardsSet)
    (null)
    ))

;; Crea tu propia modalidad de juego sin romper las reglas generales del juego y sin afectar los
;; dominios y recorridos de las funciones base. En concreto, debe se tratada igual que la función
;; stackMode y emptyHandsMode.
;; Dominio: cardsSet
;; Recorrido: cardsSet
;; Ejemplo de Uso: uso interno de la función como parte del constructor game
;; (game 4 (cardsSet (list “A” “B” “C”)) myMode randomFn)
(define myMode
  (lambda(cardsSet)
    (null)
    ))