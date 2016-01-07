#lang racket
(require rackunit)
(define (a-plus-abs-b a b) ((if (> b 0) + -) b a))

(check-eq? (a-plus-abs-b 1 (- 4)) -5)
(check-eq? (a-plus-abs-b 1 4) 5)
;;;; Если число b больше 0 будет выполнена операция сложения a и b
;;;; Если число b меньше 0 будет выполнена операция вычитания a и b


