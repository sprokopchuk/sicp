#lang racket

(require math/number-theory)
(require math/base)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-natural (- n 1)))))

(define (square n)(* n n))

(define (divides? a b)
  (= (remainder b a) 0))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-process-milliseconds)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (current-process-milliseconds) start-time))
      false))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes num)
  (search-for-primes-iter num 3))

(define (search-for-primes-iter num count)
  (cond ((= count 0) (void))
        ((even? num) (search-for-primes-iter (+ num 1) count))
        ((prime? num) (timed-prime-test num) (search-for-primes-iter (+ num 1) (- count 1)))
        (else (search-for-primes-iter (+ num 1) count))))

; Ниже указано время на проверку до и после введения метода Ферма у которого
; порядок роста O(log n). До введения метода Ферма порядок роста был O(sqrt(n)).
; При введении метода Ферма должно быть соотношение времени на выполнения вычислений
; должно быть равным sqrt(n)/log(n).
; Как видим из результатов метод Ферма для проверки чисел на простоту лучше, вычисляется он быстрее.

(search-for-primes 1000000000000) ; 10^12
; до 76 после 1
; до 92 после 1
; до 76 после 0
(search-for-primes 10000000000000) ; 10^13
;до 254 после 1
;до 241 после 0 
;до 242 после 1
(search-for-primes 1000000000000000) ; 10^15
;до 2528 после 1
;до 2586 после 1
;до 3135 после 1
