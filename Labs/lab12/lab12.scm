(define (partial-sums stream)
  (define (helper curr stream)
  	(if (null? stream)
  		nil
  		(cons-stream (+ curr (car stream)) (helper (+ curr (car stream)) (cdr-stream stream)))
  	)
  )
  (helper 0 stream)
)