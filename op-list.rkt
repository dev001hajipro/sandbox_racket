#lang racket

; リスト操作
(define todos
  (list
   '("title1" "body", #f)
   '("hello todo" "body" #f)
   '("title3" "body" #f)))

(define (todos-show todos)
  (for-each (λ(v)
              (printf "todo: ~a\n" v)
              #t)
            todos))

(define (todos-get-titles todos)
  (map (λ(v) (first v)) todos))