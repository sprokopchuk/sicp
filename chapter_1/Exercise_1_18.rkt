#lang racket

; Используя результаты упражнений 1.16 и 1.17, разработайте процедуру, которая порождает
; итеративный процесс для умножения двух чисел с помощью сложения, удвоения и деления пополам,
; и затрачивает логарифмическое число шагов.


(require rackunit)

(define (double n)(+ n n))

(define (halve n)
  (if (even? n) (/ n 2) false))


(define (* a b)
  (*-iter a b 0))

(define (*-iter a b c)
  (cond ((= a 1) (+ c b))
        ((halve a) (*-iter (halve a) (double b) c))
        (else (*-iter (halve (- a 1)) (double b) (+ c b)))))

(check-equal? (* 3 10) 30)
(check-equal? (* 50 2) 100)
(check-equal? (* 10 10) 100)
