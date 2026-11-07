;;; init-format.el --- Code formatting -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure code formatting using Apheleia.
;; Keep automatic format-on-save disabled by default.
;; Eglot formatting is configured separately in init-lsp.el.

;;; Code:

;; ------------------------------------------------------------
;; Apheleia
;; ------------------------------------------------------------

(use-package apheleia
  :ensure t

  :commands
  (apheleia-format-buffer
   apheleia-mode))


;; ------------------------------------------------------------
;; Formatting keybindings
;; ------------------------------------------------------------

;; Format the current buffer using an external formatter.
(define-key my/development-map
            (kbd "F")
            #'apheleia-format-buffer)

;; Toggle automatic formatting for the current buffer.
(define-key my/development-map
            (kbd "M")
            #'apheleia-mode)


(provide 'init-format)

;;; init-format.el ends here
