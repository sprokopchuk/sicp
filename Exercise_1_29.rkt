#lang racket

(require rackunit)
(require math/number-theory)
(require math/base)

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (next a)
    (+ a (* 2 h)))  
  (* (/ h 3) (+ (cube (next a))
                (* 4 (sum f (+ a h) next b))
                (* 2 (sum f (+ a h) next b))
                (cube b))))
          


; Точное значение интеграла cube от 0 до 1 равно 1/4.

(integral-simpson cube 0 1.0 100) ; при n = 100
(integral-simpson cube 0 1.0 1000) ; при n = 1000