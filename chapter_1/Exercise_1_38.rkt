#lang racket

(require rackunit)

(define (cont-frac n d k)
  (define (cont-frac-iter n d k result)
  (if (> k 0)
      (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) result)))
      result))
  (cont-frac-iter n d k 1))
 

(define (calc-e k)
  (+ 2 (cont-frac (lambda (i) 1.0) (lambda (i) (if (even? i) i 1)) k)))

(calc-e 10) ;2.738885735906167
(calc-e 100000) ;2.7388857357447036

