; https://cs.uwaterloo.ca/~plragde/flaneries/TYR/Basics.html
#lang racket

(require test-engine/racket-tests)

(check-random (random 10) (random 10))

(define (abs x)
  (cond
    [(> x 0) x]
    [else (- x)]))

(check-expect (abs 5) 5)
(check-expect (abs -3) 3)


; tail recursion
(define (fact-helper n acc)
  (cond
    [(= n 1) acc]
    [else (fact-helper (- n 1) (* n acc))]))
(define (fact n) (fact-helper n 1))

(check-expect (fact 5) 120)

; range
(define LS (stream->list (in-range 1 10)))
(display "sample list:LS")
(displayln LS)

(check-expect (take LS 3) '(1 2 3))
(check-expect (drop LS 3) '(4 5 6 7 8 9))

(define (sum-list lst)
  (cond
    [(empty? lst) 0]
    [else (+ (first lst) (sum-list (rest lst)))]))
(check-expect (sum-list '(1 2 3 4 5)) 15)

; string are a form of compound data
(check-expect (string-length "hello") 5)

(check-expect (list->string '(#\a #\b)) "ab")

;
;
;
; printed representation of a structure 
(struct st-user (name age) #:transparent)
(define my-user (st-user "john" 30))
(displayln my-user)
; 
(check-expect (st-user-name my-user) "john")
(check-expect (st-user-age my-user) 30)


(test)
