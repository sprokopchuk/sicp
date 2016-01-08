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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
(cube-root 27) 
=======
(cube-root 27)
>>>>>>> 535e74a... Add some tests. Exercise 1.8

(cube (cube-root 27)) ;;; 27.000014608735402

<<<<<<< HEAD
=======
(check-= (cube-root 27) 3 1e-10) ;;; 

(check-= (cube-root 1e-28) 0 1e-5);;; 

(check-= (cube-root 1e+25) 215443469.0031881 1e-5);;;

>>>>>>> f6a95a5... Add tests for checks. Exercise 1.8
=======
(cube (cube-root 1e-28));;; 1.6983889754480276e-28

(cube (cube-root 1e+45));;;1.0000000000000001e+45
>>>>>>> 535e74a... Add some tests. Exercise 1.8
=======
(cube-root 27)
=======
(check-= (cube-root 27) 3 1e-10) ;;; 
>>>>>>> 288cab6... Add tests for checks. Exercise 1.8

(check-= (cube-root 1e-28) 0 1e-5);;; 

(check-= (cube-root 1e+25) 215443469.0031881 1e-5);;;

<<<<<<< HEAD
(cube (cube-root 1e+45));;;1.0000000000000001e+45
>>>>>>> 942707b... Add some tests. Exercise 1.8
=======
>>>>>>> 288cab6... Add tests for checks. Exercise 1.8
