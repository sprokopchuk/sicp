#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; Покажите, что золотое сечение φ (раздел 1.2.2) есть неподвижная точка трансформации
; x  → 1 + 1/x, и используйте этот факт для вычисления φ с помощью процедуры fixed-point.
; Золотое сечение: φ^2 = φ + 1
; φ = 1.618
; Имеем функцию следующего вида: y = x^2 - 1 при которой φ = 1.618 является неподвижной точкой.
; Пускай y1 = x, и функция x^2 - 1 → x, можно данную трансформацию заменить на следующую x^2 → x + 1.
; Если поделить на x получим следующую трансформаицю x → 1/x + 1.

(define (golden-ratio x)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))

(golden-ratio 0.1)