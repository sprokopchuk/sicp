#lang racket

(require rackunit)
(require math/number-theory)


(define (square n)(* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-process-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
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

(search-for-primes 1000); после 1000. Наименьшие три простых числа после 1000: 1009, 1013, 1019.

(check-equal? (odd-prime? 1009) true)
(check-equal? (odd-prime? 1013) true)
(check-equal? (odd-prime? 1019) true)

(search-for-primes 10000) ; после 10 000. Наименьшие три простых числа после 10 000: 10 007, 10 0009, 10 0037.

(check-equal? (odd-prime? 10007) true)
(check-equal? (odd-prime? 10009) true)
(check-equal? (odd-prime? 10037) true)

(search-for-primes 100000) ; после 100 000. Наименьшие три простых числа после 100 000: 100 003, 100 019, 100 043.

(check-equal? (odd-prime? 100003) true)
(check-equal? (odd-prime? 100019) true)
(check-equal? (odd-prime? 100043) true)

(search-for-primes 1000000) ; после 1 000 000. Наименьшие три простых числа после 1 000 000: 1 000 003, 1 000 033, 1 000 037.

(check-equal? (odd-prime? 1000003) true)
(check-equal? (odd-prime? 1000033) true)
(check-equal? (odd-prime? 1000037) true)


; Различие между временем поиска чисел после 1000 и после 1 000 000 не было.
; Разница во времени для всех заданных чисел равна 0. Поэтому возьмем числа больше 1 миллиона.

(search-for-primes 1000000000000) ; 10^12
; 76
; 92
; 76
(search-for-primes 10000000000000) ; 10^13
;254
;241
;242

; 254/76 = 3.34
; 241/92 = 2.62
; 242/76 = 3.18
; Как видим число шагов равно в среднем 3, что приблизительно равно предположению о числе шагов процорциональное sqrt(10) = 3.16
(search-for-primes 1000000000000000) ; 10^15
;2528
;2586
;3135
; 2528/254 = 9.95
; 2586/241 = 10.73
; 3135/242 =  12.9
; В среднем число шагов пропорционально 11.21, что совпадает с предположением о числе шагов пропорциональное sqrt(n) = sqrt(100) = 10.

