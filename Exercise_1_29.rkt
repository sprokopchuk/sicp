#lang racket

(require rackunit)
(require math/number-theory)
(require math/base)

(define (cube x) (* x x x))

(define (sum term a next b k)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a k) next b (+ k 1)))))


(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (next a k)
    (display k)
    (newline)
    (+ a (* k h)))  
  (sum f (next a 0) next b 0))
          


; Точное значение интеграла cube от 0 до 1 равно 1/4.


(integral-simpson cube 0 1.0 100)


