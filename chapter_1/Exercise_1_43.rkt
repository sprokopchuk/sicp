#lang racket

(require rackunit)

(define (square x)
  (display x)
  (newline)  
  (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (> n 1)
      (compose (repeated f (- n 1)) f)
      (lambda (x) (f x))))

(check-equal? ((repeated square 1) 5) 25)
(check-equal? ((repeated square 2) 5) 625)
(check-equal? ((repeated square 3) 5) 390625)
(check-equal? ((repeated square 4) 5) 152587890625)
(check-equal? ((repeated square 5) 5) 23283064365386962890625)
