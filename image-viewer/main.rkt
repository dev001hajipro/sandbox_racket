#lang racket

(require racket/gui)

(define frame (new frame%
                   [label "Racket Image Viewr"]
                   [width 640]
                   [height 480]))

(define msg (new message%
                 [parent frame]
                 [label ""]))

(define current-bitmap (make-bitmap 256 256))

(define custom-canvas%
  (class canvas%
    (define/override (on-event event)
      (send msg set-label "Canvas mouse"))
    (define/override (on-char event)
      (send msg set-label "Canvas keyboard"))
    (super-new)))

(define v-custom-canvas
  (new custom-canvas%
       [parent frame]
       [paint-callback
        (λ (canvas dc)
          (send dc set-scale 1 1)                                
          (send dc draw-bitmap-section
                current-bitmap 0 0 0 0
                (send current-bitmap get-width)
                (send current-bitmap get-height)))]))

(define file-formats
  '(("Any image format" "*.png;*.jpg;*.jpeg;*.bmp;*.gif")
    ("Portable newtwork graphics" "*.png")
    ("JPEG" "*.jpg;*.jpeg")
    ("Bitmap" "*.bmp")
    ("Graphics interchange format" "*.gif")
    ("Any" "*.*")))

(new button%
     [parent frame]
     [label "Open Image"]
     [callback (λ (button event)
                 (let* ([filepath (get-file "Open image" frame "." #f #f null file-formats)])
                   (set! current-bitmap (read-bitmap filepath))
                   (send v-custom-canvas refresh-now)
                   (send msg set-label "Image loaded!")))])

(send frame show #t)