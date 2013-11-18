;; Disable startup message
(setq inhibit-startup-message t)

;; Disable menu bar
(menu-bar-mode -1)

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

;; Indentation 2 spaces everywhere
(setq-default c-basic-offset 2)

;; Key bindings
(global-set-key         (kbd "M-;")            'comment-or-uncomment-region)
;; (global-set-key         (kbd "C-z")            'undo)
(global-set-key         (kbd "M-g")            'goto-line)
(global-set-key         (kbd "M-r")            'query-replace-regexp)
(global-set-key         (kbd "<C-tab>")        'next-buffer)
(global-set-key         (kbd "<C-S-tab>")      'previous-buffer)
(global-set-key         (kbd "C-f")            'next-multiframe-window)
(global-set-key         (kbd "C-x C-g")        'magit-status)
;; (global-set-key         (kbd "M-/")            'indent-region)

;; Load pig-mode
(load-file "~/.dotfiles/pig-mode.el")

;; Load markdown-mode
(load-file "~/.dotfiles/markdown-mode.el")

;; Load feature mode
(add-to-list 'load-path "~/.dotfiles/feature-mode")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Load scala mode
(add-to-list 'load-path "~/.dotfiles/scala-dist/tool-support/src/emacs")
(require 'scala-mode-auto)

;; need to fix emacs loading
(add-to-list 'load-path "~/.dotfiles")

;; Load magit
(add-to-list 'load-path "~/.dotfiles/magit")
(require 'magit)

(setq magit-status-buffer-switch-function 'switch-to-buffer)

;; Load inferior ruby
(add-to-list 'load-path "~/.dotfiles/inf-ruby")

;; Add file types associated with ruby
(setq auto-mode-alist (cons '("Rakefile"    . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile"     . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Guardfile"   . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile"     . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$"    . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gemspec$" . ruby-mode) auto-mode-alist))

;; Default font settings
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco")))))
