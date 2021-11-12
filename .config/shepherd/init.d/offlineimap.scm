(use-modules (guix scripts environment))

(define offlineimap
  (make <service>
    #:provides '(offlineimap)
    #:docstring "Run offlineimap"
    #:start (make-forkexec-constructor (list "/gnu/store/44s0dzbph80crxw9q441mzmw9xf6pa5z-profile/bin/offlineimap") #:user "enzuru" #:log-file "/home/enzuru/offlineimap.log")
    #:auto-start? #t
    #:respawn? #t))

(register-services offlineimap)
(start offlineimap)
