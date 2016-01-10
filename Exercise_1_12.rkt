#lang racket

(require rackunit)
; m - номер строки
; n - номер элемента в строке
; нумерация с нуля
; Пускай необходимо вычислить элемент в 7(m) строке 3-й(n) элемент. Это будет 35. 
; Он является суммой второго(n-1) и третьего(n) элементов в шестой(m-1) строке.

(define (pascal-triangle m n)
  (cond ((or (= m n 0) (= m n) (= n 0)) 1)
        ((> n m) false)
        (else (+ (pascal-triangle (- m 1) (- n 1)) (pascal-triangle (- m 1) n)))))

(check-equal? (pascal-triangle 5 3) 10)
(check-equal? (pascal-triangle 6 3) 20)
(check-equal? (pascal-triangle 7 3) 35)
