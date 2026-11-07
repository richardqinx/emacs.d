;;; init-editing.el --- General editing behavior -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure general text editing behavior.
;; Enable useful built-in editing features and utilities.

;;; Code:

;; ------------------------------------------------------------
;; Text editing
;; ------------------------------------------------------------

;; Use a single space after sentence-ending punctuation.
(setq sentence-end-double-space nil)

;; Wrap long text visually without changing file contents.
(add-hook 'text-mode-hook #'visual-line-mode)


;; ------------------------------------------------------------
;; Programming
;; ------------------------------------------------------------

;; Treat CamelCase components as separate words.
(add-hook 'prog-mode-hook #'subword-mode)


;; ------------------------------------------------------------
;; Whitespace
;; ------------------------------------------------------------

;; Clean up whitespace on demand.
(define-key my/command-map
            (kbd "c")
            #'whitespace-cleanup)


(provide 'init-editing)

;;; init-editing.el ends here
