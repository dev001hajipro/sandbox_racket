#lang racket

(define x 3)
(define (change-x n)
  (set! x n))
(println x)
(change-x 5)
(println x)

; box is simplest mutable data strucutre.
(define my-count (box 0))
(define (my-count-show b)
  (unbox b))
(define (my-count-inc b)
  (set-box! b (+ (unbox b) 1)))

(my-count-inc my-count)
(my-count-inc my-count)
(my-count-inc my-count)
(my-count-show my-count)

(define-struct favourite (category entry) #:mutable #:transparent)
(define my-faves
  (list
   (favourite "band" "bobobo")
   (favourite "xeff" "afafaf")
   (favourite "3333" "3ccccc")
   (favourite "4444" "4ddddd")))

(set-favourite-entry! (first my-faves) "MISS")
(set-favourite-entry! (second my-faves) "xxxx")

my-faves

;
; hash table
;

