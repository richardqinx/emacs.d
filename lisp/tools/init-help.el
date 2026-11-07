;;; init-help.el --- Help system configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Enhance Emacs documentation and introspection with Helpful.
;; Provide convenient access to function and variable definitions.

;;; Code:

;; ------------------------------------------------------------
;; Helpful
;; ------------------------------------------------------------

(use-package helpful
  :ensure t

  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-h x" . helpful-command)
   ("C-h F" . helpful-function))

  :custom
  ;; Select the help window when it appears.
  (help-window-select t))


;; ------------------------------------------------------------
;; Keybindings
;; ------------------------------------------------------------

(define-key my/tools-map
            (kbd "h")
            #'helpful-at-point)


(provide 'init-help)

;;; init-help.el ends here
