(ql:quickload :stumpwm)
(ql:quickload :slynk)

(slynk:create-server :dont-close t)

(stumpwm:add-to-load-path "/home/enzuru/.stumpwm.d/modules")
(stumpwm:stumpwm)
;; (stumpwm:load-module "modeline")
