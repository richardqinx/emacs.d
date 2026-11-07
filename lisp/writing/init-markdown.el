;;; init-markdown.el --- Markdown configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure Markdown editing and document conversion.
;; Use markdown-mode with Pandoc.

;;; Code:

;; ------------------------------------------------------------
;; Markdown Mode
;; ------------------------------------------------------------

(use-package markdown-mode
  :ensure t

  :mode
  (("\\.md\\'"       . markdown-mode)
   ("\\.markdown\\'" . markdown-mode)
   ("README\\.md\\'" . gfm-mode))

  :custom
  ;; Markdown conversion program.
  (markdown-command "pandoc -f markdown -t html")

  ;; Native Markdown editing commands.
  (markdown-fontify-code-blocks-natively t))


(provide 'init-markdown)

;;; init-markdown.el ends here
