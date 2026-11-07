;;; init-treesit.el --- Tree-sitter integration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure built-in Tree-sitter integration.
;; Use treesit-auto to select supported major modes and grammars.

;;; Code:

;; ------------------------------------------------------------
;; Tree-sitter
;; ------------------------------------------------------------

(require 'treesit)


;; ------------------------------------------------------------
;; treesit-auto
;; ------------------------------------------------------------

(use-package treesit-auto
  :ensure t

  :if (treesit-available-p)

  :custom
  ;; Ask before downloading and compiling a missing grammar.
  (treesit-auto-install 'prompt)

  :config
  ;; Register supported Tree-sitter major modes.
  (treesit-auto-add-to-auto-mode-alist 'all)

  ;; Enable automatic mode selection.
  (global-treesit-auto-mode 1))


(provide 'init-treesit)

;;; init-treesit.el ends here
