#lang racket

(provide cardsSet?) ; Se exporta la función de pertenencia cardsSet? al TDA game.

; _______________________ PARÁMETROS _______________________________

; Descripción de los parámetros a recibir para la función constructor.
; Elements: Lista desde donde se puede obtener una muestra de elementos
; (números, letras, figuras, etc.) para construir el conjunto de cartas.
; numE: Entero positivo que indica la cantidad de elementos esperada en cada carta
; maxC: Entero que indica la cantidad máxima de cartas que se busca generar en el conjunto.
; Si maxC <=0 se producen todas las cartas posibles para un conjunto válido.
; rndFn: Función de aleatorización que debe garantizar transparencia referencial.
; Se proporciona función de ejemplo al final del enunciado. Es opcional implementar otra.
; La función se puede usar internamente para aleatorizar aspectos en la generación de
; cartas tales como orden de los elementos, tamaño de los elementos, etc. 

; _______________________ CONSTRUCTOR _______________________________

; Función constructora de conjuntos válidos de cartas para el juego Dobble.
; Dominio: Elements (list) X numE(int) X maxC(int) X getRandom (fn)
; Recorrido: cardsSet
; Ejemplo de Uso: (cardsSet (list “A” “B” “C”) 2 -1 getRandom)
; lista de elementos a partir de TDA element definido por el usuario
; (cardsSet (list (element “A”) (element “B”) (element “C”)) 2 -1 getRandom)

(define cardsSet
  (lambda (elements numE maxC randomFn)
    (cond
      [(cardsSet? elements numE maxC randomFn) 
       (cards numE )]
      [else null])
    )) ; null retorna una lista vacia, es lo mismo que '() o (list), luego si quieres preguntar si una lista es vacia, lo haces con null?

; Función que valida si los argumentos entregados corresponden a un TDA cardSet
; Dominio: elements x numE x maxC x getRandom
; Recorrido: boolean
(define cardsSet?
  (lambda (elements numE maxC randomFn)
    (cond
      [(and (list? elements) (integer? numE) 
            (integer? maxC) randomFn) 
       #t]
      [else #f])))



; _______________________ SELECTORES _______________________________

; Función selectora para los elementos recibidos en el cardsSet
; Dominio: cardsSet
; Recorrido: list 
(define getElements
  (lambda (cardsSet)
    (car cardsSet)))

; Función selectora para obtener el número de elementos en cada carta
; Dominio: cardsSet
; Recorrido: integer 
(define getNumE
  (lambda(cardsSet)
    (car (cdr cardsSet))))

; Función selectora que retorna el número de cartas máximas
; Dominio: cardsSet
; Recorrido: integer
(define getMaxC
  (lambda(cardsSet)
    (car(cdr(cdr cardsSet)))))

; Función selectora del número aleatoreo obtenido en el cardsSet
; Dominio: cardsSet
; Recorrido: integer
(define getRandom
  (lambda(cardsSet)(
    (car (cdr(cdr (cdr cardsSet)))))))

; Función selectora que obtiene el orden del juego.
; Dominio: cardsSet
; Recorrido: integer
(define getOrderGame
  (lambda(cardsSet)
    (- (getNumE cardsSet) 1)))

; Función random para la selección aleatoria de elementos desde un conjunto, asignación
; aleatoria de cartas a jugadores, ordenamiento aleatorio de cartas en la pila, etc.
; Dominio: Integer Integer
; Recorrido: Integer
; Ejemplo de Uso: randomFn(10 50) // Genera un número aleatoreo entre 10 y 50.
(define randomFn
  (lambda(min max)
    (random min (+ 1 max))))
                 
; _______________________ MUTUADORES _______________________________

; Función que retorna una nueva lista con los elements modificados.
; Dominio: cardsSet X list
; Recorrido: cardsSet
(define setElements
  (lambda(cardsSet newElements)(
    (list newElements (getNumE cardsSet) (getMaxC cardsSet) (getRandom cardsSet)))))

; Función que retorna una nueva lista con el número de elementos modificado.
; Dominio: cardsSet X integer
; Recorrido: cardsSet
(define setNumE
  (lambda(cardsSet newNumE)(
     (list (getElements cardsSet) newNumE (getMaxC cardsSet) (getRandom cardsSet)))))

; Función que retorna una nueva lista con el cardsSet y con el máximo de cartas a generar modificado.
; Dominio: cardsSet X integer
; Recorrido: cardsSet
(define setMaxC
  (lambda(cardsSet newMaxC)(
     (list (getElements cardsSet) (getNumE cardsSet) newMaxC (getRandom cardsSet)))))

; Función que retorna una nueva lista con el número random modificado.
; Dominio: cardsSet X integer
; Recorrido: cardsSet
(define setRandom
  (lambda(cardsSet newRandom)
     (list (getElements cardsSet) (getNumE cardsSet) (getMaxC) newRandom)))

; _______________________ FUNCIONALIDADES _______________________________

; Función que genera un mazo de tipo card
; Dominio: orderGame (integer)
; Recorrido: cards
(define cards
  (lambda(orderGame)
    (reverse(reverseDeck orderGame))))
(define reverseDeck
  (lambda(orderGame)
    (define tempCard '())
    (define deck '())
    (define addSymbol
      (lambda(symbol emptyCard)
        (cons symbol emptyCard)))
    (define addCardToCards
      (lambda(card deck)
        (cons card deck)))
      (define fistCard
        (lambda(card i orderGame)
          (if (not(= i(+ 2 orderGame)))
              (fistCard (addCardToCards i card) (+ 1 i) orderGame) card)))
    (define nCards
      (lambda(endValue j cards)
      (define Encap-nCard
        (lambda(card k j orderGame)
           (if (not(= k (+ 1 orderGame)))
               (Encap-nCard (addSymbol (+ (* orderGame j) (+ k 1)) card) (+ k 1) j orderGame) card)))
           (if (not(= (+ 1 endValue) j))
               (nCards endValue (+ j 1) (addCardToCards (reverse (Encap-nCard (addSymbol 1 tempCard) 1 j endValue)) cards))
                cards)))
    (define nnCards
      (lambda(endValue i cards)
        (define Encap-nnCard
          (lambda(cards i j orderGame)
            (define Encap-Encap-nnCard
              (lambda(card i j k orderGame)
                (if (not(= k (+ 1 orderGame)))
                    (Encap-Encap-nnCard (addSymbol (+ orderGame 2 (* orderGame (- k 1)) (remainder (- (+ (* (- i 1) (- k 1)) j) 1) orderGame)) card)i j (+ 1 k) orderGame) card)))
            (if (not(= j (+ 1 orderGame)))
                (Encap-nnCard (addCardToCards (reverse (Encap-Encap-nnCard (addSymbol (+ 1 i) tempCard) i j 1 orderGame)) cards) i (+ j 1) orderGame) cards)))
        (if (not(= i (+ 1 endValue)))
           (nnCards endValue (+ 1 i) (Encap-nnCard cards i 1 endValue))
            cards)))
    (nnCards orderGame 1
             (nCards orderGame 1
                     (addCardToCards
                      (reverse(fistCard tempCard 1 orderGame)) deck)))))

; Función que permite determinar la cantidad de cartas en el set.
; Dominio: cardsSet
; Recorrido: integer
; Ejemplo de Uso: (numCards (cardsSet (list “A” “B” “C”) 2 -1 randomFn))
(define numCards
  (lambda(cardsSet)
    (+(+(* (getOrderGame cardsSet) (getOrderGame cardsSet)) (getOrderGame cardsSet)) 1)))
                               
; Función que obtiene la n-ésima (nth) carta desde el conjunto de cartas partiendo
; desde 0 hasta (totalCartas-1).
; Dominio: cardsSet X integer
; Recorrido: card
; Ejemplo de Uso: (nthCard  (cardsSet (list "hola" "hola") 7 -1 randomFn) 1)
(define nthCard
  (lambda (cards nth)
    (if (= nth 0)
        (car cards)
        (nthCard (cdr cards) (- nth 1)))))

; Función que a partir de una carta de muestra, determina la cantidad total de cartas
; que se deben producir para construir un conjunto válido.
; Dominio: card
; Recorrido: integer
; Ejemplo de Uso: (findTotalCards (nthCard (cardsSet (list “A” “B” “C”) 2 -1 randomFn) 1))
(define findTotalCards
  (lambda (card)
    (+(+(*(-(length card) 1)(-(length card) 1))(-(length card) 1)) 1)))

; Función que a partir de una carta de muestra, determina la cantidad total de elementos
; necesarios para poder construir un conjunto válido.
; Dominio: cardsSet
; Recorrido: integer
; Ejemplo de Uso: (requiredElements (nthCard (cardsSet (list “A” “B” “C”) 2 -1 randomFn) 1))
(define requiredElements
  (lambda (card)
    (+(+(*(-(length card) 1)(-(length card) 1))(-(length card) 1)) 1)))

; A partir de un conjunto de cartas retorna el conjunto de cartas que hacen falta para que el set sea válido.
; Dominio: cardsSet
; Recorrido: cardsSet
; Ejemplo de Uso: (missingCards  (cardsSet (list “A” “B” “C”) 2 -1 randomFn) )
(define missingCards
  (lambda(cardsRecived)
    (if (prime? (length(car cardsRecived)))
             (display "The order must to be a prime number.")
             (cards (length(car cardsRecived))))))


; Función que evalua un número y ve si es primo o no.
; Dominio: integer
; Recorrido: boolean
(define (prime? lengthCard)
  (define (encapPrime lengthCard temp)
    (cond [(< lengthCard (* temp temp)) #t]
          [(zero? (modulo lengthCard temp)) #f]
          [else (encapPrime lengthCard (add1 temp))]))
  (encapPrime lengthCard 2))

; Función que convierte un conjunto de cartas a una representación basada en strings que
; posteriormente pueda visualizarse a través de la función display.
; Dominio: cardsSet
; Recorrido: string
; Ejemplo de Uso: (cardsSet->string (cardsSet (list “A” “B” “C”)))
(define cardsSet->string
  (lambda(cards)
    (display cards)))