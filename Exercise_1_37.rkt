#lang racket


(require rackunit)

; Рекурсвиный процесс
(define (cont-frac1 n d k)
  (if (> k 0)
      (/ (n k) (+ (d k) (cont-frac1 n d (- k 1))))
      (/ (n 0) (d 0))))

; Итеративный процесс

(define (cont-frac2 n d k)
  (define (cont-frac-iter n d k result)
  (if (> k 0)
      (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) result)))
      result))
  (cont-frac-iter n d k 1))


(check-= (cont-frac1 (lambda (i) 1.0) (lambda (i) 1.0) 10) (/ 1 1.618) 1e-4) ; 0.6180555555555556
(check-= (cont-frac2 (lambda (i) 1.0) (lambda (i) 1.0) 10) (/ 1 1.618) 1e-4) ; 0.6180555555555556 