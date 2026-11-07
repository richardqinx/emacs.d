;;; init-pdf.el --- PDF viewing configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure PDF Tools for reading and annotating PDF documents.
;; Integrate PDF viewing with AUCTeX and SyncTeX.

;;; Code:

;; ------------------------------------------------------------
;; PDF Tools
;; ------------------------------------------------------------

(use-package pdf-tools
  :ensure t
  :demand t

  :config
  ;; Initialize PDF support on demand.
  (pdf-loader-install))


(provide 'init-pdf)

;;; init-pdf.el ends here
