#lang racket

(require racket/class)

(println "study class and object.")

(define monster%
  (class object%
    (init a-name a-health)
                   
    (define _name a-name)
    (define _health a-health)

    (define/public (get-name) _name)
    (define/public (get-health) _health)
    (define/public (heal) (+ _health 10))

    (super-new)))

(define slime1 (new monster%
                    [a-name "slime"]
                    [a-health 16]))

(send slime1 get-name)
(send slime1 get-health)
(send slime1 heal)
(send slime1 get-health)