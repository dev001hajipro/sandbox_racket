#lang racket

(define (ret-multi-val n)
  (values n 2 3))

; Like a Python tuple.
; Evaluates the expr, and binds the results to the ids.
(define-values (x y z) (ret-multi-val 5))
(print x)
(print y)
(println z)

(map (λ(n) (+ n 1)) '(1 2 3 4 5))

;(map (x-> (+ n 1))

;; TODO define-unit
;; TODO unit

(define (say-hello name)
  (printf "Hi! ~a\n" name))
; 関数名にスラッシュを付けられる
(define (say-hello/mr name)
  (printf "Hello, Mr. ~a.\n" name))
(say-hello "john")
(say-hello/mr "smith")

; 関数名に:を付けられる
(define (say-hello:miss name)
  (printf "Hello, Miss. ~a.\n" name))
(say-hello:miss "smith")
