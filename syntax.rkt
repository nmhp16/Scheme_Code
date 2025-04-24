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
    (>= grade 70) ; No need for if statement
    )
(passing? 70) ; #t

;; Sum-two function, return sum of two first element of the list
(define (sum-two xs)
    (cond ((null? xs) 0)
         ((null? (cdr xs)) 0)
         (else (+ (car xs) (cadr xs))))
    )   
(sum-two '(1 2 3 4 5)) ; 3

;; or function returns the first true value or #f if all are false
(or '() '(1 2 3) (< 4 10)) ; #t, or returns the first true value

;; and function returns the first false value or #t if all are true
(and '() '(1 2 3) (< 4 10)) ; (), and returns the first false value

;; Recursive
; (define (member? element list)
;     (cond (null? list) #f)
;         ((equal? element (car list)) #t)
;         (else (member? element (cdr list))))

(define (member? element list)
    (if (null? list)
        #f
        (or (equal? element (car list)) 
            (member? element (cdr list)))))

(member? 5 '(4 3 1 2))
(member? 5 '(4 2 1 2 5))

;; Higher Order Functions

;; Function that takes other function as an argument
(define (apply-to-all f lst)
    (if (null? lst)
        '()
        (cons (f (car lst)) (apply-to-all f (cdr lst)))))

(apply-to-all square '(1 2 3 4 5)) ;; (1 4 9 16 25)

;; Tail Recursion Example
(define (sum-list lst) ;; Define a function sum-list that takes a list as input
    (define (sum-list-helper lst acc) ;; Define a helper function sum-list-helper that takes a list and an accumulator
        (if (null? lst) ;; If the list is empty
            acc ;; Return the accumulator
            (sum-list-helper (cdr lst) (+ (car lst) acc)))) ;; Otherwise, recursively call sum-list-helper on the rest of the list and add the first element to the accumulator
    (sum-list-helper lst 0)) ;; Call sum-list-helper with the input list and an initial accumulator of 0

(sum-list '(1 2 3 4 5)) ;; Should print 15

;; Macros
(define-syntax verbose-if
    (syntax-rules (then else)
        ((verbose-if condition then exp1 else exp2) ; Pattern
        (if condition exp1 exp2)) ; Replacement template
        ((verbose-if condition then exp1)
        (if condition exp1))))

(verbose-if (> 3 10) then #t else #f)

; let 
(let ((x1 1) (y1 2))
    (+ x1 y1)) ; 3
    ; If perform let in parallel, use let*

; let*
(let* ((x2 1) (y2 2))
    (+ x2 y2)) ; 3

(define (index list element)
    (cond ((null? list) -1)
        ((equal? element (car list)) 0)
        (else (+ 1 (index (cdr list) element)))))

;; High Order Function is a function that takes a function as an argument and returns a function
;; Filter
; (define (filter p xs)
;     (cond ((null? xs) '())
;         ((p (car xs)) (cons (car xs) (filter p (cdr xs))))
;         (else (filter p (cdr xs)))))

; Filter tail recursion
(define (filter p xs)
    (define (filter-helper xs acc) ; accumulator have the same type as return value
        (cond ((null? xs) acc) ; acc is type of list
            ((p (car xs)) (filter-helper (cdr xs) (append acc (list (car xs))))) ;
            (else (filter-helper (cdr xs) acc))))
    (filter-helper xs '()))

(filter even? '(1 2 3 4 5 6 7 8 9 10))
;; append
(append '(1 2 3) '(4 5 6)) ; (1 2 3 4 5 6)

; (define (mystery x)
;     (let ((x 10)) ; x is local variable
;     (y x)
;     (+ x y (let ((z x)) (* 5 z)))))

; (mystery 1)