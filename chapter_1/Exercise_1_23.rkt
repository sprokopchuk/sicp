#lang racket

(require rackunit)
(require math/number-theory)


(define (square n)(* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next num)
  (if (= num 2) 3 (+ num 2)))

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

; Ниже указаны расчеты времени до и после введения функции next
; при которой должны ожидать двукратного ускоренния проверки  
(search-for-primes 1000000000000) ; 10^12
; до 76 после 56.     76/56 = 1.36  
; до 92 после 51      92/51 = 1.8
; до 76 после 51      76/51 = 1.49 
(search-for-primes 10000000000000) ; 10^13
;до 254 после 174    254/174 = 1.46
;до 241 после 169    241/169 = 1.43
;до 242 после 161    242/161 = 1.50

(search-for-primes 1000000000000000) ; 10^15
;до 2528 после 1681  2528/1681 = 1.50
;до 2586 после 1623  2586/1623 = 1.60
;до 3135 после 1631  3135/1631 = 1.92

; Как видим ускорение проверки в среднем улучшилось в 1.5 раза.
; В данном случае двукратного ускоренния проверки не произошло, потому,
; что число шагов пропорционально sqrt(n), а не n.
; Из предыдущего упражнения 1.22 было показано, что число шагов в одном случае было
; пропорционально 3, а во втором 10. Если теперь количество шагов разделить на 2, получим
; следующую картину:
; 1) Число шагов ~ 3. 3/2 = 1.5
; 2) Число шагов ~ 10. 10/6 = 1.67.




