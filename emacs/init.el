;; -*- lexical-binding: t; -*-
;; Maximize garbage collection threshold during startup
(defvar default-gc-cons-threshold 67108864) ; 64MiB
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; packages
(use-package sudo-edit)

;; org mode setup
(use-package org
  :defer t)

(use-package vertico
  :init
  (vertico-mode)
  :bind (:map vertico-map
         ("<up>" . previous-history-element)
         ("<down>" . next-history-element)
         ("<right>" . vertico-insert))
  :custom
  (vertico-cycle t))

(use-package fancy-compilation
  :ensure t
  :config
  (fancy-compilation-mode 1))

;; eshel config
(use-package eshell
  :defer 5
  :config
  (setq eshell-banner-message "Welcome back, Teero\n")
  (setq eshell-history-size 100000
	eshell-save-history-on-exit t)
  (with-eval-after-load 'em-term
    (add-to-list 'eshell-visual-commands "htop")
    (add-to-list 'eshell-visual-commands "top")
    (add-to-list 'eshell-visual-commands "less")
    (add-to-list 'eshell-visual-commands "agy")
    (add-to-list 'eshell-visual-commands "perf report")))

(defun eshell/f (file)
  "Open FILE in the current Emacs frame."
  (find-file file))

;; parentheses
(electric-pair-mode 1)
(setq electric-pair-preserve-balance t)

;; autocompletion
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :config
  (setq corfu-auto t
        corfu-auto-delay 0.1
        corfu-auto-prefix 1
        corfu-quit-no-match 'separator)
  ;; prevent blocking myself
  (define-key corfu-map (kbd "<tab>") #'corfu-next)        ; TAB goes down
  (define-key corfu-map (kbd "TAB") #'corfu-next)          ; (For terminal Emacs)
  (define-key corfu-map (kbd "<backtab>") #'corfu-previous) ; Shift+TAB goes up
  (define-key corfu-map (kbd "C-z") #'corfu-complete)     ; C-z confirms selection
  ;; let enter be normal
  (define-key corfu-map (kbd "RET") nil)
  (define-key corfu-map (kbd "<up>") nil)
  (define-key corfu-map (kbd "<down>") nil))

(use-package eglot
  :ensure nil
  :hook
  ((c-mode
    c++-mode
    rust-mode
    html-mode
    mhtml-mode
    css-mode
    css-ts-mode
    js-mode
    js-ts-mode
    typescript-mode
    typescript-ts-mode
    tsx-ts-mode
    json-mode
    json-ts-mode) . eglot-ensure)
  :config
  ;; Explicitly map modes to vscode language servers with formatting enabled
  (add-to-list 'eglot-server-programs
               '((html-mode mhtml-mode) . ("vscode-html-language-server" "--stdio"
                                           :initializationOptions
                                           (:provideFormatter t))))
  (add-to-list 'eglot-server-programs
               '((css-mode css-ts-mode) . ("vscode-css-language-server" "--stdio"
                                           :initializationOptions
                                           (:provideFormatter t))))
  (add-to-list 'eglot-server-programs
               '((json-mode json-ts-mode) . ("vscode-json-language-server" "--stdio"
                                             :initializationOptions
                                             (:provideFormatter t)))))

;; TypeScript mode configuration
(use-package typescript-mode
  :mode ("\\.ts\\'" "\\.tsx\\'")
  :config
  (setq typescript-indent-level 2))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9e5e0ff3a81344c9b1e6bfc9b3dcf9b96d5ec6a60d8de6d4c762ee9e2121dfb2"
     "0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1"
     "921f165deb8030167d44eaa82e85fcef0254b212439b550a9b6c924f281b5695"
     "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4"

     default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
