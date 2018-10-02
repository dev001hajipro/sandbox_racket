#lang racket

(require gregor)

; file io

(define out-port (open-output-file "/tmp/tmp.txt" #:exists 'update))
(displayln "こんにちは世界11" out-port)
(displayln (now  #:tz "Asia/Tokyo") out-port)
(close-output-port out-port)

;;