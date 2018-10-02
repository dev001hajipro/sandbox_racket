#lang web-server/insta

(struct post (title body))
(define BLOG (list
              (post "FirstPost!" "Hello, Good morning!")
              (post "Study DrRacket" "now!")))

(define (start request)
  (response/xexpr
   '(html
     (head
      (title "Rocketブログ"))
     (body
      (h1 "工事中")))))
