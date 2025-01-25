;; factorial.scm
(define (factorial n)
    (if (= n 0)
    1
    (* n (factorial (- n 1)))))

(display (factorial 5)) ;; Should print 120
(newline)