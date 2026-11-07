;;; init-structural.el --- Structural editing -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure structural editing using Smartparens.
;; Enable paired delimiters and expression manipulation.

;;; Code:

;; ------------------------------------------------------------
;; Smartparens
;; ------------------------------------------------------------

(use-package smartparens
  :ensure t

  :hook
  (prog-mode . smartparens-mode)

  :bind
  (("C-c m j" . sp-forward-sexp)
   ("C-c m k" . sp-backward-sexp)
   ("C-c m o" . sp-wrap-round)
   ("C-c m z" . sp-unwrap-sexp)
   ("C-c m h" . sp-cheat-sheet))

  :config
  ;; Load standard pairing rules.
  (require 'smartparens-config))


(provide 'init-structural)

;;; init-structural.el ends here
