







; Ryan Citron
; c311
; Homework 10

; Ex 1

; S -> A
; A -> /B
; B -> *C
; C -> !C
; C -> *C
; C -> *D
; D -> /E
; E -> e
; Where "!" is every character except for / and *.
;
; FSM:
;                         ! or *
;                         ------
;              /      *   v    | *       /
; Start -> [A] -> [B] -> [C] ------> [D] -> [E] -> End
;
;
;
;
; Table:
;     /   *   !   else
; A   B  err err  err
; B  err  C  err  err
; C  err C/D  C   err
; D   E  err err  err
; E  err err err  end

; Ex 2

; a.
; S -> A
; A -> yB
; B -> wC
; C -> zB
; C -> yD
; D -> end

; b.
; 
; y [wz]^n w y
;
; DFA

; c.

(defun check-A (Lst)
  (if (equal (car Lst) 'y) ; If y go to B
      (check-B (cdr Lst))
    nil))
check-A

(defun check-B (Lst)
  (if (equal (car Lst) 'w) ; If w go to C
      (check-C (cdr Lst))
    nil))
check-B

(defun check-C (Lst)
  (cond
   ((equal (car Lst) 'z) (check-B (cdr Lst))) ; If z go to B
   ((and
     (equal (car Lst) 'y) ; If y and the end go to D
     (not (cdr Lst)))
    t)
   (t nil)))
check-C

(check-A '(y w z w y))
t

(check-A '(y z w w))
nil

; Ex 3
; a) It is LL(1) since each term of the right hand side starts with a terminal
; symbol. 
;
; b) This one is LL(2) because the non-terminal symbol is the leading term of
; the right hand side instead of it being a terminal symbol.













