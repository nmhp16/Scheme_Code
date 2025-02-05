#lang racket

(+ 1 2)
(* 3 4)
(- 5 6)
(/ 7 8)

(define (sum-list lst)
    (if (null? lst)
        0
        (+ (car lst) (sum-list (cdr lst)))))