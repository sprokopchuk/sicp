#lang racket

(require rackunit)
(require math/number-theory)
(require math/base)


(define (filtered-accumulate predicate combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((predicate a) (combiner (term a)
                                 (filtered-accumulate predicate combiner null-value term (next a) next b)))
        (else (filtered-accumulate predicate combiner null-value term (next a) next b))))

; Запишите filtered-accumulate в виде процедуры. Покажите, как с помощью
; filtered-accumulate выразить следующее:
; а. сумму квадратов простых чисел в интервале от a до b (в предположении, что
; процедура prime? уже написана);

(define (square n)(* n n))


(define (sum-squares-primes a b predicate)
  (define (next-prime a)(+ a 1))
  (filtered-accumulate predicate + 0 square a next-prime b))


(check-equal? (sum-squares-primes 1 5 prime?) 38)
(check-equal? (sum-squares-primes 1 10 prime?) 87)

; б. произведение всех положительных целых чисел меньше n, которые просты по
; отношению к n (то есть всех таких положительных целых чисел i < n, что НОД(i, n) = 1).

(define (product-integers n)
  (define (prime-to-n? i)(= (gcd i n) 1))
  (define (next-integer i)(+ i 1))
  (define (plus-zero x)(+ x 0))
  (filtered-accumulate prime-to-n? * 1 plus-zero 1 next-integer n))

(check-equal? (product-integers 10) 189)
(check-equal? (product-integers 12) 385)

