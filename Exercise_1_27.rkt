#lang racket

;Покажите, что числа Кармайкла, перечисленные в сноске 47, действительно
;«обманывают» тест Ферма: напишите процедуру, которая берет целое число n и
;проверяет, правда ли a^n равняется a по модулю n для всех a < n, и проверьте
;эту процедуру на этих числах Кармайкла.

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
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

 ; Функция для тест Ферма переписана так, что проверяет все числа a, которое меньше n, но больше 1.
;  Если n простое число выведет true, иначе false. 
(define (fermat-test n)
  (try-it (- n 1) n true))


(define (try-it a n res)
  (if (= a 1)
      res
      (try-it (- a 1) n (and res (= (expmod (- a 1) n n) (- a 1))))))
  
(check-equal? (fermat-test 563) true)  ;простое число
(check-equal? (fermat-test 569) true)  ;простое число
(check-equal? (fermat-test 571) true)  ;простое число
(check-equal? (fermat-test 561) false)  ;число Кармайкла
(check-equal? (fermat-test 1105) false)  ;число Кармайкла
(check-equal? (fermat-test 3) true)  
(check-equal? (fermat-test 4) false)  
; Число Кармайкла 561
; Простые числа 563, 569, 571.
           