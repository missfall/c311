; Ryan Citron
; c311
; hw6


; Ex 1
;				[17 8 3 11 18 2 5 1]
;					  |
;			[17 8 3 11]--------------[18 2 5 1]
;			     |		   	      |
;		     [17 8]-----[3 11]        [18 2]-----[5 1]
;			|	  |		 | 	   |
;		    [17]-[8]   [3]-[11]	     [18]-[2]   [5]-[1]
;

; Ex 2

(defun next-day (day)
  "Takes a symbol with the name of a day of the week and returns the next day."
  (let ((next 'symbol))
    (cond
     ((equal day 'monday) (setq next 'tuesday))
     ((equal day 'tuesday) (setq next 'wednesday))
     ((equal day 'wednesday) (setq next 'thursday))
     ((equal day 'thursday) (setq next 'friday))
     ((equal day 'friday) (setq next 'saturday))
     (t (setq next 'sunday)))
    next))
next-day


(next-day 'tuesday)
wednesday

(setq week '(sunday monday tuesday wednesday thursday friday saturday))
(sunday monday tuesday wednesday thursday friday saturday)


(defun random-day ()
  "Returns a random day of the week with the following day."
  (let ((number (abs (random))))
    (setq day (% number 7)
	  next (% (+ number 1) 7))
    (princ "Today is ")
    (princ (capitalize (symbol-name (elt week day))))
    (princ " and tomorrow will be ")
    (princ (capitalize (symbol-name (elt week next))))
    (princ "\n")))
random-day

(random-day)
Today is Thursday and tomorrow will be Friday
"
"

Today is Tuesday and tomorrow will be Wednesday
"
"

Today is Tuesday and tomorrow will be Wednesday
"
"

Today is Friday and tomorrow will be Saturday
"
"













		    



    
