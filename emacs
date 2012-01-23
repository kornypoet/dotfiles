;; Disable startup message
(setq inhibit-startup-message t)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; load init.el
(load "~/.emacs.d/init.el")

;; enable ido mode
(setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)
