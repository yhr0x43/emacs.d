;;;; init.el  -*- lexical-binding:t -*-
(setq debug-on-error t)

;; here stores stand-alone elisp files
(add-to-list 'load-path "~/.emacs.d/local")

;; separate custom.el file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load "user.el")

;; transparency
;(set-frame-parameter nil 'alpha-background 70)
;(add-to-list 'default-frame-alist '(alpha-background . 70))

(use-package emacs
  :bind (("<f5>" . compile)
         ("C-," . duplicate-line)
         ("C-." . copy-from-above-command)))

(use-package dired
  :bind (:map dired-mode-map
              ("r" . dired-kill-subdir)))

(use-package whitespace-mode
  :hook ((before-save . whitespace-cleanup)
         (c-mode . whitespace-mode)
         (emacs-lisp-mode . whitespace-mode)))

(use-package multiple-cursors
  :bind (("C-<return>" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)))

;; c-mode
(use-package cc-mode
  :config
  (setq-default c-basic-offset 4
                c-default-style '((java-mode . "java")
                                  (awk-mode . "awk")
                                  (other . "gnu")))
  :hook (c-mode . (lambda ()
                    (display-fill-column-indicator-mode t)
                    (set-fill-column 80))))

;;(use-package powershell)

(use-package forth-mode
  :load-path (lambda () (when (eq system-type 'windows-nt) "c:/Program Files/gforth"))
  :init
  (load "gforth"))

;(use-package rainbow-delimiters
;  :hook emacs-lisp-mode)

(use-package web-mode
  :defer t
  :mode ("\\.html\\'" "\\.cshtml\\'" "\\.blade\\'" "\\.svelte\\'")
  :config
  (setq web-mode-engines-alist
        '(("razor"  . "\\.cshtml\\'")
          ("blade"  . "\\.blade\\.")
          ("svelte" . "\\.svelte\\."))))

(use-package conf-windows-mode
  :mode "\\.ini\\'")

;; load this after everything else per recommendation by envrc author
;; https://github.com/purcell/envrc#usage
(with-eval-after-load 'envrc
  (envrc-global-mode))

;; enabled rare commands
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
