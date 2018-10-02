#lang racket

(struct blog (posts) #:mutable)
(struct post (title body))

(define BLOG
  (blog
   (list
    (post "aaa" "bbb")
    (post "xxx" "yyy"))))

(define (blog-insert-post! a-blog a-post)
  (set-blog-posts! a-blog
                   (cons a-post (blog-posts a-blog))))