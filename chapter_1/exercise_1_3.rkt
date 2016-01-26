#lang racket

(require rackunit)

(define (square n) (* n n))

(define (max-num x y)
  (if (>= x y) x y))

(define (sum-squares n x)
  (+ (square n) (square x)))


;; First variant
(define (sum-squares1 a b c)
   (define sorted-args (sort (list a b c) > ))
  (+ (square (list-ref sorted-args 0)) (square (list-ref sorted-args 1)))
  )

;; Second variant

(define (sum-squares2 a b c)
  (if (> (max-num b c) (max-num b a)) 
      (sum-squares c (max-num b a))
      (sum-squares a (max-num b c)))
  (if (< (max-num a c) (max-num b a))
      (sum-squares b (max-num a c))
      (sum-squares c (max-num a b)))
   (if (> (max-num a c) (max-num b c))
       (sum-squares a (max-num b c))
       (sum-squares b (max-num a c))))


(check-eq? (sum-squares1 1 2 3) 13) ;; 2^2 + 3^2
(check-eq? (sum-squares1 -10 -2 3) 13) ;; (-2)^2 + 3^2  
(check-eq? (sum-squares1 -10 -2 -3) 13) ;;(-2)^2 + (-3)^2  
(check-eq? (sum-squares1 1 1 1) 2) ;; 2
(check-eq? (sum-squares1 4 5 3) 41) ;; 5^2 + 4^2
(check-eq? (sum-squares1 6 15 10) 325) ;; 15^2 + 10^2
(check-eq? (sum-squares1 10 10 7) 200) ;; 10^2 + 10^2


;;;;
(check-eq? (sum-squares2 1 2 3) 13) ;; 2^2 + 3^2
(check-eq? (sum-squares2 -10 -2 3) 13) ;; (-2)^2 + 3^2  
(check-eq? (sum-squares2 -10 -2 -3) 13) ;;(-2)^2 + (-3)^2  
(check-eq? (sum-squares2 1 1 1) 2) ;; 2
(check-eq? (sum-squares2 4 5 3) 41) ;; 5^2 + 4^2
(check-eq? (sum-squares2 6 15 10) 325) ;; 15^2 + 10^2
(check-eq? (sum-squares2 10 10 7) 200) ;; 10^2 + 10^2