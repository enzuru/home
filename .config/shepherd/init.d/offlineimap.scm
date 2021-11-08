(use-modules (guix scripts environment))

(define offlineimap
  (make <service>
    #:provides '(offlineimap)
    #:docstring "Run offlineimap"
    #:start (make-forkexec-constructor '("offlineimap") #:log-file (string-append (getenv "HOME") "offlineimap.log"))
    #:auto-start? #t
    #:respawn? #t))

(register-services offlineimap)
(start offlineimap)
