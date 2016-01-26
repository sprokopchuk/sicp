#lang racket

(require rackunit)

(define (square n) (* n n))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;;;
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5) ;5
(new-if (= 1 1) 0 5) ;0

(define (sqrt-iter1 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter1 (improve guess x)
                     x)))

(define (sqrt x)
  (sqrt-iter1 1.0 x))

;(sqrt 9)
; Будет ошибка переполнения стэка. Перед вычислением функции new-if должно быть вычислено значение функции 
; sqrt-iter1, которая рекурсивно вызывается.      