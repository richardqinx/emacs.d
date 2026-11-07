;;; init-debug.el --- Debugging configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure debugging using Dape.
;; Provide Debug Adapter Protocol integration and keybindings.

;;; Code:

;; ------------------------------------------------------------
;; Eldoc
;; ------------------------------------------------------------

;; Display documentation and debugger information.
(add-hook 'prog-mode-hook #'eldoc-mode)


;; ------------------------------------------------------------
;; Dape
;; ------------------------------------------------------------

(use-package dape
  :ensure t

  :commands
  (dape
   dape-breakpoint-toggle
   dape-continue
   dape-next
   dape-step-in
   dape-step-out
   dape-quit)

  :custom
  ;; Display debugger information on the right.
  (dape-buffer-window-arrangement 'right)

  ;; Store breakpoints under var/.
  (dape-default-breakpoints-file
   (expand-file-name
    "var/dape-breakpoints"
    user-emacs-directory)))


;; ------------------------------------------------------------
;; Debugging keybindings
;; ------------------------------------------------------------

(define-key my/development-map
            (kbd "d")
            #'dape)

(define-key my/development-map
            (kbd "B")
            #'dape-breakpoint-toggle)

(define-key my/development-map
            (kbd "v")
            #'dape-continue)

(define-key my/development-map
            (kbd "t")
            #'dape-next)

(define-key my/development-map
            (kbd "i")
            #'dape-step-in)

(define-key my/development-map
            (kbd "o")
            #'dape-step-out)

(define-key my/development-map
            (kbd "q")
            #'dape-quit)


(provide 'init-debug)

;;; init-debug.el ends here
