#lang racket
; https://docs.racket-lang.org/draw/index.html?q=info.rkt
(require racket/draw)

(define bitmap-30x30 (make-bitmap 30 30))
; dc draw context.
(define dc (new bitmap-dc% [bitmap bitmap-30x30]))

(send dc draw-rectangle
      0 10 30 10)
(send dc draw-line
      0 0 30 30)
(send dc draw-line
      0 30 30 0)

(send bitmap-30x30 save-file "box.png" 'png)