#lang racket

(require racket/serialize)

(struct post (title body))
(define BLOG (list
              (post "first" "hello")
              (post "apple" "orange")))

(serializable? #t)
(serializable? BLOG)
