#lang racket


(require rackunit)
(require math/number-theory)
(require math/base)

(define (square a)(* a a))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (if (= (remainder (square (expmod base (/ exp 2) m))
                    m) 1) 0 m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))



(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 2)))))


  
(check-equal? (miller-rabin-test 563) true)  ;простое число
(check-equal? (miller-rabin-test 569) true)  ;простое число
(check-equal? (miller-rabin-test 571) true)  ;простое число
(check-equal? (miller-rabin-test 561) false)  ;число Кармайкла
(check-equal? (miller-rabin-test 1105) false)  ;число Кармайкла
(check-equal? (miller-rabin-test 3) true)  
(check-equal? (miller-rabin-test 4) false)  
