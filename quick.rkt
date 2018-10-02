#lang racket
;#lang slideshow
; flash.rkt file is located in the 'pict'.
(require slideshow)
(require slideshow/code)
(require pict/flash)

(define c (circle 10))
(define r (rectangle 10 20))

(define (square n)
  ; n * n
  (filled-rectangle n n))

(define (four p)
  (define two-p (hc-append p p))
  (vc-append two-p two-p))

(define (checker p1 p2)
  ; bind p12, p21
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))
            
(define (checkerboard p)
  (let* ([rp (colorize p "red")]
         [bp (colorize p "black")]
         [c (checker rp bp)]
         [c4 (four c)]) ;; x4
    (four c4)))         ;; x4

(define (series f)
  (hc-append 4 (f 5) (f 10) (f 20)))

; define form is shorthand. lambda as a value.
(define series2
         (lambda (f)
           (hc-append 4 (f 5) (f 10) (f 20))))
(define (rgb-series mk)
  (vc-append
   (series (lambda (sz) (colorize (mk sz) "red")))
   (series (lambda (sz) (colorize (mk sz) "green")))
   (series (lambda (sz) (colorize (mk sz) "blue")))))

(define (rgb-maker mk)
  (lambda (sz)
    (vc-append (colorize (mk sz) "red")
               (colorize (mk sz) "green")
               (colorize (mk sz) "blue"))))
(define (my-pow n)
  (expt n 2))

(define (rainbow p)
  (map (lambda (color)
         (colorize p color))
       '("red" "orange" "yellow" "green" "blue" "purple")))

; run imported api.
(filled-flash 40 30)

; macro
(define-syntax pict+code
  (syntax-rules ()
    [(pict+code expr)
     (hc-append 10 expr (code expr) expr)]))