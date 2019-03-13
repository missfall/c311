; Ryan Citron
; c311
; Hw 5

; Ex 1


(defun first-fit (L n)
  "Returns the first element in the lsit that is larger than or equal to the value n."
  (let ((List L) (first nil))
    (while (if (car List) t nil)
      (if (and (not first) (>= (car List) n))
	  (setq first (car List)))
      (setq List (cdr List)))
    first))
first-fit

(first-fit '(1 2 3) 2)
2

(first-fit '() 1)
nil

(first-fit '(1 2 3) 4)
nil

(first-fit '(1 2 1) 2)
2



; first-fit is used in this function.
(defun best-fit (L n)
  "Returns the best element in the list that is larger than or equal to the value n, but smallest value in the list."
  (let ((List L) (best nil))
    (setq best (first-fit L n))
    (dolist (i List best)
      (if (and (>= i n) (<= i best))
	  (setq best i)))))
best-fit


(best-fit '(2 7 3 4 1 6 5) 5)
5

(best-fit '(2 7 3 4 1 6 5) 3)
3

(best-fit '(7 5 6) 2)
5

(best-fit '() 5)
nil

(best-fit '(1 2 3) 4)
nil



; Ex 2


(defun make-multiples (n m)
  "Creates a list of multiples m from the n number."
  (let ((List '()) (current 1))
    (dotimes (i m)
      (setq
       current (* n (+ i 1))
       List (append List (list current))))
    List))
make-multiples

(make-multiples 3 4)
(3 6 9 12)

(make-multiples 2 2)
(2 4)


(defun is-multiple (L)
  "Returns t if all elements are multiples of eachother."
  (let ((List L) (smallest 0) (ret t))
    (setq smallest (car L))
    (while (if (not List) nil t)
      (if (<= (car List) smallest)
	  (setq smallest (car List)))
      (setq List (cdr List))) 
    (dolist (i L ret)
      (if (not (= (% i smallest) 0))
	  (setq ret nil)))))
is-multiple

(is-multiple '(3 6 9 12))
t

(is-multiple '(5 27 14 92))
nil

(is-multiple '(5 25 10 20))
t













    