#lang racket

(require test-engine/racket-tests)

(define (translate s)
  (cond
    [(equal? s 'plus) +]
    [(equal? s 'minus) -]))

(check-expect ((translate 'plus) 3 4) 7)


(define (make-adder x)
  (λ (y) (+ x y)))

(check-expect ((make-adder 3) 4) 7)
;(check-expect (make-adder 3) (λ (y) (+ 3)))


(map (λ (x) (* x x)) '(1 2 3 4 5))

; args
(define (sqr-list . args)
  (map sqr args))
(check-expect (sqr-list 1 2 3) '(1 4 9))

(test)
