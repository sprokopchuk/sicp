#lang racket


(define (cube x) (* x x x))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum2 f (+ a (/ dx 2)) add-dx b)
     dx))

; Линейный рекурсивный процесс
(define (sum1 term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum1 term (next a) next b))))


; Итеративный процесс 
(define (sum2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))


(integral cube 0 1 0.01)


