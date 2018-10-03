#lang racket

(require racket/gui/base)

(define frame (new frame%
                   [label "Todo app"]
                   [width 640]
                   [height 480]))

(define msg (new message%
                 [parent frame]
                 [label "No events so far..."]))

(define panel (new horizontal-panel% [parent frame]))

(new button% [parent panel]
     [label "Click Me"]
     [callback(λ (button event)
                (send msg set-label "Button clicked"))])

(new button% [parent panel]
     [label "Pause"]
     [callback(λ (button event) (sleep 5))])
                 

(define my-canvas%
  (class canvas%
    (define/override (on-event event)
      (send msg set-label "Canvas mouse"))
    (define/override (on-char event)
      (send msg set-label "Canvas keyboard"))
    (super-new)))

(new my-canvas% [parent frame]
     [vert-margin 10]
     [horiz-margin 10]
     [paint-callback
      (λ (canvas dc)
        (send dc set-text-foreground "blue")
        (send dc draw-text "hello world!" 10 10))])

(send frame show #t)