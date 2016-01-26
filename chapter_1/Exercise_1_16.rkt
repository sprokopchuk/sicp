#lang racket

(require rackunit)

; Рекурсивный процесс 
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))


(define (square n)(* n n))
(define (even? n)
(= (remainder n 2) 0))

; Итерактивный процесс
;

(define (fast-expt1 b n)
  (fast-expt-iter 1 b n))

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter a (square b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))



(check-equal? (fast-expt 2 10) (fast-expt1 2 10))

(check-equal? (fast-expt 3 5) (fast-expt1 3 5))

(check-equal? (fast-expt -3 5) (fast-expt1 -3 5))

(fast-expt1 2 1000)