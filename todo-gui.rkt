#lang racket

(require racket/gui/base)
(require "common-util.rkt"
         "todo-api.rkt")

(define data-path (store-path data-file))

(define frame (new frame%
                   [label "ToDo list"]
                   [width 640]
                   [height 480]))

(define panel (new horizontal-panel%
                   [parent frame]
                   [min-height 30]
                   [stretchable-height 50]))

(define todo-field
  (new text-field% [parent panel]
       [label "ToDo"]
       [callback(λ (t event)
                  "")]))
                

(new button% [parent panel]
     [label "Add"]
     [callback(λ (button event)
                (let*
                    ([a-text (send todo-field get-editor)]
                     [text-data (send a-text get-text)])
                  (cond
                    [(> (string-length text-data) 0)
                     (todo-add data-path (send a-text get-text))
                     (send a-text erase)
                     (send a-list-box set (todo-show-order data-path))
                     ])))])

(new button% [parent panel]
     [label "Clear"]
     [callback(λ (button event)
                (let
                    ([a-text (send todo-field get-editor)])
                  (send a-text erase)))])
                 

(define a-list-box (new list-box%
                        [label "You can delete todo by double-click."]
                        [parent frame]
                        [min-height 400]
                        [style (list 'single 'vertical-label)]
                        [choices (todo-show-order data-path)]
                        [callback
                         (λ (c event)
                           (case (send event get-event-type)
                             [(list-box-dclick)
                              (todo-remove data-path (first (send c get-selections)))
                              (send c set (todo-show-order data-path))
                              ]))]))

(send frame show #t)
