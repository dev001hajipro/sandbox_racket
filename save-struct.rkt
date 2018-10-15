#lang racket

(require gregor)
(require racket/serialize)

(struct document(author title content))
(struct book document (publisher))
(struct paper (journal) #:super struct:document)

; フィールドに#:mutable オプションを付けられる
(struct cell ([content #:mutable]) #:transparent)
(define a-cell (cell 0))
(set-cell-content! a-cell 1)
(println a-cell)

; 構造体のフィールド全体にも#:mutableを指定できる
(struct todo (author title content publish) #:mutable #:transparent)
(define todo1 (todo "dev001man" "hello todo" "make todo by struct" (now)))

(serializable? todo1)

(serializable-struct memo (id content ) #:mutable #:transparent)
(define memo1 (memo 1 "hello memo"))

(define (save memo path)
  ;replace that remove old file, if it exists.
  (let ([out-port (open-output-file path #:exists 'replace)])
    (write (serialize memo) out-port)
    (close-output-port out-port)))

(define (save-memo memo path)
  (with-output-to-file path  #:exists 'replace
    (λ () (write (serialize memo)))))

(define (load path)
  (if (file-exists? path)
      (let* ([in-port (open-input-file path)]
              [_memo (read in-port)])
        (close-input-port in-port)
        (deserialize _memo))
      '()))

(define (load-memo path)
  (if (file-exists? path)
      (deserialize (with-input-from-file path read))
      '|nofile|)) ; if file not found, return nofile symbol. (like a const string.)
  
        
(define store-path "./memo1.dat")
(save-memo memo1 store-path)
(define restore-memo1 (load-memo store-path))
(display restore-memo1)

; リストに構造体を入れて、データ保存と復元

(define (make-many-memo [n 10])
  (map (λ (n) (memo n "hello memo")) (stream->list (in-range 10))))

(save (make-many-memo) "./memo-list.dat")
(display (load "./memo-list.dat"))