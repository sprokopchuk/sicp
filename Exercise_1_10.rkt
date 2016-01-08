#lang racket

(require rackunit)

(define (A x y)
  (cond ((= y 0) 0)                                                                                                                                                                                                                           
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;(A 1 10) ;;1024
(A 2 4) ; 65536
; (A 3 3) ; 65536

(define (f n) (A 0 n)) ; 2n
(define (g n) (A 1 n)); 2 в степени n 
(define (h n) (A 2 n)); Неправильно! 2 в степени 2*(n - 1) 


(check-equal? (f 10) (* 2 10))
(check-equal? (f 100) (* 2 100))
(check-equal? (f 1000) (* 2 1000))
(check-equal? (f 20000) (* 2 20000))


(check-equal? (g 6) 64) ; 2^6 = 64
(check-equal? (g 14) 16384) ; 2^14 = 16384


(check-equal? (h 4) 65536) ; 2^(7 - 1) = 65536
(check-equal? (h 3) 16) ; 2^5 = 9765625