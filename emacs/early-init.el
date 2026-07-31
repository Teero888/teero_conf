;; -*- lexical-binding: t; -*-
(setq inhibit-splash-screen t
      inhibit-startup-message t)

;; Prevent UI elements from rendering at all
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)
(setq inhibit-splash-screen t)
(scroll-bar-mode -1)                 ; Disable visible scrollbar
(tool-bar-mode -1)                   ; Disable the toolbar
(tooltip-mode -1)                    ; Disable tooltips
(menu-bar-mode -1)                   ; Disable the menu bar
(global-display-line-numbers-mode t) ; Enable line numbers
(transient-mark-mode 1)              ; Highlight text selections

;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/bootstrap.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; themes
(use-package doom-themes
  :config
  (load-theme 'doom-pine t)
  (doom-themes-org-config))

;; set the default font and sized
(set-face-attribute 'default nil 
                    :font "JetBrainsMonoNLNerdFontMono" 
                    :height 180)
