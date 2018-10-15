#lang racket

; `継続(continution)`の学習
; call-with-current-continution(call/cc)
; https://ja.wikibooks.org/wiki/Scheme/%E7%B6%99%E7%B6%9A

(define (double x)
  (* x x))

(define (add1 n)
  (+ n 1))

(double 5)
(add1 5)

(define (cb x y) (* x y))

(((λ (x)
    (λ (y)
      (cb x y)))
  1)2)

(define (f x) x)
(define (g x) x)
(define (h x) x)
(define (i x) x)


; 1 => f => g => h => 1
; 1 => f => i => f => 1
(h (g (f 1)))
(h (i (f 1)))

; v:100 => f => (cont-proc 1) => h => 1
(define v 100)
(h
 (call/cc
  (λ (cont-proc)
    (let ([f-ret (f v)])
      (cont-proc 1)
      (printf "cont-proc以降は呼び出されない\n")
      (g v)
      ))))

;;
(printf "****1 continution\n")
(h 1)

; 継続は、関数と関数の間を操作できます。
(define reuse #f)
(h
 (call/cc
  (λ (cont-proc)
    (let ([f-ret (f 9999)])
      (set! reuse cont-proc) ; set!なので次の関数は呼び出される
      (printf "before call g\n")
      (g f-ret)
      ))))
; (h 9999)

(printf "****2 continution\n")
(printf "reuse is ~a.\n" reuse)
(printf "(reuse 99) is ~a.\n" (reuse 99))


