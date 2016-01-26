#lang racket

(require rackunit)

(define (cube n) (* n n n))
(define (square n) (* n n))


(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) 1e-10))


(define (cube-iter guess x)
  (if (good-enough? guess x)
          guess
          (cube-iter (improve guess x)
                     x)))

(define (cube-root x)
  (if (= x 0)
      0
      (cube-iter 1.0 x)))


(check-= (cube-root 27) 3 1e-10) ;;; 

(check-= (cube-root 1e-28) 0 1e-5);;; 

(check-= (cube-root 1e+25) 215443469.0031881 1e-5);;;

