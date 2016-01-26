#lang racket

(require rackunit)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x)(* x x))

(define (repeated f n)
  (if (> n 1)
      (compose (repeated f (- n 1)) f)
      (lambda (x) (f x))))


(define (smooth f)
  (define dx 0.00001)    
  (lambda (x) (/ (+ (f (+ x dx)) (f x) (f (- x dx))) 3)))

((smooth square) 10); 100.00000000006666
(square 10); 100

; n-кратно сглаженная функция с помощью smooth и repeated
(define (smooth-n f n)
  ((repeated smooth n) f))

((smooth-n square 5) 10) ; 100.00000000033334