; Ryan Citron
; C311
; Hw 7

; Ex1

; bubble sort

(defun bubble-sort (A)
  "Sorts an array using bubble sort"
  (if (not (arrayp A)) ; If not an array return the parameter
      A
    (let ((size (length A)) (i 0) (j 0) (k (length A)) (x 0) (y 0) (swapflag nil))
      (while (< i size)
	(setq swapflag nil
	      j 0
	      k (- k 1)) ; locked in one element in the array
	(while (< j k)
	  (if (> (elt A j) (elt A (+ j 1))) ; if the current element is larger than the next element -> swap
	      (progn
		(setq x (elt A j)
		      y (elt A (+ j 1)))
		(aset A j y)
		(aset A (+ j 1) x)
		(setq swapflag t)))
	  (if (equal swapflag nil) ; Did we swap?
	      A)
	  (setq j (+ j 1))) ; increment the current element
	(setq i (+ i 1)))) ; increment the starting element
      A)) ; Return the sorted array
bubble-sort

(setq A (vector '4 1 23 5 32 3 2 6 3))
[4 1 23 5 32 3 2 6 3]

(bubble-sort A)
[1 2 3 3 4 5 6 23 32]

(bubble-sort '(4 1 23 5 32 3 2 6 3))
(4 1 23 5 32 3 2 6 3)

; Ex 2

(defun random-select (L)
  (while (and (cdr L)
	      (not (= (% (random) 2) 0)))
    (setq L (cdr L)))
  (car L))
random-select

(random-select '())
nil

(random-select '(1 2))
1

(random-select '(1 2 3 4 5 6 7 8 9))
3

; Ex 3
;a

(defun count-val (L val result)
  (cond ((not L) 0)
	((equal (car L) val)
	 result)
	(t (count-val (cdr L) val (+ 1 result)))))
count-val

(count-val '(3 2 7 1 7 2 7) 7 1)
3

(count-val '(3 2 7 1 7 2 7) 8 1)
0

;b 

(defun itcount-val (L val)
  (let ((result 0))
    (while (car L)
      (if (equal (car L) val)
	  (setq result (+ 1 result)))
      (setq L (cdr L)))
    result))
itcount-val

(itcount-val '(3 2 7 1 7 2 7) 7)
3

(itcount-val '(3 2 7 1 7 2 7) 8)
0


; Ex 4

(defun sum-numbers (&rest L)
  (let ((sum 0))
    (while (car L)
      (if (numberp (car L))
	  (setq sum (+ (car L) sum)))
      (setq L (cdr L)))
    sum))
sum-numbers

(sum-numbers 1 2 3)
6

(sum-numbers 1 "aa" 2 '(123) 3)
6








		























	
      







		    


      