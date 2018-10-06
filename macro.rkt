#lang racket

; http://www.shido.info/lisp/scheme_syntax.html

(define-syntax nil!
  (syntax-rules ()
    (
     ; before. and _ is marco name(nil!)
     (_ x)
     ; after
     (set! x '()))))


(define (converter x)
  (set! x '())
  (println (format "x in converter:~a" x))
  x)

(define a 1)
a
(converter a)
a
(nil! a)
a

; n-> (+ n 1)
; λ (x) -> 5

; racket can define function letter from '-'.
(define (-add1- n) (+ n 1))
(map -add1- '(1 2 3 4 5))

