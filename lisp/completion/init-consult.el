;;; init-consult.el --- Search and navigation -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure search and navigation using Consult.
;; Enable rich candidate annotations with Marginalia.

;;; Code:

;; ------------------------------------------------------------
;; Marginalia
;; ------------------------------------------------------------

(use-package marginalia
  :ensure t

  :bind
  (:map minibuffer-local-map
        ("M-A" . marginalia-cycle))

  :init
  (marginalia-mode 1))


;; ------------------------------------------------------------
;; Consult
;; ------------------------------------------------------------

(use-package consult
  :ensure t

  :bind
  (("C-s"   . consult-line)
   ("C-x b" . consult-buffer)
   ("M-s r" . consult-ripgrep)
   ("M-g i" . consult-imenu))

  :custom
  ;; Register filtering.
  (consult-narrow-key "<")

  ;; Show previews when supported.
  (consult-preview-key 'any))


(provide 'init-consult)

;;; init-consult.el ends here
