;#lang racket
;(module name-id initial-module-path
; decl ...)
; cake is module name.
; packet is an initial import.
(module cake racket
; https://docs.racket-lang.org/guide/Module_Syntax.html
; cake module.

(provide print-cake)

(define (print-cake n)
  (show "   ~a   " n #\.)
  (show " .-~a-. " n #\|)
  (show " | ~a | " n #\space)
  (show "---~a---" n #\-))

(define (show format n ch)
  (printf format (make-string n ch))
  (newline))
)
