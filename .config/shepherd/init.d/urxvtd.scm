(use-modules (guix scripts environment))

(define urxvtd
  (make <service>
    #:provides '(urxvtd)
    #:docstring "Run urxvtd"
    #:start (make-forkexec-constructor (list "/gnu/store/44s0dzbph80crxw9q441mzmw9xf6pa5z-profile/bin/urxvtd") #:user "enzuru" #:log-file "/home/enzuru/urxvtd.log")
    #:auto-start? #t
    #:respawn? #t))

(register-services urxvtd)
(start urxvtd)
