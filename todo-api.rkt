#lang racket

(provide (all-defined-out))

(require "common-util.rkt")

(define data-file "todolist.dat")

(define (todo-list path)
  (file->lines path))

(define (todo-show-order path)
  (let*
      ([lines (todo-list path)]
       [nums (range 1  (+ (length lines) 1))])
    ;add order number.
    (map
     (λ(n s)(format "~a.~a" n s))
     nums
     lines)))

(define (todo-add path s)
  (let
      ([new-list (addlast (file->lines path) s)])
    (write-file path new-list)))

(define (todo-remove path n)
  (let*
      ([lines (file->lines path)]
       [key (list-ref lines n)]
       [new-list (remove key lines)])
    (write-file path new-list)))



