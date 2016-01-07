#lang racket

(require rackunit)

(define (square n) (* n n))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

;Альтернативный подход к реализации good-enough? состоит 
;;в том, чтобы следить, как от одной итерации к другой 
;изменяется guess, и остановиться, когда изменение оказывается небольшой долей значения приближения

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) 1e-10))

(define (sqrt-iter1 guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter1 (improve guess x)
                     x)))

(define (sqrt1 x)
  (sqrt-iter1 1.0 x))

(sqrt1 1e-28) ;;1.1641532211326597e-10
(sqrt 1e-28) ;;1e-14
(sqrt1 1e+55) ;;3.1622776601683794e+27
(sqrt 1e+55) ;;;3.1622776601683794e+27

