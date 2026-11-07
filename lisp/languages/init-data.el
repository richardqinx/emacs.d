;;; init-data.el --- Structured data configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure editing for JSON, YAML, and TOML files.
;; Use built-in modes and Tree-sitter where available.

;;; Code:

;; ------------------------------------------------------------
;; JSON
;; ------------------------------------------------------------

;; Use built-in JSON editing mode.
(add-to-list 'auto-mode-alist
             '("\\.json\\'" . js-json-mode))


;; ------------------------------------------------------------
;; YAML
;; ------------------------------------------------------------

(use-package yaml-mode
  :ensure t

  :mode
  (("\\.yaml\\'" . yaml-mode)
   ("\\.yml\\'"  . yaml-mode)))


;; ------------------------------------------------------------
;; TOML
;; ------------------------------------------------------------

;; Use built-in TOML configuration mode.
(add-to-list 'auto-mode-alist
             '("\\.toml\\'" . conf-toml-mode))


;; ------------------------------------------------------------
;; Common editing
;; ------------------------------------------------------------

(defun my/data-mode-setup ()
  "Configure structured data editing."
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 2))


;; ------------------------------------------------------------
;; Hooks
;; ------------------------------------------------------------

(dolist (hook '(js-json-mode-hook
                json-ts-mode-hook
                yaml-mode-hook
                yaml-ts-mode-hook
                conf-toml-mode-hook
                toml-ts-mode-hook))
  (add-hook hook #'my/data-mode-setup))


(provide 'init-data)

;;; init-data.el ends here
