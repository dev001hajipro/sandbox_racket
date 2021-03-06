#lang slideshow

(require pict/flash)
(require slideshow/code)
(require racket/class
         racket/gui/base)

(define-syntax pict+code
  (syntax-rules ()
    [(pict+code expr)
     (hc-append 10
                expr
                (code expr))]))

(define f (new frame%
               [label "藝術"]
               [width 300]
               [height 300]
               [alignment '(center center)]))

(define (add-drawing p)
  (let ([drawer (make-pict-drawer p)])
    (new canvas%
         [parent f]
         [style '(border)]
         [paint-callback (lambda (self dc)
                           (drawer dc 0 0))])))


(add-drawing (pict+code (circle 10)))
(add-drawing (colorize (filled-flash 50 50) "green"))
(send f show #t)
