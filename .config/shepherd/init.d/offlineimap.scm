(use-modules (guix scripts environment)
             (gnu packages))

(define offlineimap
  (make <service>
    #:provides '(offlineimap)
    #:docstring "Run offlineimap"
    #:start (make-forkexec-constructor (list "/gnu/store/4w5hi8ygf179m89ll0cha1ydq7r9p1h1-profile/bin/offlineimap") #:user "enzuru" #:log-file "/home/enzuru/offlineimap.log")
    #:auto-start? #t
    #:respawn? #t))

(register-services offlineimap)
(start offlineimap)
