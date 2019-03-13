; Ryan Citron
; C311
; Hw8


; Ex 1

(setq countA 0
      countB 0)
0

(defun comb (n m)
  (setq countA (+ countA 1))
  (cond
   ((= n m) 1)
   ((= m 0) 1)
   ((= m 1) n)
   (t (+ (comb (- n 1) m)
         (comb (- n 1) (- m 1))))))
comb

(comb 3 2)
3

(comb 5 2)
10

(defun el10 (n m)
  (+ (* n 10) m))
el10


(setq C (make-vector 100 nil))
[nil nil nil nil nil nil nil nil nil nil nil nil ...]


(defun comb1 (n m)
  (setq countB (+ countB 1))
  (let ((res 0))
    (if (setq res (elt C (el10 n m))) res
      (setq res
            (cond
             ((= n m) 1)
             ((= m 0) 0)
             ((= m 1) n)
             (t (+ (comb1 (- n 1) m)
                   (comb1 (- n 1) 
                          (- m 1))))))
      (aset C (el10 n m) res))))
comb1

(comb1 7 3)
35

(comb1 5 2)
10


; Testing globals

(comb 6 3)
20

countA
19

(comb1 6 3)
20

countB
1

(setq countA 0
      countB 0)
0

(comb 8 3)
56

countA
41

(comb1 8 3)
56

countB
5

(setq countA 0
      countB 0)
0

(comb 7 6)
7

countA
11

(comb1 7 6)
7

countB
7

(setq countA 0
      countB 0)
0

(comb 8 3)
56

countA
41

(comb1 8 3)
56

countB
1



; Looking at the information, the count from the first revision of the combination code has much more
; recursive calls compared to the dynamic programming made combination code. The dynamic recursive count
; seems to always be less than or equal to the n in the function call. The first revision recursive count
; seems to always be greater than the n in the function call. This holds true for the three tests I have
; conducted. If some math has been used and stored in the array for dynamic programming it is a recursive
; count of 1. This is because it uses the "look up" array to find the value without having to do the math
; invovled with it. Therefore, the more calls for the dynamic version of the combinitorial code, the more
; efficient it will be when calculating very large numbers.

; Ex 2

(setq D (make-vector 200 nil))
[nil nil nil nil nil nil nil nil nil nil nil nil ...]

(defun f (n)
  (setq countA (+ countA 1))
  (let ((res 0))
    (if (setq res (elt D (el10 n m))) res
      (setq res
            (cond
             ((= n 0) 0)
             ((or (= n 1) (= n 2)) 1)
             (t (+ (f (- n 1))
                   (f (- n 3))))))
      (aset D (el10 n m) res))))
f

(f 3)
1

(f 4)
2

(f 5)
3

(f 10)
19

(f 15)
129

(setq countA 0)
0


(f 15)
129

countA
27

(setq countA 0)
0

(f 15)
129

countA
1

; Dynamic programming this worked since we went from 27 recursive calls the first time running this to 1

(setq countA 0)
0

(f 10)
19

countA
1

; (f 10) includes all calls from (f 15)

(setq countA 0)
0

(f 18)
406

countA
7

(setq countA 0)
0

(f 18)
406

countA
1

; The first call was 7 recursive steps. Recalling it gaves us 1 also proving dynamic programming optimized it

; Ex 3


(defun deep-recursive-search (L x)
  (catch 'located
    (if (not L) nil
      (search-helper L x)))) ; if there is a list call search-helper
deep-recursive-search

(defun search-helper (L x)
  (dolist (i L nil)
    (if (listp i) ; if an element is a list
	(search-helper i x) ; call search-helper to go through that list
      (if (equal i x) ; if an element is equal to what we're looking for
	  (throw 'located t))))) ; throw tag with true
search-helper

(deep-recursive-search '(2 '(3 2) 23 4) 3)
t

(deep-recursive-search '(2 '(3 2) 23 4) 4)
t

(deep-recursive-search '(2 '(3 2) 23 4) 5)
nil

(deep-recursive-search '() 1)
nil


; Ex 4

(setq tree '(23 (51 (18) (33 (5))) (7 () (10))))
(23 (51 (18) (33 (5))) (7 nil (10)))

(defun root (T)
  "The root of the tree."
  (if T (car T)))
root

(defun left-subtree (T) 
  "The left subtree, also a list."
  (if (and T (cdr T))
    (car (cdr T))))
left-subtree

(defun right-subtree (T) 
  "The right subtree, also a list."
  (if (> (length T) 2)
    (car (cdr (cdr T)))))
right-subtree


; Recursively print inorder

(defun print-inorder (T)
  "Prints the tree in inorder. L - Root - R"
  (if T
      (progn
	(print-inorder (left-subtree T))
	(mapc 'princ (list (root T) " "))
	(print-inorder (right-subtree T)))))
print-inorder

(print-inorder tree)
18 51 5 33 23 7 10 nil


; Transformed into an iterative way of print inorder

(defun my-print (&rest L)
  (dolist (e L)
    (princ e)))
my-print


(defun print-inord (T)
  "Prints the tree inorder non-recursively. L - Root - R"
  (let ((stackT ()))
    (while T
      (push T stackT)
      (setq T (left-subtree T)))
    (while stackT
      (setq T (pop stackT))
      (my-print (root T) " ")
      (setq T (right-subtree T))
      (while T
	(push T stackT)
        (setq T (left-subtree T))))))
print-inord

(print-inord tree)
18 51 5 33 23 7 10 nil




