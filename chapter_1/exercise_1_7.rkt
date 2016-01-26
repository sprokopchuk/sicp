#lang racket

(require rackunit)

(define (square n) (* n n))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))


(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) 1e-10))

(define (sqrt-iter1 guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter1 (improve guess x)
                     x)))

(define (sqrt1 x)
  (sqrt-iter1 1.0 x))

(check-= (sqrt1 9) 3 1e-5) ;;; 3
(check-= (sqrt1 1e-28) (sqrt 1e-28) 1e-5) ;;1.1641532211326597e-10
(check-= (sqrt1 1e+55) (sqrt 1e+55) 1e-5) ;;3.1622776601683794e+27


