#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
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

(define (f-power x)
  (fixed-point (lambda (y) (/ (log 1000) (log x)))
               1.0))

(f-power 2) ; Без торможения усреднением количество шагов 2.

(define (average x y)
  (* 0.5 (+ x y)))

(define (f-power-average x)
  (fixed-point (lambda (y) (average y (/ (log 1000) (log x))))
               1.0))

(f-power-average 2) ; С торможением усреднением количество шагов 20 