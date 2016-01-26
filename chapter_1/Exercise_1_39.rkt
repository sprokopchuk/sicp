#lang racket

(require rackunit)
(require math/number-theory)
(require math/base)

(define (tan-cf-iter x k result)
  (cond ((< k 2) (/ x (- 1 result)))
        ((even? k) (tan-cf-iter x (- k 1) result))
        (else (tan-cf-iter x (- k 1) (/ (expt x 2) (- k result))))))


(define (tan-cf x k)
  (tan-cf-iter x k 0))


(tan-cf 0 100); 0
(tan-cf (/ 3.14 4) 10000) ; 1
(tan-cf (/ 3.14 3) 10000) ; 1.732
