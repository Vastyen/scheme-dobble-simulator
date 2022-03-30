#lang racket

;; Tipo de Dato Abstracto: Game

;; Función a partir de la cual se crea e inicializa un tablero a partir de los parámetros de entrada.
;; Dominio: numPlayers(int) X cardsSet X mode (fn) X rndFn (fn)
;; Recorrido: game -> Corresponde a la estructura que alberga el área de juego, las piezas disponibles, jugadores registrados, sus ;; cartas y el estado del juego, entre otros elementos
;; Ejemplo de Uso: (define game1 (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
(define game(lambda(numPlayers cardsSet mode rndFn)))

;; Función que permite retirar y voltear las dos cartas superiores del stack de cartas en el juego y las dispone en el área de juego.
;; Dominio: cardsSet
;; Recorrido: cardsSet
;; Ejemplo de Uso: uso interno de la función como parte del constructor game (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn)
(define stackMode(lambda(cardsSet)
                   return cardSet))

;; Función para registrar a un jugador en un juego. Los jugadores tienen un nombre único y no puede exceder la cantidad de jugadores registrados.
;; Dominio: string, game
;; Recorrido: game
;; Ejemplo de Uso: (register “user1” (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
(define register(lambda(user game)))

;; Función que retorna el usuario a quién le corresponde jugar en el turno.
;; Dominio: game
;; Recorrido: string
;; Ejemplo de Uso: (whoseTurnIsIt? (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
(define whoseTurnIsIt?(lambda(game)))

;; Función que permite realizar una jugada a partir de la acción especificadas por la función currificada action. Las jugadas parten sin una acción especificada, lo que activa internamente el uso de la función stackMode para el trabajo sobre las cartas.
;; Dominio: game, action
;; Recorrido: game
;; Ejemplo de Uso: (define myGame (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
;; (play mGame null randomFn)
;; (play mGame pass randomFn)
;; (play mGame (spotIt “A”) randomFn)
;; (play mGame finish randomFn)
(define play(lambda(game action)))

;; Función que retorna el estado actual del juego
;; Dominio: game
;; Recorrido: string
;; Ejemplo de Uso: (status (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
(define status(lambda(game)))

;; Función que retorna el puntaje de un jugador a partir de su nombre de usuario.
;; Dominio: game
;; Recorrido: integer
;; Ejemplo de Uso: (score (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn) “user3”)
(define score(lambda(game)))

;; Función que convierte un juego/partida a una representación basada en strings que posteriormente pueda visualizarse a través de la función display.
;; Domino: game
;; Recorrido: string
;; Ejemplo de Uso: (game->string (game 4 (cardsSet (list “A” “B” “C”)) stackMode randomFn))
(define game->string(lambda(game)))

;; Función que permite agregar cartas a un set de manera manual procurando verificar que las cartas incorporadas no violan las restricciones de un set válido, aunque incompleto. Por tanto, no pueden ocurrir situaciones como que dos cartas en el set tienen más de una figura en común. Si una violación ocurre, se devuelve el conjunto de entrada.
;; Dominio: cardSet card
;; Recorrido: cardSet
;; Ejemplo de Uso: (addCard
;; (addCard
;; (addCard emptyCardsSet (card “A” “B”))
;; (card “B” “C”))
;; (card “A” “C”))
(define addCard(lambda(cardsSet card)))


;; Función que permite retirar y voltear la carta en el tope del stack y una de las cartas del usuario seleccionada de manera ;; aleatoria a partir de la función de aleatorización registrada en el juego. Al terminar un turno, si el jugador acierta se ubican en la base del stack, de lo contrario la carta del jugador vuelva a sus cartas y la del stack vuelve a la base de éste.
;; Dominio: cardsSet
;; Recorrido: cardsSet
;; Ejemplo de Uso: uso interno de la función como parte del constructor game
;; (game 4 (cardsSet (list “A” “B” “C”)) emptyHandsStackMode randomFn)
(define empyHandsStackMode(lambda(cardsSet)))

;; Crea tu propia modalidad de juego sin romper las reglas generales del juego y sin afectar los dominios y recorridos de las funciones base. En concreto, debe se tratada igual que la función stackMode y emptyHandsMode.
;; Dominio: cardsSet
;; Recorrido: cardsSet
;; Ejemplo de Uso: uso interno de la función como parte del constructor game
;; (game 4 (cardsSet (list “A” “B” “C”)) myMode randomFn)
(define myMode(lambda(cardsSet)))