#lang racket

(require rackunit)

(define (pow x n) 
  (pow-iter x n 1))

(define (pow-iter x n res)
  (if (= n 0) res (pow-iter x (- n 1) (* x res))))

(define (h-aker n)
  (h-aker-iter n 1))
(define (h-aker-iter n res)
  (if (= n 0) res (h-aker-iter (- n 1) (pow 2 res))))  


(define (A x y)
  (cond ((= y 0) 0)                                                                                                                                                                                                                           
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;(A 1 10) ;;1024
;(A 2 4) ; 65536
; (A 3 3) ; 65536

(define (f n) (A 0 n)) ; 2n

(define (g n) (A 1 n)); 2 в степени n 
(define (h n) (A 2 n)); 2^(2^(2^ ...n - 1)))

; Пускай необходимо вычислить чему равно (h 6)
; (h 6) 
; (A 1 (A 2 5)) 
; (A 1 (A 2 4)) 
; (A 1 (A 2 3)) 
; (A 1 (A 2 2))
; (A 1 (A 2 1)) 
; (A 2 1) равно 2. (A 1 2) равно 2 в степени 2.
; (A 1 2^2)
; (A 1 (2^(2^2)))
; (A 1 (2^(2^(2^2))))
; (A 1 (2^(2^(2^(2^2)))))

(check-equal? (f 10) (* 2 10))
(check-equal? (f 100) (* 2 100))
(check-equal? (f 1000) (* 2 1000))
(check-equal? (f 20000) (* 2 20000))


(check-equal? (g 6) (pow 2 6)) ; 2^6 = 64
(check-equal? (g 14) (pow 2 14)) ; 2^14 = 16384


(check-equal? (h 5) (h-aker 5)) ; 
(check-equal? (h 4) (h-aker 4)) ; 
(check-equal? (h 3) (h-aker 3)) ;