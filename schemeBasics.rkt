#lang racket

;; Esto es un comentario
;; Función que suma dos valores
;; Dom: a integer, b integer
;; Rec: integer

(define suma
  (lambda(a b)
    (+ a b)))

;; Esto es un comentario
;; Función que resta dos valores
;; Dom: a integer, b integer
;; Rec: integer
(define suma2
  (lambda(a b)
    (- a b)))

;; Esto es un comentario
;; Función que suma tres valores
;; Dom: a integer, b integer
;; Rec: integer

(define suma3
  (lambda(a b c)
    (+ c (+ a b))))

;; función que representa una calculadora

(define calculadora(lambda (operacion a b)
                     (operacion a b)
                     ))
(define suma-curry (lambda(a)
                     (lambda(b)
                       (lambda(c)
                         (+ a b c)))))
(((suma-curry 2)3)4)


