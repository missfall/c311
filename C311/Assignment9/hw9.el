; Ryan Citron
; c311
; Homework 9

; Ex 1


(defun replace (L z y)
  (let ((ryan))
    (setq ryan (lambda (x) (if (equal x z)
				y
			      x)))
    (mapcar ryan L)))
replace

(replace '(3 1 5 6 3 2 3) 3 9)
(9 1 5 6 9 2 9)

; Ex 2

; a)
; This is a Type 3 Grammar.
; Examples: aaaa, bcaaaa, bcbcaa, bca, a.
; b)
;         S 
;       / | \
;      b  c  U
;           /|\ 
;          b c U
;             /|\
;             bc U
;               / \ 
;               a  V
;                 / \
;                a   V
;                     \
;                      e
;      bcbcbcaa

; Lisp implementation of the grammar.
(defun check-S (Lst)
  (check-U Lst)) ; Since S and U check the same
check-S

(defun check-U (Lst)
  (if (and
       (equal (car Lst) 'b) ; If first element is b
       (equal (car (cdr Lst)) 'c)) ; the second element is c
      (check-U (cdr (cdr Lst))) ; We check U
  (if (equal
       (car Lst) 'a) ; Else if first element is a
      (check-V Lst) ; We check V
    nil)))
check-U

(defun check-V (Lst)
  (if (not (cdr Lst)) t
    (if (equal (car Lst) 'a)
	(check-V (cdr Lst))
      nil)))
check-V

(check-S '(b c b c b c a a))
t

(check-S '(a))
t

(check-S '(a a a ))
t

(check-S '(a b c))
nil

(check-S '(a b c d))
nil

(check-S '(b c a b c a))
nil






















