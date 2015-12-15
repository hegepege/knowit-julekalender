(write-line "Hello World")

;;;Svar oppgis i talltypen tallet faktisk er i (eks. er medianen ti i binær, skriver du 0b1010, er det 
;;;ti i romertall skriver du X). Alle binærtall starter med 0b, f. eks er 0b1010 det samme som 10.
(defun mapcn (chars nums string)
  (loop as char across string as i = (position char chars) collect (and i (nth i nums))))
 
(defun parse-roman (R)
  (loop with nums = (mapcn "IVXLCDM" '(1 5 10 50 100 500 1000) R)
        as (A B) on nums if A sum (if (and B (< A B)) (- A) A)))


(defun ordered-keys (table)
  (sort
   (loop for key being each hash-key of table
         collect key)
   #'<))


(defun get-file (filename)
  (with-open-file (stream filename)
    (loop for line = (read-line stream nil)
          while line
          if(and (> (length line) 2 ) (string= (subseq line 0 2) "0b")) 
		  collect (list (parse-integer (subseq line 2) :radix 2) line)
    	  else if(setf x (parse-integer line :junk-allowed t))
    	  collect (list (parse-integer line) line)
    	  else 
    	  collect (list (parse-roman line) line)
    )))


(defparameter *my-list* (get-file "data.txt"))

(loop for x in (sort (copy-seq *my-list*) #'< :key #'car)
      do (print x) )



(format t "~& The solution is: ~A" (nth (multiple-value-bind (q r) (floor 10001 2) q) (sort (copy-seq *my-list*) #'< :key #'car)))


;;;Everything below here is BS

(defparameter *my-hash* (make-hash-table))

(let ((in (open "data.txt" :if-does-not-exist nil)))
  (when in
  	(loop for line = (read-line in nil)
    	while line
    	if(and (> (length line) 2 ) (string= (subseq line 0 2) "0b")) 
		do (setf (gethash (parse-integer (subseq line 2) :radix 2) *my-hash*) line)
    	else if(setf x (parse-integer line :junk-allowed t))
    	do(setf (gethash (parse-integer line) *my-hash*) line)
    	else do(setf (gethash (parse-roman line) *my-hash*) line)
    	)
    (close in)))


;;;(loop for value being the hash-values of *my-hash*
;;;        using (hash-key key)
;;;        do (format t "~&~A -> ~A" key value))



(defun median (num-set)
  (let* ((num-set (sort num-set #'<))
         (set-length (length num-set))
         (middle (truncate set-length 2)))
    (if (oddp set-length)
        (nth middle num-set)
        (/ (+ (nth middle num-set) (nth (- middle 1) num-set)) 2))))

(format t "~&~A" (/ (hash-table-count *my-hash*) 2))


;;;(format t "~&~A" (median (list 1 2 3 4 5)))

;;;(format t "~&~A" (median (loop for key being the hash-keys of *my-hash* collect key)))

;;;(loop for x in (ordered-keys *my-hash*) 
   ;;;   do (format t "~&~A " x))

(format t "~&~A" (length (ordered-keys *my-hash*)))
 	
(format t "~&~A" (nth (/ (hash-table-count *my-hash*) 2) (ordered-keys *my-hash*)))

;;;(format t "~&~A" (gethash '(nth (/ (hash-table-count *my-hash*) 2) (ordered-keys *my-hash*)) *my-hash*)) 
(format t "~&~A" (gethash 2500 *my-hash*)) 

(defun my-list(decvalue value)

	)
(defun my-library (title author rating availability)
   (list :title title :author author :rating rating :availabilty availability)
)
(write (getf (my-library "Hunger Game" "Collins" 9 t) :title))