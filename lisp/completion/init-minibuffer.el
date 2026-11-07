;;; init-minibuffer.el --- Minibuffer completion -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure minibuffer completion using Vertico and Orderless.
;; Provide vertical completion and flexible candidate matching.

;;; Code:

;; ------------------------------------------------------------
;; Minibuffer defaults
;; ------------------------------------------------------------

;; Allow nested minibuffer commands.
(setq enable-recursive-minibuffers t)

;; Keep the cursor out of the minibuffer prompt.
(setq minibuffer-prompt-properties
      '(read-only t
        cursor-intangible t
        face minibuffer-prompt))


;; ------------------------------------------------------------
;; Vertico
;; ------------------------------------------------------------

(use-package vertico
  :ensure t

  :custom
  ;; Maximum number of visible candidates.
  (vertico-count 15)

  ;; Allow cycling through candidates.
  (vertico-cycle t)

  ;; Resize the minibuffer when appropriate.
  (vertico-resize t)

  :init
  (vertico-mode 1))


;; ------------------------------------------------------------
;; Orderless
;; ------------------------------------------------------------

(use-package orderless
  :ensure t

  :custom
  ;; Flexible candidate matching.
  (completion-styles '(orderless basic))

  ;; Preserve practical file and TRAMP completion.
  (completion-category-overrides
   '((file (styles basic partial-completion)))))


(provide 'init-minibuffer)

;;; init-minibuffer.el ends here
