
; Tail recursion

(define (replicate x n)
  (define (replicate-helper x n lst)
      (if (= n 0)
          lst
          (replicate-helper x (- n 1) (append (list x) lst))
        )
    )
  (replicate-helper x n '())
)

(define (accumulate combiner start n term)
    (if (= n 0)
        start
        (combiner (term n) (accumulate combiner start (- n 1) term))
      )
)

(define (accumulate-tail combiner start n term)
  (if (= n 0)
        start
        (accumulate-tail combiner (combiner (term n) start) (- n 1) term)
      )
)

; Streams

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
  (cons-stream 3 (map-stream (lambda (x) (+ x 3)) multiples-of-three))
)

(define (check s)
  (if (or (null? (cdr-stream s)) (> (car s) (car (cdr-stream s))) )
      (cons (car s) nil)
      (cons (car s) (check (cdr-stream s)))
  )
)

(define (skip s k)
  (if (or (= k 0) (null? s))
    s
    (skip (cdr-stream s) (- k 1))
  )
)

(define (nondecreastream s)
    (if (null? s)
      nil
      (cons-stream (check s) (nondecreastream (skip s (length (check s)))))
    )
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))







