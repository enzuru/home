(ql:quickload :stumpwm)
(ql:quickload :slynk)

(slynk:create-server :dont-close t :port 2000)

(stumpwm:add-to-load-path "~/.stumpwm.d/modules")
(in-package :stumpwm)
(stumpwm:stumpwm)
