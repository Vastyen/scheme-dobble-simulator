#lang racket

(provide (all-defined-out)) ; Exporta todas las funciones del TDA para implementarlas en otro TDA

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
; Dominio: Elements (list) X numE(int) X maxC(int) X randomFn (fn)
; Recorrido: cardsSet
; Tipo de recursión: No aplica.
; Ejemplo de uso: (cardsSet (list "1" "2" "3" "4") 4 13 randomFn)
; Ejemplo de uso: (cardsSet (list "1" "2" "3") 3 7 randomFn)
; Ejemplo de uso: (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn)
(define cardsSet
  (lambda (elements numE maxC randomFn)
    (cond
      [(dobble? elements numE maxC randomFn) 
       (cards (- numE 1))]
      [else null])
    ))

; Función que valida si los argumentos entregados corresponden a un TDA cardSet
; Dominio: elements x numE x maxC x randomFn
; Recorrido: boolean
; Tipo de Recursión: No aplica.
(define dobble?
  (lambda (elements numE maxC randomFn)
    (cond
      [(and (list? elements) (integer? numE) 
            (integer? maxC) randomFn) 
       #t]
      [else #f])
    ))

; _______________________ SELECTORES _______________________________

; Función selectora para los elementos recibidos en el cardsSet
; Dominio: cardsSet
; Recorrido: list
; Tipo de recursión: No aplica.
; Ejemplo de uso: (getElements (cardsSet (list "1" "2" "3" "4") 4 13 randomFn))
; Ejemplo de uso: (getElements (cardsSet (list "1" "2" "3") 3 7 randomFn))
; Ejemplo de uso: (getElements (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn))
(define getElements
  (lambda (cardsSet)
    (car cardsSet)
    ))

; Función selectora para obtener el número de elementos en cada carta
; Dominio: cardsSet
; Recorrido: integer
; Tipo de Recursión: No aplica.
; Ejemplo de uso: (getNumE (cardsSet (list "1" "2" "3" "4") 4 13 randomFn))
; Ejemplo de uso: (getNumE (cardsSet (list "1" "2" "3") 3 7 randomFn))
; Ejemplo de uso: (getNumE (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn))
(define getNumE
  (lambda(cardsSet)
    (car (cdr cardsSet))
    ))

; Función selectora que retorna el número de cartas máximas
; Dominio: cardsSet
; Recorrido: integer
; Tipo de recursión: No aplica.
; Ejemplo de uso: (getMaxC (cardsSet (list "1" "2" "3" "4") 4 13 randomFn))
; Ejemplo de uso: (getMaxC (cardsSet (list "1" "2" "3") 3 7 randomFn))
; Ejemplo de uso: (getMaxC (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn))
(define getMaxC
  (lambda(cardsSet)
    (car(cdr(cdr cardsSet)))
    ))

; Función selectora del número aleatoreo obtenido en el cardsSet
; Dominio: cardsSet
; Recorrido: integer
; Tipo de recursión: No aplica.
; Ejemplo de uso: (getRandom (cardsSet (list "1" "2" "3" "4") 4 13 randomFn))
; Ejemplo de uso: (getRandom (cardsSet (list "1" "2" "3") 3 7 randomFn))
; Ejemplo de uso: (getRandom (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn))
(define getRandom
  (lambda(cardsSet)
    ((car (cdr(cdr (cdr cardsSet)))))
    ))

; Función selectora que obtiene el orden del juego.
; Dominio: cardsSet
; Recorrido: integer
; Tipo de recursión: No aplica.
; Ejemplo de uso: (getOrderGame (cardsSet (list "1" "2" "3" "4") 4 13 randomFn))
; Ejemplo de uso: (getElements (cardsSet (list "1" "2" "3") 3 7 randomFn))
; Ejemplo de uso: (getElements (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn))
(define getOrderGame
  (lambda(cardsSet)
    (- (getNumE cardsSet) 1)
    ))

; Función random para la selección aleatoria de elementos desde un conjunto, asignación
; aleatoria de cartas a jugadores, ordenamiento aleatorio de cartas en la pila, etc.
; Dominio: integer X integer
; Recorrido: integer
; Tipo de recursión: No aplica.
; Ejemplo de Uso: randomFn(10 50) // Genera un número aleatoreo entre 10 y 50.
(define randomFn
  (lambda(min max)
    (random min (+ 1 max))
    ))
                 
; _______________________ MODIFICADORES _______________________________

; Función que retorna una nueva lista con los elements modificados.
; Dominio: cardsSet X list
; Recorrido: cardsSet
; Tipo de recursión: No aplica.
; Ejemplo de uso: (setElements (cardsSet (list "1" "2" "3" "4") 4 13 randomFn) (list "1" "1" "1" "1"))
; Ejemplo de uso: (setElements (cardsSet (list "1" "2" "3") 3 7 randomFn) (list "5" "3" "1"))
; Ejemplo de uso: (setElements (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) (list "8" "7" "6" "5" "4" "3" "2" "1"))
(define setElements
  (lambda(cardsSet newElements)(
    (list newElements (getNumE cardsSet) (getMaxC cardsSet) (getRandom cardsSet)))
    ))

; Función que retorna una nueva lista con el número de elementos modificado.
; Dominio: cardsSet X integer
; Recorrido: cardsSet
; Tipo de recursión: No aplica.
; Ejemplo de uso: (newNumE (cardsSet (list "1" "2" "3" "4") 4 13 randomFn) 10)
; Ejemplo de uso: (newNumE (cardsSet (list "1" "2" "3") 3 7 randomFn) 5)
; Ejemplo de uso: (newNumE (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) 10)
(define setNumE
  (lambda(cardsSet newNumE)(
     (list (getElements cardsSet) newNumE (getMaxC cardsSet) (getRandom cardsSet)))
    ))

; Función que retorna una nueva lista con el cardsSet y con el máximo de cartas a generar modificado.
; Dominio: cardsSet X integer
; Recorrido: cardsSet
; Tipo de recursión: No aplica.
; Ejemplo de uso: (setMaxC (cardsSet (list "1" "2" "3" "4") 4 13 randomFn) 10)
; Ejemplo de uso: (setMaxC (cardsSet (list "1" "2" "3") 3 7 randomFn) 5)
; Ejemplo de uso: (setMaxC (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) 10)
(define setMaxC
  (lambda(cardsSet newMaxC)(
     (list (getElements cardsSet) (getNumE cardsSet) newMaxC (getRandom cardsSet)))
    ))

; Función que retorna una nueva lista con el número random modificado.
; Dominio: cardsSet X integer
; Recorrido: cardsSet
; Tipo de recursión: No aplica.
; Ejemplo de uso: (setRandom (cardsSet (list "1" "2" "3" "4") 4 13 randomFn) 10)
; Ejemplo de uso: (setRandom (cardsSet (list "1" "2" "3") 3 7 randomFn) 5)
; Ejemplo de uso: (setRandom (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) 10)
(define setRandom
  (lambda(cardsSet newRandom)
     (list (getElements cardsSet) (getNumE cardsSet) (getMaxC) newRandom)
    ))

; _______________________ FUNCIONALIDADES _______________________________

; Función que genera un mazo de tipo card
; Dominio: orderGame (integer)
; Recorrido: cards
; Tipo de recursión: Cola
; Ejemplo de uso: (cards 3)
; Ejemplo de uso: (cards 4)
; Ejemplo de uso: (cards 999)
(define cards
  (lambda(orderGame)
    (reverse(reverseDeck orderGame))))
(define reverseDeck
  (lambda(orderGame)
    (define tempCard '())
    (define deck '())
    (define addSymbol
      (lambda(symbol emptyCard)
        (cons symbol emptyCard)
        ))
    (define addCardToCards
      (lambda(card deck)
        (cons card deck)
        ))
      (define fistCard
        (lambda(card i orderGame)
          (if (not(= i(+ 2 orderGame)))
              (fistCard (addCardToCards i card) (+ 1 i) orderGame) card)
          ))
    (define nCards
      (lambda(endValue j cards)
      (define Encap-nCard
        (lambda(card k j orderGame)
           (if (not(= k (+ 1 orderGame)))
               (Encap-nCard (addSymbol (+ (* orderGame j) (+ k 1)) card) (+ k 1) j orderGame) card)))
           (if (not(= (+ 1 endValue) j))
               (nCards endValue (+ j 1) (addCardToCards (reverse (Encap-nCard (addSymbol 1 tempCard) 1 j endValue)) cards))
                cards)
        ))
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
            cards)
        ))
    (nnCards orderGame 1(nCards orderGame 1(addCardToCards
      (reverse(fistCard tempCard 1 orderGame)) deck)))
    ))

; Función que permite determinar la cantidad de cartas en el set.
; Dominio: cardsSet
; Recorrido: integer
; Tipo de recursión: No aplica.
; Ejemplo de uso: (numCards (cardsSet (list "1" "2" "3" "4") 4 13 randomFn))
; Ejemplo de uso: (numCards (cardsSet (list "1" "2" "3") 3 7 randomFn))
; Ejemplo de uso: (numCards (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn))
(define numCards
  (lambda(cardsSet)
    (length cardsSet))
    )
                               
; Función que obtiene la n-ésima (nth) carta desde el conjunto de cartas partiendo
; desde 0 hasta (totalCartas-1).
; Dominio: cardsSet X integer
; Recorrido: card
; Tipo de recursión: Cola.
; Ejemplo de uso: (nthCard (cardsSet (list "1" "2" "3" "4") 4 13 randomFn) 1)
; Ejemplo de uso: (nthCard (cardsSet (list "1" "2" "3") 3 7 randomFn) 3)
; Ejemplo de uso: (nthCard (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) 5)
(define nthCard
  (lambda (cards nth)
    (if (= nth 0)
        (car cards)
        (nthCard (cdr cards) (- nth 1)))
    ))

; Función que a partir de una carta de muestra, determina la cantidad total de cartas
; que se deben producir para construir un conjunto válido.
; Dominio: card
; Recorrido: integer
; Tipo de recursión: No aplica.
; Ejemplo de uso: (findTotalCards (nthCard (cardsSet (list "1" "2" "3" "4") 4 13 randomFn) 3))
; Ejemplo de uso: (findTotalCards (nthCard (cardsSet (list "1" "2" "3") 3 7 randomFn) 2))
; Ejemplo de uso: (findTotalCards (nthCard (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn) 5))
(define findTotalCards
  (lambda (card)
    (+(+(*(-(length card) 1)(-(length card) 1))(-(length card) 1)) 1)
    ))

; Función que a partir de una carta de muestra, determina la cantidad total de elementos
; necesarios para poder construir un conjunto válido.
; Dominio: cardsSet
; Recorrido: integer
; Tipo de recursión: No aplica.
; Ejemplo de uso: (requiredElements (cardsSet (list "1" "2" "3" "4") 4 13 randomFn))
; Ejemplo de uso: (requiredElements (cardsSet (list "1" "2" "3") 3 7 randomFn))
; Ejemplo de uso: (requiredElements (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn))
(define requiredElements
  (lambda (card)
    (+(+(*(-(length card) 1)(-(length card) 1))(-(length card) 1)) 1)
    ))

; A partir de un conjunto de cartas retorna el conjunto de cartas que hacen falta para que el set sea válido.
; Dominio: cardsSet
; Recorrido: cardsSet
; Tipo de recursión: No aplica.
; Ejemplo de uso: (missingCards (cardsSet (list "1" "2" "3" "4") 4 13 randomFn))
; Ejemplo de uso: (missingCards (cardsSet (list "1" "2" "3") 3 7 randomFn))
; Ejemplo de uso: (missingCards (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn))
(define missingCards
  (lambda(cardsRecived)
    (if (prime? (length(car cardsRecived)))
             (display "The order must to be a prime number.")
             (cards (length(car cardsRecived))))
    ))

; Función que evalua un número y ve si es primo o no.
; Dominio: integer
; Recorrido: boolean
; Tipo de recursión: No aplica.
; Ejemplo de uso: (prime? 4)
; Ejemplo de uso: (prime? 2)
; Ejemplo de uso: (prime? 6)
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
; Tipo de recursión: Natural.
; Ejemplo de uso: (display (cardsSet->string (cardsSet (list "1" "2" "3" "4") 4 13 randomFn)))
; Ejemplo de uso: (display (cardsSet->string (cardsSet (list "1" "2" "3") 3 7 randomFn)))
; Ejemplo de uso: (display (cardsSet->string (cardsSet (list "1" "2" "3" "4" "5" "6" "7" "8") 8 57 randomFn)))
(define cardsSet->string
  (lambda(cardsSet)
    (string-append "-Spot-It-Deck-\n" "------------------\n" (allStrings (reverse cardsSet)))
    ))
(define allStrings
  (lambda(cardsSet)
    (define cartaNumberString
      (lambda(carta)
        (map (lambda(y)
               (number->string y)) carta)
        ))
    (define cartaString
      (lambda(carta)
        (if (null? (cdr carta))
            (string-append (car carta) "\n")
            (string-append (car carta) "-" (cartaString (cdr carta))))
        ))
    (if (null? (cdr cardsSet))
        (string-append "Card " (number->string (numCards cardsSet)) ": "(cartaString (cartaNumberString (car cardsSet))) "------------------")
        (string-append "Card " (number->string (numCards cardsSet)) ": "(cartaString (cartaNumberString (car cardsSet))) (allStrings (cdr cardsSet))))
    ))