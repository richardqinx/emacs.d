;;; init-navigation.el --- Navigation and selection -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure fast navigation, semantic selection, and multiple cursors.
;; Use Avy, Expand Region, and Multiple Cursors.

;;; Code:

;; ------------------------------------------------------------
;; Avy
;; ------------------------------------------------------------

(use-package avy
  :ensure t

  :bind
  (("M-g c" . avy-goto-char-timer)
   ("M-g l" . avy-goto-line))

  :custom
  ;; Delay before displaying jump hints.
  (avy-timeout-seconds 0.5))


;; ------------------------------------------------------------
;; Expand Region
;; ------------------------------------------------------------

(use-package expand-region
  :ensure t

  :bind
  ("C-=" . er/expand-region))


;; ------------------------------------------------------------
;; Multiple Cursors
;; ------------------------------------------------------------

(use-package multiple-cursors
  :ensure t

  :bind
  (("C->"     . mc/mark-next-like-this)
   ("C-<"     . mc/mark-previous-like-this)
   ("C-c m l" . mc/edit-lines)
   ("C-c m a" . mc/mark-all-like-this))

  :init
  ;; Store command execution preferences under var/.
  (setq mc/list-file
        (expand-file-name
         "var/mc-lists.el"
         user-emacs-directory)))


(provide 'init-navigation)

;;; init-navigation.el ends here
