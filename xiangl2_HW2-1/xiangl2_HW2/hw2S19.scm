
; NO OUTPUT SHOULD BE PRODUCED IN THIS FILE

; Returns the roots of the quadratic formula, given
; ax^2+bx+c=0. Return only real roots. The list will
; have 0, 1, or 2 roots. The list of roots should be
; sorted in ascending order.
; a is guaranteed to be non-zero.
; Use the quadratic formula to solve this.
; (quadratic 1 0 0) --> (0)
; (quadratic 1 2 5) --> ()
; (quadratic 1 3 -4) --> (-4.0 1.0)

(define (quadratic a b c)
	(cond
		((< ( - (* b b) (* (* 4 a) c ) ) 0 ) 
			 '() )
		((= ( - (* b b) (* (* 4 a) c ) ) 0 )
			 ( list (/ (- 0 b) (* a 2))) )
		(
			(ascendingOrder (list 
			    (/ ( + (- 0 b) (sqrt ( - (* b b) (* (* 4 a) c )))) (* a 2))
			    (/ ( - (- 0 b) (sqrt ( - (* b b) (* (* 4 a) c )))) (* a 2))
			) )
		)
	)
)

(define	(ascendingOrder lst)
	(cond 
	      ((> (car lst) (cadr lst))   (list (cadr lst) (car lst)))
	   ((list (car lst) (cadr lst)))
	) 
)

; Returns the fewest number of minutes between two times, where the two times
; are given in 24 hour format. For example, 12:05 and 13:03
; are separated by 58 minutes.
; (minutesBetween 12 5 13 3) --> 58
; (minutesBetween 13 3 12 5) --> 58
; (minutesBetween 0 0 23 59) --> 1
; (minutesBetween 23 59 0 0) --> 1

(define (minutesBetween h1 m1 h2 m2)
	(cond 
		((and (= h1 h2) (= m1 m2)) 0)
		;; if h1 > h2, min((t1 - t2) (- 24 (t1 - t2)))
		((= (min h1 h2) h2)	
		(min (- ( + (* h1 60) m1) ( + (* h2 60) m2)) 
			(- (* 24 60) (- ( + (* h1 60) m1) ( + (* h2 60) m2)))
		) )
		(				; if h2 > h1, min((t2 - t1) 24-(t2 - t1))
			(min (abs (- ( + (* h2 60) m2) ( + (* h1 60) m1)) )
			(abs (- (* 24 60) (- ( + (* h2 60) m2) ( + (* h1 60) m1)))))
		)
	)
)


; Accepts a simple list of numbers and returns the list containing only
; the negative numbers, in the order in which they originally appeared.
; MUST BE WRITTEN USING TAIL RECURSION.
; (negatives '(1 2 3 -2 0 -3)) --> (-2 -3)
; (negatives '()) --> ()
(define (negatives lst)
	(cond
		( (null? lst) '() )
		( (< (car lst) 0 )
			(cons (car lst) (negatives (cdr lst)))
	    )
	    ( (negatives (cdr lst)) )
	)
)


; Accepts a list of items and returns the list with the top-level items
; in reversed order.
; (reverse '(a b c d)) --> (d c b a)
; (reverse '()) --> ()
(define (reverse lst)
	(cond
		((null? lst) '())
		( (append (reverse (cdr lst)) (list (car lst) ) )
	    )
	)
)		

; Returns true iff the parameters is a flat list of numbers.
; (isFlatListOfNumbers '(1 2 3)) --> #t
; (isFlatListOfNumbers '()) --> #t
; (isFlatListOfNumbers '(1 2 a 3)) --> #f
; (isFlatListOfNumbers '(1 (2) 3)) --> #f
(define (isFlatListOfNumbers lst)
	(cond
	    ( (not (list? lst)) #f)
		( (null? lst) #t)
		( (list? (car lst)) #f)
		( (integer? (car lst)) 	(isFlatListOfNumbers (cdr lst))	)
	    ( else #f )
	)
)


; Returns a list of two numeric values. The first is the smallest
; in the list and the second is the largest in the list. 
; lst -- a flat list of numbers, with length >= 1.
;(minAndMax '(1 2 3 -9 20 5)) -> (-9 20)
(define (minAndMax lst)
	(cond
		((null? lst) '())
		((= (length lst) 1) (list (car lst) (car lst)))
		(
		  (minAndMaxHelper lst (list '1 '2))
		)
    )
)

(define (minAndMaxHelper lst l2)
	(cond 
		((null? lst) l2)
		((<= (car lst) (car l2))
			 (minAndMaxHelper (cdr lst) (list (car lst) (cadr l2) )) )
		((>= (car lst) (cadr l2))
			( minAndMaxHelper (cdr lst) (list (car l2) (car lst))))
	(else
	   (minAndMaxHelper (cdr lst) l2))
	)
	
    )

; The paramters are two lists. The result should contain the cross product
; between the two lists. That is, all elements of the first list are paired
; with all elements of the second lists. All of these pairs are put into a
; list of pairs.
; (crossProduct '(1 2) '(a b c)) --> ((1 a) (1 b) (1 c) (2 a) (2 b) (2 c))
; lst1 & lst2 -- two flat lists.
(define (crossProduct lst1 lst2)
	(cond 
		((null? lst1) '())
		((null? lst2) '())
		((crossProductHelper lst1 lst2 lst2)
		)

	)
)

(define (crossProductHelper lst1 ls lst2)
    (cond 
        ((null? lst1) '() )
        ((not (null? ls))
            (cons (list (car lst1) (car ls)) 
                (crossProductHelper lst1 (cdr ls) lst2)
            ))
        ((crossProductHelper (cdr lst1) lst2 lst2)
        )
    )
)

; Grad
; Copies a list structure, but replaces a value (old) with a different value (new).
; (replace 'a 'X '(a b c d a b c)) --> (x b c d x b c)
; (replace 'a 'X '(a b (c d a) b c)) --> (x b (c d x) b c)
(define (replace old new lst)
	'()
)

; Returns a list containing the latitude and longitude of particular location.
; The location is specified by zipcode, city, state, and county.
; If there is more than one match, give the first match. Return
; the empty list if the location does not exist.
(define (getLatLon zipCode cityName state county places)
	(cond 
		((null? places) '())
		((and (and (and (equal? (caar places) zipCode) (equal? (cadar places) cityName))
		(equal? (caddar places) state)) (equal? ( car (cdr (cdr (cdr (car places))))) county))
			(list(car (cdr (cdr (cdr (cdr (car places)))))) (car ( cdr (cdr( cdr (cdr (cdr (car places)))))))) )
	((getLatLon zipCode cityName state county (cdr places)))
    )
)

; Returns a list of states that contain this city name. The states should
; appear at most once and be sorted.
; city -- the name of the city 
; places -- the zipcode DB
(define (getStatesThatContainThisCity city places)
  	
	(getStatesThatContainThisCityHelper city places 'A)
  )


(define (getStatesThatContainThisCityHelper city places preState)
	(cond
	  ((null? places) '())
	  ((and (equal? (cadar places) city)  (not(equal? (caddar places) preState)))
	   (cons (caddar places) (getStatesThatContainThisCityHelper city (cdr places) (caddar places))))

	  ((getStatesThatContainThisCityHelper city (cdr places) preState ))
	  
	  )
	   
  )	

; Grad
; Returns the distance (in miles) between two specific locations in the US.
; Use lat/lon. Look up the Haversine formulat.
; zipCode1, cityName1.... information about first location
; zipCode2, cityName2.... information about second location
; return 0 if either location does not exist
(define (getDistanceBetweenZipCodes zipCode1 cityName1 state1 county1
									zipCode2 cityName2 state2 county2)
	0
)

; Returns a list of items that satisfy a predicates.
; lst -- list of items
; theFilter -- predicates to apply to the individual elements
; (simpleFilter '(1 2 3 4 100) EVEN?) --> (2 4 100)
(define (LARGE? x) (>= (abs x) 10))
(define (SMALL? x) (NOT (LARGE? x)))
(define (EVEN? x) (even? x))
(define (ODD? x) (odd? x))
(define (POSITIVE? x) (> x 0))
(define (NEGATIVE? x) (< x 0))
(define (simpleFilter lst theFilter)
    (cond
        ((null? lst) '())
        ((theFilter (car lst))
             (cons (car lst) (simpleFilter (cdr lst) theFilter) )
            )
        ((simpleFilter (cdr lst) theFilter)
            )
    ) 
)

; Grad
; Returns a list of items that satisfy all given predicates.
; lst -- flat list of items
; theFilters -- list of predicates to apply to the individual elements
; (filterList '(1 2 3 4 -4 -3 -2 -1 0) '(EVEN?)) --> (2 4 -4 -2 0)
; (filterList '(1 2 3 4 100) '(EVEN? POSITIVE?)) --> (2 4)
(define (complexFilter lst theFilters)
	lst
)
