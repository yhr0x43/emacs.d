;;;; init.el  -*- lexical-binding:t -*-

;; here stores stand-alone elisp files
(add-to-list 'load-path "~/.emacs.d/local")

;; separate custom.el file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; transparency
;;(set-frame-parameter nil 'alpha-background 70)
;;(add-to-list 'default-frame-alist '(alpha-background . 70))

(keymap-global-set "<f5>" #'compile)
(keymap-global-set "C-," #'duplicate-line)
(keymap-global-set "C-." #'copy-from-above-command)

(keymap-set 'dired-mode-map "r" #'dired-kill-subdir)

(global-whitespace-mode 1)

(use-package multiple-cursors
  :bind (("C-<return>" . 'mc/edit-lines)
         ("C->" . 'mc/mark-next-like-this)
         ("C-<" . 'mc/mark-previous-like-this)))

;; c-mode
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))
(add-hook 'c-mode-hook (lambda () (display-fill-column-indicator-mode t)))

(require 'powershell)

;; gforth
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

(put 'dired-find-alternate-file 'disabled nil)
