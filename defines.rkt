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