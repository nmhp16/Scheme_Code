#lang racket

;; Math operations
(+ 1 2) ; 3
(* 3 4) ; 12
(- 5 6) ; -1
(/ 7 8) ; 0.875
(* (+ 2 3 4) (- 7 6) 2) ; 20

;; Define a list
(quote (1 2 3 4 5)) ; List of number
(quote (a b c d e)) ; List of symbols
(quote ("a" "b" "c" "d" "e")) ; List of strings
(quote (red green blue)) ; List of symbols

;; Binding the list of symbols to a variable
(define colors(quote (red green blue))) 
colors ; (red green blue)

;; How to access the string
(car colors) ; red, car returns the first element of the list
(cdr colors) ; (green blue), cdr returns the rest of the list
(cadr colors) ; green, cadr returns the second element of the list
(cddr colors) ; (blue), cddr returns the rest of the list after the first and second element

(define xs '(1 2 3 4 5))
(cadddr xs) ; 4, caddr returns the third element of the list
;; Each d in caddr means to skip one element in the list and return the next element

;; Cons and Pairs
(cons 1 2) ; (1 . 2), cons creates a pair
(define pair (cons 1 2))
(car pair) ; 1 , car returns the first element of the pair
(cdr pair) ; 2, cdr returns the second element of the pair

;; Nested pairs
(define pair2 (cons (cons 1 2) 3))
(car pair2) ; (1 . 2), car returns the first element of the pair
(cdr pair2) ; 3, cdr returns the second element of the pair

;; Pairs to List
(define pair3 (cons 1 '())) 
pair3 ; (1), pair3 is a list
(cons 2 pair3) ; (2 1), cons adds an element to the front of the list
(cons 3 (cons 2 pair3)) ; (3 2 1)

;; List vs Quote
(define a 1)
(define b 2)
(list a b) ; (1 2), list creates a list of the values of the variables
(quote (a b)) ; (a b), quote creates a list of the symbols
(define num '(1 2))
(cons 3 num) ; (3 1 2), cons adds an element to the front of the list

;; Null 
(null? '()) ; #t, null? checks if the list is empty
(null? '(1 2 3)) ; #f

;; Equal
(equal? 1 1) ; #t, equal? checks if the two values are equal
(equal? 1 2) ; #f

;; if statement
(if (= 1 1) 2 3) ; 2, if the condition is true, return the first value, else return the second value
(if (= 1 2) 2 3) ; 3
(define grade 85)
(if (>= grade 90) "A" 
    (if (>= grade 80) "B"
        (if (>= grade 70) "C"
            (if (>= grade 60) "D"
                "F"))))

;; cond statement
(cond ((>= grade 90) "A")
      ((>= grade 80) "B")
      ((>= grade 70) "C")
      ((>= grade 60) "D")
      (else "F")) ; cond is a more readable version of nested if statements

;; lambda function
;; The difference between lambda and define is that lambda creates an anonymous function and define creates a named function
(lambda (x) (+ x 1)) ; #<procedure>, lambda creates an anonymous function
((lambda (x) (+ x 1)) 2) ; 3, apply the lambda function to the argument
(define add1 (lambda (x) (+ x 1))) ; define a named function 
(define (increment x) (+ x 1)) ; define a named function
(add1 2) ; 3

;; Square function
(define (square x) 
    (* x x)
    )
(square 3) ;; 9
;; (square 2 3) ; Error, square only takes one argument

;; Average function
(define (average x y)
    (/ (+ x y) 2) 
    )
(average 2 3) ;; 2.5

;; passing? function
(define (passing? grade)
    (>= grade 70)
    )
(passing? 70) ; #t