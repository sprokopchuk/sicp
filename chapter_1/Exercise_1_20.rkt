#lang racket

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Вычисление функции (gcd 206 40) при нормальном порядке.
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
; (remainder (remainder 206 40) (remainder 40 6))
; (remainder 6 4)
; 2
; При нормальном порядке функция remainder вычисляется 18 раз, а не все 25 раз.
; Так как при каждом вызове функции gcd необходимо вычислить только b, число a уже вычисляется когда b равняется 0.
;
; При апликативном порядке вычислений remainder будет вычислятся всего 4 раза.  