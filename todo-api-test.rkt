#lang racket


(require "common-util.rkt"
         "todo-api.rkt")

;;;;;
;; test
(define data-path (store-path data-file))
(displayln data-path)
(delete-file-c data-path)
(create-file data-path)
(todo-add data-path "hello")
(todo-add data-path "こんにちはhello世界world")
(todo-add data-path "good morning")
(todo-show-order data-path)

(todo-remove data-path 0)
(todo-list data-path)
(todo-show-order data-path)
