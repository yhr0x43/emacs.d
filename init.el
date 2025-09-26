;;;; init.el  -*- lexical-binding:t -*-

(setq debug-on-error t)

;; here stores stand-alone elisp files
(add-to-list 'load-path "~/.emacs.d/local")

;; separate custom.el file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; transparency
;;(set-frame-parameter nil 'alpha-background 70)
;;(add-to-list 'default-frame-alist '(alpha-background . 70))

(use-package emacs
  :bind ("<f5>" . compile)
        ("C-," . duplicate-line)
        ("C-." . copy-from-above-command))

(use-package dired
  :bind (:map dired-mode-map
              ("r" . dired-kill-subdir)))

(use-package whitespace-mode
  :hook (before-save . whitespace-cleanup)
  :config (global-whitespace-mode 1))

(use-package multiple-cursors
  :bind (("C-<return>" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)))

;; c-mode
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))
(add-hook 'c-mode-hook (lambda () (display-fill-column-indicator-mode t)))

(require 'powershell)

;; this is actually gforth.el
(require 'forth-mode "gforth")

(with-eval-after-load 'rainbow-delimiters
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode))

(use-package web-mode
  :defer t
  :mode ("\\.html\\'" "\\.cshtml\\'" "\\.blade\\'" "\\.svelte\\'")
  :config
  (setq web-mode-engines-alist
        '(("razor"  . "\\.cshtml\\'")
          ("blade"  . "\\.blade\\.")
          ("svelte" . "\\.svelte\\."))))

;; load this after everything else per recommendation by envrc author
;; https://github.com/purcell/envrc#usage
(with-eval-after-load 'envrc
  (envrc-global-mode))

;; enabled rare commands
(put 'dired-find-alternate-file 'disabled nil)
