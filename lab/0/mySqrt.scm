;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mySqrt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;error tolerance
(define epsilon .0001)

;return true if inputs are sufficiently close, false otherwise
(define isGoodEnuf?
  (lambda (a b) 
    (< (abs (- a b)) epsilon)))

;with g as a guess at a sq root, returns a more accurate approximation
(define betterGuess
  (lambda (n g)
    (/ (+ g (/ n g)) 
       2)))

;given n and a guess at its sq root, g, recursively calculate a sufficiently accurate better guess
(define mySqrt-helper
  (lambda (n g)
    (if (isGoodEnuf? (* g g) n)
        g
        (mySqrt-helper n (betterGuess n g)))))

;(mySqrt 4 2) "...2"
;(mySqrt 4 1) "...?"
;(mySqrt 4 5) "...?"
;(mySqrt 9 3) "...3"
;(mySqrt 9 1) "...?"
;(mySqrt 9 10) "...?"
;(mySqrt 16 4) "...4"
;(mySqrt 16 1) "...?"
;(mySqrt 16 15) "...?"
;(mySqrt 16 900) "...?"

;mySqrt returns the approx sq root of input n
(define mySqrt
  (lambda (n)
    (mySqrt-helper n 1)))

(mySqrt 16) "...4"
(mySqrt 25) "...5"
(mySqrt 100) "...10"
(mySqrt 5000) "...~70.71"
