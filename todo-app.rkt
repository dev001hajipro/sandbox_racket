#lang racket
'(+ 1 2)
(+ 1 2)
(list "title" #f)
(display "hello")

(define (ret-x x) x)
(define (k+ a b k)
  (k (+ a b)))
(define (k* a b k)
  (k (* a b)))
(k+ 1 2 (lambda (x) (k* x 3 ret-x)))