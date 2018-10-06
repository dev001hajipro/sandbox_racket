#lang racket

(provide print-cake)

(define (print-cake n)
  (show "   ~a   " n #\.)
  (show " .-~a-. " n #\|)
  (show " | ~a | " n #\space)
  (show "---~a---" n #\-))

(define (show format n ch)
  (printf format (make-string n ch))
  (newline))