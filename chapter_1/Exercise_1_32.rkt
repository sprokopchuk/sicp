#lang racket

; Рекурсивный процесс
(define (accumulate1 combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate1 combiner null-value term (next a) next b))))

; Итеративный процесс

(define (accumulate2 combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))


; Определение sum с помощью accumulate

(define (sum term a next b)
  (accumulate2 + 0 term a next b))

; Использование sum для вычисления интеграла


(define (cube x) (* x x x))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(integral cube 0 1 0.01)

; Определение product с помощью accumulate

(define (product term a next b)
  (accumulate2 * 1 term a next b))

; Использование product для вычисления числа Пи через формулу Джона Уоллиса.

(define (f n)
  (if (even? n) (/ n (+ n 1)) (/ (+ n 1) n)))

(define (pi-product a b)
  (define (next a)(+ a 1))
  (product f a next b))


(* 4 (pi-product 2.0 1000))