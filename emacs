;; Disable startup message
(setq inhibit-startup-message t)

;; Create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(tool-bar-mode nil))

;; Enable ido mode
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

;; Load pig-mode
(load-file "~/.dotfiles/pig-mode.el")

;; Add file types associated with ruby
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Guardfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))

;; Default font settings
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco")))))
