#lang racket

(define (all-positive? lst)
    (cond ((null? lst) #t)
        ((not (number? (car lst))) #f)
        ((< (car lst) 0) #f)
        (else (all-positive? (cdr lst)))))

(all-positive? '(4 0 6))
(all-positive? '())
(all-positive? '(4 hello 2))
(all-positive? '(4 -6 2))