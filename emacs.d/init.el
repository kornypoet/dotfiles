;;; General Emacs Settings ;;;

;; Key Bindings
;; C-q quoted-insert
;; C-j literal newline
;; C-h k (M-x describe-key)
;; C-h c (M-x describe-key-briefly)
;; C-h f (M-x describe-function)
;; C-h b (M-x describe-bindings)
;; C-x C-l (lowercase region)
;; C-x C-u (upcase region)
;;
;; Copy from Emacs to OS X clipboard:
;; select region then M-| pbcopy RET
;;
;; Paste from OS X clipboard to Emacs:
;; C-u M-| pbpaste RET (replaces current region if it exists)

;; Disable startup message
(setq inhibit-startup-message t)

;; Disable menu and tool bar
(menu-bar-mode -1)
(when window-system (tool-bar-mode -1))

;; Indentation 2 spaces everywhere
(setq-default c-basic-offset 2)
(setq js-indent-level 2)

;; Show column number
(setq column-number-mode t)

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

;; Use Melpa for package installs
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/") t)
    (package-initialize))

;; Load with-editor (from magit) for commit in emacs
(require 'with-editor)

;; Multi-term setup
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(add-hook 'term-exec-hook 'with-editor-export-git-editor)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
 '(package-selected-packages
   '(ansible-vault terraform-mode hcl-mode scala-mode go-mode vagrant-tramp magit yaml-mode puppet-mode multi-term))
 '(term-bind-key-alist
   '(("C-c C-c" . term-interrupt-subjob)
     ("C-c C-e" . term-send-esc)
     ("C-j" . term-toggle-mode)
     ("C-p" . previous-line)
     ("C-n" . next-line)
     ("C-s" . isearch-forward)
     ("C-r" . term-send-reverse-search-history)
     ("C-m" . term-send-return)
     ("C-y" . term-paste)
     ("C-z" . term-stop-subjob)
     ("M-f" . term-send-forward-word)
     ("M-b" . term-send-backward-word)
     ("M-o" . term-send-backspace)
     ("M-p" . term-send-up)
     ("M-n" . term-send-down)
     ("M-M" . term-send-forward-kill-word)
     ("M-N" . term-send-backward-kill-word)
     ("<C-backspace>" . term-send-backward-kill-word)
     ("<C-down>" . forward-paragraph)
     ("<C-up>" . backward-paragraph)
     ("<M-backspace>" . term-send-backward-kill-word)
     ("<M-DEL>" . term-send-backward-kill-word)
     ("M-r" . term-send-reverse-search-history)
     ("M-," . term-send-raw)
     ("M-." . comint-dynamic-complete))))

;; Switch between line and char mode in multi-term
(defun term-toggle-mode ()
  (interactive)
  (if (term-in-line-mode)
    (term-char-mode)
      (term-line-mode)))

(define-key term-mode-map (kbd "C-j") 'term-toggle-mode)

;; Enable ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Tabs are evil
(setq-default indent-tabs-mode nil)

;; Use CTRL + TAB to switch buffers in GUI mode
(when window-system
  (global-set-key (kbd "<C-S-tab>") 'previous-buffer)
  (global-set-key (kbd "<C-tab>")   'next-buffer))

;; Key bindings
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-r") 'query-replace-regexp)
(global-set-key (kbd "C-f") 'next-multiframe-window)
(global-set-key (kbd "C-c C-t") 'untabify)
(global-set-key (kbd "C-c C-w") 'whitespace-cleanup)
;; (global-set-key (kbd "C-x C-g") 'magit-status)

;; Add file types associated with ruby
(add-to-list 'auto-mode-alist '("Rakefile"    . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile"     . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile"   . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile"     . ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile"  . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$"    . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$"      . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.tf$"      . hcl-mode))
;; Show tabs as a UTF-8 arrow
;; (standard-display-ascii ?\t "→")
;; Load pig-mode
;; (load-file "~/.dotfiles/pig-mode.el")

;; Load Dockerfile mode
(load-file "~/.dotfiles/emacs-modes/dockerfile-mode.el")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; Load markdown-mode
;; (load-file "~/.dotfiles/markdown-mode.el")

;; Load highlight chars
;; (load-file "~/.dotfiles/highlight-chars.el")
;; (add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)

;; Load cucumber mode
;; (add-to-list 'load-path "~/.dotfiles/vendor/cucumber-mode")
;; (require 'feature-mode)
;; (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Load scala mode
;; (add-to-list 'load-path "~/.dotfiles/scala-dist/tool-support/src/emacs")
;; (require 'scala-mode-auto)

;; need to fix emacs loading
;; (add-to-list 'load-path "~/.dotfiles")
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Automatically make shebang scripts executable
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(load-file "~/.dotfiles/emacs-modes/go-template-mode.el")
(require 'go-template-mode)
