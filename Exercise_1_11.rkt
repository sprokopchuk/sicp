#lang racket

(require rackunit)


(define (dec n) (- n 1))

;;Рекурсивный процесс
(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n  1)) (f-rec (- n 2)) (f-rec (- n 3)))))

;; Итеративный процесс

(define (f-iter n)
  (f-count 0 1 2 n))


(define (f-count a b c count)
  (cond ((= count 0) a) 
        ((= count 1) b)
        ((= count 2) c)
        ((>= count 3) (f-count b c (+ a b c) (- count 1)))))

(check-equal? (f-rec 10) (f-iter 10))
(check-equal? (f-rec 25) (f-iter 25))

