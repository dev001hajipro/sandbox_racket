#lang racket
(require simple-http)

; Setup a json-request using SSL and pointed at httpbin.org
(define httpbin-org
  (update-headers
    (update-ssl (update-host json-requester "httpbin.org") #t)
   '("Authorization: 8675309")))
 
; Query params for the request
(define params '((foo . "12") (bar . "hello")))
 
; Make a GET to https://httpbin.org/get?foo=12&bar=hello
(define response (get httpbin-org "/get" #:params params))

(json-response-status response)
(json-response-body response)

(define (make-req url)
  (update-headers
   (update-ssl (update-host json-requester url) #t)
   '("client: racket http client")))

(define res
  (get (make-req "qiita.com")
       "/api/v2/tags?page=1&per_page=20&sort=count"))
(json-response-body res)
                 
                  

