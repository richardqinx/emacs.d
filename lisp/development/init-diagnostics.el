;;; init-diagnostics.el --- Diagnostic framework -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure diagnostics using the built-in Flymake framework.
;; Integrate diagnostics with Eglot and programming modes.

;;; Code:

;; ------------------------------------------------------------
;; Flymake
;; ------------------------------------------------------------

(use-package flymake
  :ensure nil

  :hook
  (prog-mode . flymake-mode)

  :custom
  ;; Delay checking briefly after edits.
  (flymake-no-changes-timeout 0.5))


;; ------------------------------------------------------------
;; Diagnostic keybindings
;; ------------------------------------------------------------

(define-key my/development-map
            (kbd "n")
            #'flymake-goto-next-error)

(define-key my/development-map
            (kbd "N")
            #'flymake-goto-prev-error)

(define-key my/development-map
            (kbd "e")
            #'flymake-show-buffer-diagnostics)

(define-key my/development-map
            (kbd "E")
            #'flymake-show-project-diagnostics)


(provide 'init-diagnostics)

;;; init-diagnostics.el ends here
