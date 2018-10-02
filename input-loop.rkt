#lang racket
; https://stackoverflow.com/questions/20852022/how-do-you-make-an-interactive-input-loop-in-racket

(define start
  (display "start"))
(define stop
  (display "start"))

(define (input-loop)
  (display "What would you like to do? (start,stop,exit)")
  (define command (read-line))
  (cond [(string=? command "start") (start) (input-loop)]
        [(string=? command "stop")  (stop)  (input-loop)]
        [(string=? command "exit")  (displayln "exited successfully...")]        
        [else (displayln "unknown command") (input-loop)]))
(input-loop)