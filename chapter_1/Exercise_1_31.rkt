#lang racket

(require rackunit)

; Рекурсивный процесс
(define (product1 term a next b)
  (if (> a b)
      1
      (* (term a)
         (product1 term (next a) next b))))

; Итеративный процесс

(define (product2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

; Вычисление факториала с помощью product1 или product2
(define (factorial n)
  (define (next a)(+ a 1))
  (product1 + 1 next n))

(check-equal? (factorial 5) 120)
(check-equal? (factorial 6) 720)
(check-equal? (factorial 3) 6)

; Вычисление числа Пи через формулу Джона Уоллиса.

(define (f n)
  (if (even? n) (/ n (+ n 1)) (/ (+ n 1) n)))

(define (pi-product a b)
  (define (next a)(+ a 1))
  (product2 f a next b))


(* 4 (pi-product 2.0 1000))