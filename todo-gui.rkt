#lang racket

(require racket/gui/base)
(require "common-util.rkt"
         "todo-api.rkt")


(define frame (new frame%
                   [label "Todo app"]
                   [width 640]
                   [height 480]))

(define msg (new message%
                 [parent frame]
                 [label "No events so far..."]))

(define panel (new horizontal-panel% [parent frame]))

(define todo-field
  (new text-field% [parent panel]
       [label "todo"]
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
                     (send a-text erase)])))])

(new button% [parent panel]
     [label "Clear"]
     [callback(λ (button event)
                (let
                    ([a-text (send todo-field get-editor)])
                  (send a-text erase)))])
                 

(send frame show #t)

(define data-path (store-path data-file))
(displayln data-path)
