;;;; custom.el  -*- lexical-binding:t -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist `(("." . "~/.local/share/emacs/backup")))
 '(custom-enabled-themes '(tango-dark))
 '(delete-old-versions t)
 '(display-line-numbers 'relative)
 '(font-latex-fontify-script nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(menu-bar-mode nil)
 '(package-selected-packages '(magit multiple-cursors))
 '(tab-width 8)
 '(tool-bar-mode nil)
 '(version-control t)
 '(whitespace-style
   '(face trailing tabs spaces newline missing-newline-at-eof empty
          indentation space-after-tab space-before-tab space-mark
          tab-mark newline-mark)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120)))))
