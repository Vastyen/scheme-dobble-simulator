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
  (lambda (elements numE maxC createRandom)
    (cond
      [(cardsSet? elements numE maxC createRandom) 
       (list elements numE maxC createRandom)]
      [else null]))) ; null retorna una lista vacia, es lo mismo que '() o (list), luego si quieres preguntar si una lista es vacia, lo haces con null?

; Función que valida si los argumentos entregados corresponden a un TDA cardSet
; Dominio: elements x numE x maxC x getRandom
; Recorrido: boolean
(define cardsSet?
  (lambda (elements numE maxC createRandom)
    (cond
      [(and (list? elements) (integer? numE) 
            (integer? maxC) createRandom) 
       #t]
      [else #f])))

; Función que define una carta con símbolos
; Dominio: symbols
; Recorrido; card
(define card(lambda(symbols)
               symbols))

; Función que define una baraja de cartas
; Dominio: card X getMaxC
; Recorrido: cards (list)
; Tipo de Recursión: Cola.
(define (cards card getMaxC) 
   (define cardsEnvoltorio(lambda(x getMaxC baraja)
                           (if (= x getMaxC) ; Cuerpo
                               baraja ; Retorna la baraja.
                               (cardsEnvoltorio (+ x 1) getMaxC (append (list card (+ x 1)) baraja))
                            )))
  (cardsEnvoltorio 0 getMaxC (list))) ; Función encapsulada.

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
(define createRandom
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

; Función que permite determinar la cantidad de cartas en el set.
; Dominio: cardsSet
; Recorrido: integer
; Ejemplo de Uso: (numCards (cardsSet (list “A” “B” “C”) 2 -1 randomFn))
(define numCards
  (lambda(cardsSet)
    (+(+(* (getOrderGame cardsSet) (getOrderGame cardsSet)) (getOrderGame cardsSet))1)))
                               
; Función que obtiene la n-ésima (nth) carta desde el conjunto de cartas partiendo
; desde 0 hasta (totalCartas-1).
; Dominio: cardSet
; Recorrido: card
; Ejemplo de Uso: (nthCard (cardsSet (list “A” “B” “C”) 2 -1 randomFn) 1)
(define nthCard
  (lambda(cardsSet)
    (null)))

; Función que a partir de una carta de muestra, determina la cantidad total de cartas
; que se deben producir para construir un conjunto válido.
; Dominio: card
; Recorrido: integer
; Ejemplo de Uso: (findTotalCards (nthCard (cardsSet (list “A” “B” “C”) 2 -1 randomFn) 1))
(define findTotalCards
  (lambda(card)
    (null)))

; Función que a partir de una carta de muestra, determina la cantidad total de elementos
; necesarios para poder construir un conjunto válido.
; Dominio: card
; Recorrido: integer
; Ejemplo de Uso: (requiredElements (nthCard (cardsSet (list “A” “B” “C”) 2 -1 randomFn) 1))
(define requiredElements
  (lambda(card)
    (null)))

; Función que a partir de un conjunto de cartas retorna el conjunto de cartas que hacen
; falta para que el set sea válido.
; Dominio: cardsSet
; Recorrido: cardsSet
; Ejemplo de Uso: (findTotalCards (nthCard (cardsSet (list “A” “B” “C”) 2 -1 randomFn) 1))
(define missingCards
  (lambda(cardsSet)
    (null)))

; Función que convierte un conjunto de cartas a una representación basada en strings que
; posteriormente pueda visualizarse a través de la función display.
; Dominio: cardsSet
; Recorrido: string
; Ejemplo de Uso: (cardsSet->string (cardsSet (list “A” “B” “C”)))
(define cardsSet->string
  (lambda(cardsSet)
    (null)))