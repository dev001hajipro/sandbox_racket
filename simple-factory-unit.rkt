#lang racket

(require "toy-factory-sig.rkt")

; By  convention, unit names end with @
(define-unit simple-factory@
  (import)
  (export toy-factory^)

  (printf "Factory started\n")

  (define-struct toy (color) #:transparent))

  