(in-package :stumpwm)

(ql:quickload :clx-truetype)
(ql:quickload :cl-diskspace)
(ql:quickload :cl-mount-info)

;; Modules

;; (init-load-path "~/.stumpwm.d/modules")
(load-module "disk")
(load-module "cpu")
(load-module "mem")
(load-module "pianobar")
(load-module "end-session")
(load-module "ttf-fonts")

;; Fonts

(setf xft:*font-dirs* '("~/.guix-profile/share/fonts/truetype/"))
(setf clx-truetype:cache-font-file (concat (getenv "HOME") "/.fonts/font-cache.sexp"))
(xft:cache-fonts)
(clx-truetype:cache-fonts)

(set-font (make-instance 'xft:font :family "Fira Code" :subfamily "Regular" :size 12))

;; Variables

(defparameter *background-color* "#000F14")
(set-bg-color *background-color*)

(setf *default-bg-color* *background-color*
      *win-bg-color* *background-color*
      *window-border-style* :none
      *hidden-window-color* "^**"
      *mouse-focus-policy* :click
      *mode-line-pad-x* 3
      *mode-line-pad-y* 3
      *float-window-modifier* :SUPER)

;; Modeline

(defparameter cpu::*cpu-modeline-fmt* "%c")

(defparameter mem::*mem-modeline-fmt* "MEM: %p")

(setf *mode-line-background-color* *background-color*
      *mode-line-foreground-color* "#FFFFFF"
      *mode-line-border-color* "#555555"
      *mode-line-border-width* 1
      *mode-line-position* :top
      *mode-line-timeout* 1
      *mode-line-highlight-template* "~A·"
      *time-modeline-string* "%a %b %e %k:%M"
      *window-format* "%m%n%s%c")

(setf *screen-mode-line-format* (list "[^B%n^b] [%C %M %D] [%W]^>%P · %d"))

(mode-line)

;; Commands

(defcommand hsplit-and-term () ()
  (hsplit)
  (move-focus :right)
  (run-shell-command "kitty"))

(defcommand vsplit-and-term () ()
  (vsplit)
  (move-focus :down)
  (run-shell-command "kitty"))

(defcommand kill-and-remove-split () ()
  (let ((window (current-window)))
    (remove-split)
    (delete-window window)))

(defcommand gnew-and-term () ()
  (run-commands "gnew")
  (run-shell-command "kitty"))

(defcommand gkill-windows-and-group () ()
  (let* ((group (current-group))
         (group-windows (group-windows group)))
    (gkill)
    (mapcar #'delete-window group-windows)))

(defcommand emacsclient () ()
  (hsplit)
  (move-focus :right)
  (run-or-raise "emacsclient -c --frame-parameters='(quote (name . \"emacsclient\"))'" '(:title "emacsclient" :class "emacsclient" :instance "emacsclient")))

(defcommand midnight-commander () ()
  (hsplit)
  (move-focus :right)
  (run-shell-command "kitty --name mc mc --nosubshell"))

(defun setup-workspace-emacs ()
  (grename "emacs")
  (define-frame-preference "emacs"
    (0 t t :title "Emacs"))
  (emacs))

(defun setup-workspace-monitoring ()
  (gnewbg "monitoring")
  (define-frame-preference "monitoring"
    (0 nil t :instance "glances"))
  (run-or-raise "kitty --name glances glances" '(:instance "glances")))

(defun setup-workspace-firefox ()
  (gnewbg "firefox")
  (define-frame-preference "firefox"
    (0 nil t :class "Firefox"))
  (run-or-raise "firefox" '(:class "Firefox")))

(defun setup-workspace-llm ()
  (gnewbg "llm")
  (define-frame-preference "llm"
    (0 nil t :instance "llama"))
  (define-frame-preference "llm"
    (0 nil t :instance "radeontop"))
  (run-or-raise "kitty --name llama /home/enzuru/bin/llama" '(:instance "llama"))
  (vsplit)
  (run-or-raise "kitty --name radeontop radeontop" '(:instance "radeontop")))

(defcommand setup-workspaces () ()
  (run-shell-command (format nil "xsetroot -solid \"~$\"" *background-color*))

  (setup-workspace-emacs)
  (setup-workspace-monitoring)
  ;; (setup-workspace-llm)
  (setup-workspace-firefox))

;; tmux emulation

;;; Emacs

(define-key *root-map* (kbd "e") "emacsclient")
(define-key *root-map* (kbd "E") "emacs")
(define-key *root-map* (kbd "f") "midnight-commander")

;;; Windows

(define-key *root-map* (kbd "b") "windowlist")
(define-key *root-map* (kbd "Left") "pull-hidden-next")
(define-key *root-map* (kbd "Right") "pull-hidden-previous")

;;; Groups

(define-key *root-map* (kbd "T") "grouplist")
(define-key *root-map* (kbd "c") "gnew-and-term")
(define-key *root-map* (kbd "n") "gnext")
(define-key *root-map* (kbd "p") "gprev")
(define-key *root-map* (kbd "&") "gkill-windows-and-group")

;;; Frames

(define-key *root-map* (kbd "1") "only")
(define-key *root-map* (kbd "0") "remove-split")
(define-key *root-map* (kbd "2") "vsplit-and-term")
(define-key *root-map* (kbd "3") "hsplit-and-term")
(define-key *root-map* (kbd "o") "next")
(define-key *root-map* (kbd "%") "hsplit-and-term")
(define-key *root-map* (kbd "\"") "vsplit-and-term")
(define-key *root-map* (kbd "x") "kill-and-remove-split")

(when *initializing*
  (setup-workspaces))
