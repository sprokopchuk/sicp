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
  (if (< count 3)
      (+ a count)
      (f-count  (+ count count))))

;(f-rec 32)
(f-iter 10)
;(f-rec 10)
;(check-equal? (f-rec 10) (f-iter 10))


