; Ryan Citron
; C311
; Homework 4

; Ex 1

(defun gcd (n m)
  "Computes the greatest common divisor of two numbers."
  (if (= n 0) m
    (if (= m 0) n
      (let ((rem 1) (dvd n) (dvr m)) ; rem = remainder, dvd = dividend, dvr = divisor
	(if (< dvd dvr) ; if n < m
	    (setq temp dvd
		  dvd dvr
		  dvr temp))
	(while (not (= rem 0))  ; while rem != 0
	  (setq rem (% dvd dvr) ; rem = dvd % dvr
		dvd dvr         ; dvd = dvr
		dvr rem))      ; dvr = rem
	dvd))))
gcd

(gcd 0 0)
0

(gcd 5 0)
5

(gcd 0 5)
5

(gcd 4 2)
2

(gcd 2 5)
1

(gcd 16 8)
8

(gcd 16 4)
4

(gcd 15 9)
3




; Ex 2

(defun is-prime (x)
  "Checks if a number is prime."
  (let ((y (floor (sqrt x))) (value t)) ; y = floor sqrt(x) value = true
    (if (<= x 2) 
	(setq value nil)
      (dotimes (i y value) ; run until i == y and return value
	(if (= (% x (+ 2 i)) 0) ; if x % (i + 2) == 0, value = nil
	    (setq value nil)))
      value))) ; return value
is-prime

(is-prime 14)
nil

(is-prime 17)
t

(is-prime 13)
t

(is-prime 8)
nil

; Ex 3

(defun print-list (List)
  "Prints the elements in a list"
  (let ((L List))
    (mapc (lambda (x) (princ x) (princ " ")) L)))
print-list

(print-list '(1 2 3))
1 2 3 (1 2 3)

(print-list '("The balloon" "was flying" "high."))
The balloon was flying high. ("The balloon" "was flying" "high.")

(print-list '(1 "fish" 2 "fish" "red" "fish" "blue" "fish"))
1 fish 2 fish red fish blue fish (1 "fish" 2 "fish" "red" "fish" "blue" "fish")
























  

