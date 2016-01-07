#lang racket

(require rackunit)

(define (square n) (* n n))

(define (average x y)
   (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) 0.001))


(define (cube-iter guess x)
  (if (good-enough? guess x)
          guess
          (cube-iter (improve guess x)
                     x)))

(define (cube-root x)
  (if (= x 0)
      0
      (cube-iter 1.0 x)))

(cube-root 27) 


