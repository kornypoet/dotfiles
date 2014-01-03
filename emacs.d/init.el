;;; General Emacs Settings ;;;

;; Disable startup message
(setq inhibit-startup-message t)

;; Disable menu and tool bar
(menu-bar-mode -1)
(if window-system
    (tool-bar-mode -1))

;; Indentation 2 spaces everywhere
(setq-default c-basic-offset 2)

;; Font and size for GUI Emacs
(set-frame-font "Inconsolata-20")

;; Solarized color theme
(add-to-list 'custom-theme-load-path "~/.dotfiles/vendor/emacs-solarized")
(load-theme 'solarized-dark t)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/")))))
 
;; Enable ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Use CTRL + TAB to switch buffers in GUI mode
(if window-system
  (global-set-key (kbd "<C-S-tab>") 'previous-buffer)
  (global-set-key (kbd "<C-tab>")   'next-buffer))

;; Key bindings
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-r") 'query-replace-regexp)
(global-set-key (kbd "C-f") 'next-multiframe-window)
;; (global-set-key (kbd "C-x C-g") 'magit-status)

;; Add file types associated with ruby
(add-to-list 'auto-mode-alist '("Rakefile"    . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile"     . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile"   . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile"     . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$"    . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$"      . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))

;; Show tabs as a UTF-8 arrow
;; (standard-display-ascii ?\t "→")
;; Load pig-mode
;; (load-file "~/.dotfiles/pig-mode.el")

;; Load markdown-mode
;; (load-file "~/.dotfiles/markdown-mode.el")

;; Load highlight chars
;; (load-file "~/.dotfiles/highlight-chars.el")
;; (add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)

;; Load feature mode
;; (add-to-list 'load-path "~/.dotfiles/feature-mode")
;; (require 'feature-mode)
;; (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Load scala mode
;; (add-to-list 'load-path "~/.dotfiles/scala-dist/tool-support/src/emacs")
;; (require 'scala-mode-auto)

;; need to fix emacs loading
;; (add-to-list 'load-path "~/.dotfiles")

;; Load magit
;; (add-to-list 'load-path "~/.dotfiles/magit")
;; (require 'magit)

;; (setq magit-status-buffer-switch-function 'switch-to-buffer)
