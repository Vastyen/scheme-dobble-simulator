#lang racket

;; Elements: Lista desde donde se puede obtener una muestra de elementos (números, letras, figuras, etc.) para construir el conjunto de cartas.
;; numE: Entero positivo que indica la cantidad de elementos esperada en cada carta
;; maxC: Entero que indica la cantidad máxima de cartas que se busca generar en el conjunto. Si maxC <=0 se producen todas las cartas posibles para un conjunto válido.
;; rndFn: Función de aleatorización que debe garantizar transparencia referencial. Se proporciona función de ejemplo al final del enunciado. Es opcional implementar otra. La función se puede usar internamente para aleatorizar aspectos en la generación de cartas tales como orden de los elementos, tamaño de los elementos, etc. 

;; ______________________________________________________________________________


;; Función constructora de conjuntos válidos de cartas para el juego Dobble.
;; Dominio: Elements (list) X numE(int) X maxC(int) X rndFn (fn)
;; Recorrido: cardsSet
;; Ejemplo de Uso: (cardsSet (list “A” “B” “C”) 2 -1 randomFn)
;; lista de elementos a partir de TDA element definido por el usuario
;; (cardsSet (list (element “A”) (element “B”) (element “C”)) 2 -1 randomFn)
(define cardsSet(lambda (Elements numE maxC rndFn)
               (if (and (list? Elements) (integer? numE) (integer? maxC) (procedure? rndFn))
                  '(Elements numE maxC mdFn)
                 '()
                  )))

;; Función random para la selección aleatoria de elementos desde un conjunto, asignación aleatoria de cartas a jugadores, ordenamiento aleatorio de cartas en la pila, etc.
;; Dominio: Integer Integer
;; Recorrido: Integer
<<<<<<< HEAD
;; Ejemplo de Uso: randomFn(10 50) // Genera un número aleatoreo entre 10 y 50.
(define randomFn(lambda(min max)
=======
(define rndFn(lambda(min max)
>>>>>>> cd1d4c3d27a28c6b9e17a0ca638e6f232ce23362
               (random min max)
               ))


;; Función que permite verificar si el conjunto de cartas en el conjunto corresponden a un conjunto válido.
;; Dominio: cardsSet
;; Recorrido: Boolean
;; Ejemplo de Uso: (dobble? (cardsSet (list “A” “B” “C”) 2 -1 randomFn))
(define dobble?(lambda(cardsSet)))


;; Función que permite determinar la cantidad de cartas en el set.
;; Dominio: cardsSet
;; Recorrido: Integer
;; Ejemplo de Uso: (numCards (cardsSet (list “A” “B” “C”) 2 -1 randomFn))
(define numCards(lambda(cardsSet)))


;; Función que obtiene la n-ésima (nth) carta desde el conjunto de cartas partiendo desde 0 hasta (totalCartas-1).
;; Dominio: cardSet
;; Recorrido: card
;; Ejemplo de Uso: (nthCard (cardsSet (list “A” “B” “C”) 2 -1 randomFn) 1)
(define nthCard(lambda(cardsSet)))

;; Función que a partir de una carta de muestra, determina la cantidad total de cartas que se deben producir para construir un conjunto válido.
;; Dominio: card
;; Recorrido: Integer
;; Ejemplo de Uso: (findTotalCards (nthCard (cardsSet (list “A” “B” “C”) 2 -1 randomFn) 1))
(define findTotalCards(lambda(card)))



;; Función que a partir de una carta de muestra, determina la cantidad total de elementos necesarios para poder construir un conjunto válido.
;; Dominio: card
;; Recorrido: Integer
;; Ejemplo de Uso: (requiredElements (nthCard (cardsSet (list “A” “B” “C”) 2 -1 randomFn) 1))
(define requiredElements(lambda(card)))



;; Función que a partir de un conjunto de cartas retorna el conjunto de cartas que hacen falta para que el set sea válido.
;; Dominio: cardsSet
;; Recorrido: cardsSet
;; Ejemplo de Uso: (findTotalCards (nthCard (cardsSet (list “A” “B” “C”) 2 -1 randomFn) 1))
(define missingCards(lambda(cardsSet)))


;; Función que convierte un conjunto de cartas a una representación basada en strings que posteriormente pueda visualizarse a través de la función display.
;; Dominio: cardsSet
;; Recorrido: String
;; Ejemplo de Uso: (cardsSet->string (cardsSet (list “A” “B” “C”)))
(define cardsSet->string(lambda(cardsSet)))


