#lang racket

(require gregor)

; file io

(define out-port (open-output-file "/tmp/tmp.txt" #:exists 'update))
(displayln "こんにちは世界11" out-port)
(displayln (now  #:tz "Asia/Tokyo") out-port)
(close-output-port out-port)

;;

(with-output-to-file "myfile.bak"
  (λ () (display "(a 1 b 2)")) #:exists 'replace)
(define lst
  (with-input-from-file "myfile.bak"
    (λ () (read))))
(print lst)