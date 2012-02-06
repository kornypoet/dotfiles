;; Disable startup message
(setq inhibit-startup-message t)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; enable ido mode
(setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)

;; Key bindings
(global-set-key         (kbd "M-;")            'comment-or-uncomment-region)
(global-set-key         (kbd "C-z")            'undo)
(global-set-key         (kbd "M-g")            'goto-line)
(global-set-key         (kbd "M-r")            'query-replace-regexp)
(global-set-key         (kbd "<C-tab>")        'next-buffer)
(global-set-key         (kbd "<C-S-tab>")      'previous-buffer)