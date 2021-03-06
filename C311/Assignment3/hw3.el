; Ryan Citron
; Homework 3
; c311

; Ex 1 a

(defun is-const (L)
  "Returns t if all the elements are the same"
  (let ((con (car L))
	(ret t)) ; Set return value and what element needs to be the comparison.
    (dolist (i L ret)
      (if (not(equal i con)) 
	  (setq ret nil))))) ; if the current element is not the same as the very first one return nil
is-const

(is-const '(1 1 2 3)) ; list with 2 of the same elements
nil

(is-const '(2 2 2)) ; list with the same elements
t

(is-const '(1 2 3)) ; list with all different elements
nil

(is-const '()) ; empty list
t

(is-const '(1)) ; single element
t

(is-const '("dog" "dog")) ; Strings
t


; Ex 2 b

(defun element-i (L num)
  "Returns the ith element from the list"
  (let ((ele 0)) ; let ele be the element we are returning
    (if (< (length L) num) nil) ; if list < index
    (dotimes (i (+ num 1) ele) ; return value at that index
      (if (= i num) ; are we at the index?
	  (setq ele (pop L)) ; we are at the index, pop at put value into ele
	(pop L))))) ; We are not at the index, pop
element-i

(element-i '(0 1 2 3 4 5) 3) ; Standard list
3

(element-i '() 3) ; Empty list 
nil

(element-i '(1) 0) ; Single element
1

(element-i '(0 1 2 3) 6) ; Out of range 
nil


; Ex 2 c

(defun is-sorted (L)
  "Returns t if the list is sorted in ascending order"
  (let ((last (car L)) (ret t)) ; Last is the compared element
    (if (or (not L) (not (cdr L))) t) ; if the list is empty or contains one element
    (dolist (x L ret)
      (if (or (> x last) (= x last)) ; if the current element is larger or the same as the last element
	  (setq last x) ; Set the current element to the last element to keep checking order
	(setq ret nil))))) ; if not in order return nil
is-sorted

(is-sorted '(0 1 2 3)) ; Standard list
t

(is-sorted '(0 1 1 2)) ; Duplicates
t

(is-sorted '(0 1 3 2)) ; Not in order
nil

(is-sorted '(3 2 1 0)) ; Descending list
nil

(is-sorted '()) ; Empty list
t

(is-sorted '(1)) ; Single element
t


; Ex 1 d

(defun reverse (L)
  "Returns the reverse of a list"
  (if (not L) ; if the list is empty / recursion case
      nil
    (append (reverse (cdr L)) (list (car L)))))
; Calls reverse ignoring the first element and adding the first
; element to a list. Appends the lists together to make a reverse of it.
reverse

(reverse '(1 2 3 4 5 6 7)) ; Standard list
(7 6 5 4 3 2 1)

(reverse '()) ; Empty list
nil

(reverse '(1 2 3 1 2 3)) ; Another standard list
(3 2 1 3 2 1)

(reverse '(1)) ; Single element
(1)



; Random examples together!

(is-sorted (reverse '(0 1 2 3))) ; Reverse the list, is it sorted?
nil

(is-sorted (reverse '(3 2 1 0))) ; Reverse the list, is it sorted?
t

(and (is-const '(2 2 2 2)) (is-sorted '(2 2 2 2))) ; Is this list both sorted and constant?
t











      
  







    







	  
