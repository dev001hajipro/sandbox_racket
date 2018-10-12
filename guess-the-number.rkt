#lang racket

(define start
  (displayln "start"))
(define stop
  (displayln "stop"))
(define exit
  (displayln "exit"))
(define (gen-number)
  (random 1 20))
(define secret-number (gen-number))
(define (reset)
  (println "set number")
  (set! secret-number (gen-number)))
(define (guess n)
  (cond
    [(< secret-number n) (println "more small") #f]
    [(> secret-number n) (println "more big") #f]
    [(= secret-number n) (println "Good job")
                         (reset)
                         #t]))

(define (input-loop)
  (display "What would you like to do? (start, stop, exit, reset)")
  (define command (read-line))
  (cond
    [(string=? command "start") (start) (input-loop)]
    [(string=? command "stop") (stop)]
    [(string=? command "exit") (exit)]
    [(string=? command "reset") (reset) (input-loop)]
    [(number? (string->number command))
     (guess (string->number command))
     (input-loop)]
    [else
     (displayln "unknown command")
     (input-loop)]))
    