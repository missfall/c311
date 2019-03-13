; Ryan Citron
; C311
; Homework 2

;;;;;;;;;;;;;;;;;;;;;;;;
; Ex 1 ;
;;;;;;;;;;;;;;;;;;;;;;;;

(setq day 15 month 1) ; Declare and assign two variables
; day = 15
; month = 1


(defvar year 2018
      "The current year we are in") ; Declare and assing another variable with a description
; year = 2018

(expt day month) ; day ^ month
15

(expt year day)  ; year ^ day
6023323826745835520

(truncate year day) ; year / day rounded to 0
134

(abs 
 (- day 
    (- month year))) ; absolute value of day - month - year
2032

(/ year 
   (* day 
      (+ month 
	 (random day)))) ; year / (day * ( month + random number between 0 - 15))
13

(cos day)
-0.7596879128588213
; Using the help function on cosine
; cos is a built-in function in 'C source code'. 
;
; (cos ARG)
;
; Return the cosine of ARG.

(abs (cos day)) ; the absolute value of the cosine of 15
0.7596879128588213

;;;;;;;;;;;;;;;;;;;;;;
; Ex 2 ;
;;;;;;;;;;;;;;;;;;;;;;

(defun prod-list (List)
  "Multiplies numbers in a list. If the list is empty, returns 0."
  (if (not List) 0 ; If the list is empty return 0
    (if (not (cdr List)) (car List) ; If there is only one number left in the list return it
      (* (car List) (prod-list (cdr List)))))) ; Multiply the list together using recursion
prod-list

(prod-list '()) ; empty list 
0

(prod-list '(5)) ; single number
5

(prod-list '(2 3 4)) ; 2 * 3 * 4
24

(prod-list '(3 3 4 4)) ; 3 * 3 * 4 * 4
144

;;;;;;;;;;;;;;;;;;;;

(defun is-in-list (List x)
  "Checks if an item, x, is in the list. Returns true if item is found."
  (if (not List) nil
    (if (equal (car List) x) t
      (is-in-list (cdr List) x))))
is-in-list

(is-in-list '() 3) ; empty list
nil

(is-in-list '(1 2 3) 3) ; item is in list
t

(is-in-list '(1 2 3) 4) ; item is not in list
nil

(is-in-list '("red" "blue" "green") "blue") ; item is in list and is not a number
t

(is-in-list '("red") "blue") ; item is not in the list and is not a number
nil

;;;;;;;;;;;;;;;;;;;;

(defun median (x1 x2 x3)
  "Returns the median of the three arguments given."
  (cond
   ((and (>= x1 x2) (>= x3 x1)) x1) ; x1 >= x2 and x3 >= x1, x1 is median
   ((and (>= x2 x1) (>= x3 x2)) x2) ; x2 >= x1 and x3 >= x2, x2 is median
   ((and (>= x2 x1) (>= x1 x3)) x1) ; x2 >= x1 and x1 >= x3, x1 is median
   ((and (>= x1 x2) (>= x2 x3)) x2) ; x1 >= x2 and x2 >= x3, x2 is median
   (t x3) ; x3 is the only number left
   ))
median

; Test cases for median

(median 1 2 3)
2

(median 3 1 2)
2

(median 2 3 1)
2

(median 1 3 2)
2

(median 2 1 3)
2

(median 1 1 3)
1

(median 3 3 1)
3

(median 3 1 1)
1

(median 1 3 3)
3

(median 1 3 1)
1

(median 3 1 3)
3

(median 1 -2 3)
1

(median 1 -2 -3)
-2

(median -1 -2 -3)
-2

(median -1 2 -3)
-1



















