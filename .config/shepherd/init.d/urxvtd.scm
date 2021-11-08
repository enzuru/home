(use-modules (guix scripts environment))

(define urxvtd
  (make <service>
    #:provides '(urxvtd)
    #:docstring "Run urxvtd"
    #:start (make-forkexec-constructor '("urxvtd") #:log-file (string-append (getenv "HOME") "urxvtd.log"))
    #:auto-start? #t
    #:respawn? #t))

(register-services urxvtd)
(start urxvtd)
