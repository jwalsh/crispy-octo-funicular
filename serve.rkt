#lang racket

(require web-server/servlet
         web-server/servlet-env
         web-server/http/cookie
         racket/list
         racket/base)

(define time-cookie
  (make-cookie "time" (number->string (current-seconds))))

(define id-cookie
  (make-cookie "id" "jwalsh" #:secure? #t))

(define pisort (sort '(3 1 4 1 5 9 265358) <))

(define (start req)
  (response/xexpr
   '(html (head (title "Racket Heroku POC"))
          (body (h1 "Success")
                (p "Validate deployed Racket application to Heroku")))))

(serve/servlet start
               #:servlet-path "/"
               #:listen-ip #f
               #:port port
               #:command-line? #t)
