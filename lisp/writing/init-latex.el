;;; init-latex.el --- LaTeX configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure AUCTeX and RefTeX for LaTeX document editing.
;; Enable SyncTeX integration with PDF Tools.

;;; Code:

;; ------------------------------------------------------------
;; LaTeX setup
;; ------------------------------------------------------------

(defun my/latex-mode-setup ()
  "Configure the current LaTeX buffer."
  (setq-local indent-tabs-mode nil)

  ;; Enable source and PDF synchronization.
  (TeX-source-correlate-mode 1))


;; ------------------------------------------------------------
;; AUCTeX
;; ------------------------------------------------------------

(use-package tex
  :ensure auctex
  :defer t

  :custom
  ;; Parse document information when opening files.
  (TeX-parse-self t)

  ;; Avoid generating auto/ directories in projects.
  (TeX-auto-save nil)

  ;; Synchronize source and PDF locations.
  (TeX-source-correlate-method 'synctex)
  (TeX-source-correlate-start-server t)

  ;; Use PDF Tools for PDF output.
  (TeX-view-program-selection
   '((output-pdf "PDF Tools")))

  :hook
  (LaTeX-mode . my/latex-mode-setup))


;; ------------------------------------------------------------
;; LaTeX file association
;; ------------------------------------------------------------

(add-to-list 'auto-mode-alist
             '("\\.tex\\'" . LaTeX-mode))


;; ------------------------------------------------------------
;; RefTeX
;; ------------------------------------------------------------

(use-package reftex
  :ensure nil

  :hook
  (LaTeX-mode . turn-on-reftex)

  :custom
  (reftex-plug-into-AUCTeX t))


(provide 'init-latex)

;;; init-latex.el ends here
