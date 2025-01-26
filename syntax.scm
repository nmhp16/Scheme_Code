;; Function to calculate sum of a list
(define (sum-list lst) ;; Define a function sum-list that takes a list as input
    (if (null? lst) ;; If the list is empty
        0 ;; Return 0
        (+ (car lst) (sum-list (cdr lst))))) ;; Otherwise, add the first element of the list to the sum of the rest of the list

;; Higher-order function: map
(define (square x) (* x x)) ;; Define a function square that squares a number
(define (map func lst) ;; Define a function map that applies a function to each element of a list
    (if (null? lst) ;; If the list is empty
            '() ;; Return an empty list
        (cons (func (car lst)) (map func (cdr lst))))) ;; Construct a new list by applying the function to the first element and recursively calling map on the rest of the list

;; Test examples
(display (sum-list '(1 2 3 4 5))) ;; Should print 15
(newline)   

(display (map square '(1 2 3 4 5))) ;; Should print (1 4 9 16 25)
(newline)