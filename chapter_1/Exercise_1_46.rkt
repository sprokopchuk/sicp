#lang racket

(require rackunit)

(define (average a b)
  (/ (+ a b) 2))
(define (square x)(* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (> n 1)
      (compose (repeated f (- n 1)) f)
      (lambda (x) (f x))))

(define (average-damp f)
  (lambda (x) (average x (f x))))


; Напишите процедуру iterative- improve, которая принимает в качестве аргументов две процедуры:
; проверку, достаточно ли хоро- шо значение, и метод улучшения значения. Iterative-improve должна
; возвращать процедуру, которая принимает начальное значение в качестве аргумента и улучшает его,
; пока оно не станет достаточно хорошим. 

(define (iterative-improve close-enough? f)
  (lambda (x)
    (let ((next (f x)))
      (if (close-enough? x next)
          next
          ((iterative-improve close-enough? f) next)))))


  (define (close-enough? v1 v2)
    (define tolerance 0.00001)
    (< (abs (- v1 v2)) tolerance))

; Процедура написана с помощью iterative-improve
(define (fixed-point f first-guess)
  ((iterative-improve close-enough? f) first-guess))

; Процедура для нахождения корней n-й степени
; (n/2) раза применения процедуры average-damp вполне достаточно для торможения усреднением, чтобы
; вычислить корень n-й степени

(define (root x n)
  (fixed-point ((repeated average-damp (/ n 2)) (lambda (y) (/ x (expt y (- n 1)))))
               1.0))


(root 590049 10) ; 3^10 = 590049

; Процедура переписана с помощью iterative-improve
(define (sqrt x)
 ((iterative-improve close-enough? (average-damp (lambda (y) (/ x y)))) 1.0))

 (sqrt 9); 3^2 = 9

