#lang racket

(provide (all-defined-out))

(define (create-file f)
  (let
      ([out-port (open-output-file f #:exists 'can-update)])
    (close-output-port out-port)))

(define (store-path data-file)
  (build-path
   (find-system-path 'home-dir) 
   data-file))

(define (delete-file-c f)
  (cond
    [(file-exists? f) (delete-file f)]))

(define (addlast lst s)
  (append lst (list s)))

(define (write-file f lst)
  (display-to-file
   (string-join lst "\n" #:after-last "\n")
   f
   #:exists 'replace))