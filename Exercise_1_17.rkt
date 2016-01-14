#lang racket

(require rackunit)

(define (even? n)
  (= (remainder n 2) 0))
; Предположим теперь, что, наряду со сложением, у нас есть операции double, которая удваивает
; целое число, и halve, которая делит (четное) число на 2. Используя их, напишите процедуру,
; аналогичную fast-expt, которая затрачивает логарифмическое число шагов.

(define (double n)(* 2 n))

(define (halve n)
  (if (even? n) (/ n 2) false))

(define (square n)
  (if (halve n)
      (* (halve n) (double n))
      (+ (* (halve (- n 1)) (double n)) n)))

(define (fast-expt2 b n)
  (fast-expt-iter2 1 b n))

(define (fast-expt-iter2 a b n)
  (cond ((= n 0) a)
        ((halve n) (fast-expt-iter2 a (square b) (halve n)))
        (else (fast-expt-iter2 (* a b) b (- n 1)))))



(check-equal? (fast-expt2 3 2) 9)
(check-equal? (fast-expt2 -3 3) -27)
(check-equal? (fast-expt2 5 4) 625)



