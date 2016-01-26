#lang racket

(require rackunit)

(define (average a b)(/ (+ a b) 2))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline) 
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (> n 1)
      (compose (repeated f (- n 1)) f)
      (lambda (x) (f x))))

(define (average-damp f)
  (lambda (x) (average x (f x))))


; Процедура для нахождения корней n-й степени
; (n/2) раза применения процедуры average-damp вполне достаточно для торможения усреднением, чтобы
; вычислить корень n-й степени

(define (root x n)
  (fixed-point ((repeated average-damp (/ n 2)) (lambda (y) (/ x (expt y (- n 1)))))
               1.0))


(root 590049 10) ; 3^10 = 590049