#lang racket

;; Constructor 
;; Dominio: Elements (list) X numE(int) X maxC(int) X rndFn (fn)
;; Recorrido: cardsSet
(define cardsSet(lambda (Elements numE maxC mdFn)
               (if (and (list? Elements) (integer? numE) (integer? maxC) (procedure? mdFn))
                  '(Elements numE maxC mdFn)
                 '()
                  )))
