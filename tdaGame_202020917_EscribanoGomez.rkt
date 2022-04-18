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
; Tipo de recursión: No aplica.
; Ejemplo de uso: (define game551 (game 934991 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (define game332 (game 2334242 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (define game932 (game 93424349 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define game
  (lambda(numPlayers cardsSet mode randomFn)
    (cond
      [(isGame? numPlayers cardsSet mode randomFn) 
       (list cardsSet cardsSet '() 0 mode randomFn)]
      [else null])
    ))

; Función de pertenenecia para game, valida que game sea precisamente, un game.
; Dominio: game
; Recorrido: boolean
; Tipo de recursión: No aplica.
; Ejemplo de uso: (isGame? 934991 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (isGame? 2334242 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (isGame? 93424349 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define isGame?
  (lambda (numPlayers cardsSet mode randomFn)
    (cond
      [(and (integer? numPlayers) mode randomFn)
       #t]
      [else #f])
    ))

; _______________________ SELECTORES _______________________________
; Función selectora que obtiene la baraja inicial
; Dominio: game
; Recorrido: integer
; Tipo de recursión: No aplica.
; Ejemplo de uso: (getCardsSet (game 9991 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (getCardsSet (game 23242 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (getCardsSet (game 9342349 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define getCardsSet
  (lambda(game)
    (car game)
    ))

; Función selectora que obtiene la baraja modificada
; Dominio: game
; Recorrido: list
; Tipo de recursión: No aplica.
; Ejemplo de uso: (getCardsLeft (game 91035 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (getCardsLeft (game 225334 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (getCardsLeft (game 95549 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define getCardsLeft
  (lambda(game)
    (car (cdr game))
    ))

; Función selectora que obtiene la lista de jugadores
; Dominio: game
; Recorrido: list
; Tipo de recursión: No aplica.
; Ejemplo de uso: (getPlayers (game 1131 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (getPlayers (game 2502 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (getPlayers (game 1509 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define getPlayers
  (lambda(game)
    (car (cdr (cdr game)))
    ))

; Función selectora que obtiene el número de jugadores
; Dominio: game 
; Recorrido: integer
; Tipo de recursión: No aplica.
; Ejemplo de uso: (getNumPlayers (game 01 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (getNumPlayers (game 22 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (getNumPlayers (game 99 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define getNumPlayers
  (lambda(game)
    (car (cdr (cdr (cdr game))))
    ))

; Función selectora que obtiene el modo de juego
; Dominio: game
; Recorrido: mode
; Tipo de recursión: No aplica.
; Ejemplo de uso: (getModeGame (game 3 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (getModeGame (game 9 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (getModeGame (game 6 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define getModeGame
  (lambda(game)
    (car (cdr (cdr (cdr (cdr game)))))
    ))

; Función selectora que obtiene un número aleatoreo
; Dominio: game
; Recorrido: integer
; Tipo de recursión: No aplica.
; Ejemplo de uso: (getRandomFn (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (getRandomFn (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (getRandomFn (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define getRandomFn
  (lambda(game)
    (car (cdr (cdr (cdr (cdr (cdr game))))))
    ))

; Función selectora que obtiene el último jugador registrado
; Dominio: game
; Recorrido: string
; Tipo de recursión: No aplica.
; Ejemplo de uso: (getLastPlayer (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (getLastPlayer (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (getLastPlayer (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define getLastPlayer
  (lambda(game)
    (car (reverse (getPlayers game)))
    ))
; _______________________ MODIFICADORES _______________________________

; Función modificadora que entrega una nueva lista con el cardsSet modificado.
; Dominio: game X newCardsSet
; Recorrido: game 
; Tipo de recursión: No aplica.
; Ejemplo de uso: (setCardsSet (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
; Ejemplo de uso: (setCardsSet (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn)
; Ejemplo de uso: (setCardsSet  (cardsSet (list "1" "2" "3") 3 7 randomFn) (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
(define setCardsSet
  (lambda(newCardsSet)
     (list newCardsSet (getCardsLeft game) (getPlayers game)(getNumPlayers game)(getModeGame game) (getRandomFn game))
    ))

; Función modificadora que entrega una nueva lista con la baraja de juego modificada.
; Dominio: game X newCardsSet
; Recorrido: game
; Tipo de recursión: No aplica.
; Ejemplo de uso: (setCardsLeft (list "1" "2" "3") (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
; Ejemplo de uso: (setCardsLeft (list "3") (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn)
; Ejemplo de uso: (setCardsLeft (list "9" "9" "9") (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
(define setCardsLeft
    (lambda(newCardsLeft game)
      (list (getCardsSet game) newCardsLeft (getPlayers game)(getNumPlayers game)(getModeGame game) (getRandomFn game))
      ))

; Función mutuadora que entrega una nueva lista con los nuevos jugadores modificados.
; Dominio: game X newPlayers
; Recorrido: game 
; Tipo de recursión: No aplica.
; Ejemplo de uso: (setPlayers (list "user1") (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
; Ejemplo de uso: (setPlayers (list "usuario1" "usuario3") (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn)
; Ejemplo de uso: (setPlayers (list "gonzaloMartinez") (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
(define setPlayers
  (lambda(newPlayers game)
     (list (getCardsSet game) (getCardsLeft game) newPlayers (getNumPlayers game) (getModeGame game) (getRandomFn game))
    ))

; Función mutuadora que entrega una nueva lista con el número de jugadores modificado.
; Dominio: game X newNumPlayers
; Recorrido: game 
; Tipo de recursión: No aplica.
; Ejemplo de uso: (setNumPlayers 9 (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
; Ejemplo de uso: (setNumPlayers 11 (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn)
; Ejemplo de uso: (setNumPlayers 2 (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
(define setNumPlayers
  (lambda(newNumPlayers game)
     (list (getCardsSet game) (getCardsLeft game) (getPlayers game)newNumPlayers (getModeGame game) (getRandomFn game))))


; Función modificadora que entrega una nueva lista con el modo de juego modificado.
; Dominio: game X newMode
; Recorrido: game 
; Tipo de recursión: No aplica.
; Ejemplo de uso: (setMode reverseStackMode (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
; Ejemplo de uso: (setMode stackMode (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn)
; Ejemplo de uso: (setMode stackMode (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
(define setMode
  (lambda(newMode game)
     (list (getCardsSet game) (getCardsLeft game) (getPlayers game)(getNumPlayers game) newMode (getRandomFn game))))

; Función modificadora que entrega una nueva lista con el número aleatoreo modificado.
; Dominio: game X newRandom
; Recorrido: game
; Tipo de recursión: No aplica.
; Ejemplo de uso: (setRandom 10 (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
; Ejemplo de uso: (setRandom 15 (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn)
; Ejemplo de uso: (setRandom 22 (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn)
(define setRandom
  (lambda(newRandom game)
     (list (getCardsSet game) (getCardsLeft game) (getPlayers game)(getNumPlayers game)(getModeGame game) newRandom)
    ))

; _______________________ FUNCIONALIDADES _______________________________

; Función que permite retirar y voltear las dos cartas superiores del stack de cartas en el
; juego y las dispone en el área de juego.
; Dominio: cardsSet
; Recorrido: cardsSet
; Tipo de recursión: No aplica.
; Ejemplo de uso: (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define stackMode
  (lambda(cardsSet)
    (reverse cardsSet)
    (append (list(car (reverse cardsSet)) (list(cadr (reverse cardsSet)))))
    (setCardsLeft (append (list(car (reverse cardsSet)) (list(cadr (reverse cardsSet))))) game)
    ))

; Función para registrar a un jugador en un juego. Los jugadores tienen un nombre único y no puede
; exceder la cantidad de jugadores registrados.
; Dominio: string X game
; Recorrido: game
; Tipo de recursión: No aplica.
; Ejemplo de uso: (register "userRG" (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (register "userBE" (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (register "userGM" (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define register
  (lambda(user game)
    (list (getCardsSet game) (getCardsLeft game) (append (getPlayers game) user) (+ 1 (getNumPlayers game)) (getModeGame game) (getRandomFn game))
    ))

; Función que retorna el usuario a quién le corresponde jugar en el turno.
; Dominio: game
; Recorrido: string
; Tipo de recursión: No aplica.
; Ejemplo de uso: (whoseTurnIsIt? (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (whoseTurnIsIt? (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (whoseTurnIsIt? (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define whoseTurnIsIt?
  (lambda(game)
    (list (getLastPlayer game) getModeGame)
    ))

; Función que permite realizar una jugada a partir de la acción especificadas por la función currificada action.
; Las jugadas parten sin una acción especificada, lo que activa internamente el uso de la función stackMode para
; el trabajo sobre las cartas.
; Dominio: game, action
; Recorrido: game
; Tipo de recursión: No aplica.
; Ejemplo de Uso: (define myGame (game 4 (cardsSet (list 1 2 3) 5 5 randomFn) stackMode randomFn))
; (play mGame null randomFn)
; (play mGame pass randomFn)
; (play mGame (spotIt “A”) randomFn)
; (play mGame finish randomFn)
(define play
  (lambda(game action)
    (cons (setCardsLeft game) action)
    ))

; Función que retorna el estado actual del juego
; Dominio: game
; Recorrido: string
; Tipo de recursión: No aplica.
; Ejemplo de uso: (status (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (status (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (status (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
(define status
  (lambda(game)
    (list (getModeGame game) (getPlayers game) (getNumPlayers game) (getCardsLeft game))
    ))

; Función que retorna el puntaje de un jugador a partir de su nombre de usuario.
; Dominio: game X user
; Recorrido: integer
; Tipo de recursión: No aplica.
; Ejemplo de uso: (score (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn) "user")
; Ejemplo de uso: (score (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn) "user404")
; Ejemplo de uso: (score (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn) "userGM")
(define score
  (lambda(game findUser)
    (map (lambda(x)
           (if (= x (findUser))
               x ("No existe el usuario.")) (getPlayers game)))
    ))

; Función que convierte un juego/partida a una representación basada en strings que posteriormente pueda
; visualizarse a través de la función display.
; Domino: game
; Recorrido: string
; Tipo de recursión: No aplica.
; Ejemplo de uso: (game->string (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
; Ejemplo de uso: (game->string (game 1 (cardsSet (list "1" "2" "3") 3 7 randomFn) reverseStackMode randomFn))
; Ejemplo de uso: (game->string (game 2 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) stackMode randomFn))
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
    (stringsGame (cdr game))])
    ))

; Función que permite agregar cartas a un set de manera manual procurando verificar que las cartas
; incorporadas no violan las restricciones de un set válido, aunque incompleto. Por tanto, no pueden ocurrir
; situaciones como que dos cartas en el set tienen más de una figura en común. Si una violación ocurre, se devuelve
; el conjunto de entrada.
; Dominio: cardSet card
; Recorrido: cardSet
; Tipo de recursión: No aplica.
; Ejemplo de uso: (addCard (cardsSet (list "1" "2" "3" "4") 4 13 randomFn) (list "1" "1" "1" "1"))
; Ejemplo de uso: (addCard (cardsSet (list "1" "2" "3") 3 7 randomFn) (list "5" "3" "1"))
; Ejemplo de uso: (addCard (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) (list "8" "7" "6" "5" "4" "3" "2" "1"))
(define addCard
  (lambda(cardsSet card)
    (if (=(length card) (length (car cardsSet)))
    (cons card cardsSet)
    cardsSet)
    ))

; Función que permite retirar y voltear la carta en el tope del stack y una de las cartas del usuario seleccionada
; de manera aleatoria a partir de la función de aleatorización registrada en el juego.
; Al terminar un turno, si el jugador acierta se ubican en la base del stack, de lo contrario
; la carta del jugador vuelva a sus cartas y la del stack vuelve a la base de éste.
; Dominio: cardsSet
; Recorrido: cardsSet
; Tipo de recursión: No aplica.
; Ejemplo de uso: (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) (emptyHandsStackMode (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn)) randomFn)
; Ejemplo de uso: (emptyHandsStackMode (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn))
; Ejemplo de uso: (emptyHandsStackMode (cardsSet (list "1" "2" "3") 3 7 randomFn))
(define emptyHandsStackMode
  (lambda(cardsSet)
    (reverse cardsSet)
    (cons (car (reverse cardsSet)) (list(nthCard cardsSet (randomFn 0 (length cardsSet)))))
    ))
                                                   
; _______________________ MODO DE JUEGO PROPIO _______________________________


; Crea tu propia modalidad de juego sin romper las reglas generales del juego y sin afectar los
; dominios y recorridos de las funciones base. En concreto, debe se tratada igual que la función
; stackMode y emptyHandsMode.

; Modo de juego reverseStackMode: Toma las dos primeras cartas del mazo. Modo de juego
; Similar al modo stackMode. stackMode toma las primeras dos cartas del tope y las da vuelta
; reverseStackMode hace lo contrario y toma las dos primeras cartas del mazo y las da vuelta.
; Dominio: cardsSet
; Recorrido: cardsSet
; Tipo de recursión: No aplica.
; Ejemplo de uso: (game 4 (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) (reverseStackMode (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn)) randomFn)
; Ejemplo de uso: (reverseStackMode (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn))
; Ejemplo de uso: (reverseStackMode (cardsSet (list "1" "2" "3") 3 7 randomFn))
(define reverseStackMode
  (lambda(cardsSet)
    (reverse cardsSet)
    (append (list(car (cardsSet)) (list(cadr (cardsSet)))))
    ))
