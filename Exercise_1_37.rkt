#lang racket

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


(cont-frac2 (lambda (i) 1.0) (lambda (i) 1.0) 10)
(cont-frac1 (lambda (i) 1.0) (lambda (i) 1.0) 10) ; 0.6180555555555556 
(/ 1 1.618) ; 0.6180469715698392