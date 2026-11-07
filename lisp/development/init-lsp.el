;;; init-lsp.el --- Language Server Protocol -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure Eglot as the LSP client.
;; Language-specific server settings belong in languages/.

;;; Code:

;; ------------------------------------------------------------
;; Eglot
;; ------------------------------------------------------------

(use-package eglot
  :ensure nil

  :commands
  (eglot
   eglot-ensure
   eglot-rename
   eglot-code-actions
   eglot-format)

  :custom
  ;; Stop a server when its last managed buffer is closed.
  (eglot-autoshutdown t))


;; ------------------------------------------------------------
;; Keybindings
;; ------------------------------------------------------------

(define-key my/development-map
            (kbd "l")
            #'eglot)

(define-key my/development-map
            (kbd "r")
            #'eglot-rename)

(define-key my/development-map
            (kbd "a")
            #'eglot-code-actions)

(define-key my/development-map
            (kbd "L")
            #'eglot-format)


(provide 'init-lsp)

;;; init-lsp.el ends here
