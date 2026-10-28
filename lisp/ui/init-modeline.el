;;; init-modeline.el --- Mode line configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure the Emacs mode line using doom-modeline.
;; Display buffer, file, project, and editing information.

;;; Code:

;; ------------------------------------------------------------
;; Doom Modeline
;; ------------------------------------------------------------

(use-package doom-modeline
  :ensure t
  :demand t

  :custom
  ;; Mode line height in graphical Emacs.
  (doom-modeline-height 28)

  ;; Disable icons until Nerd Fonts are configured.
  (doom-modeline-icon nil)

  ;; Display file encoding information.
  (doom-modeline-buffer-encoding t)

  ;; Display project information.
  (doom-modeline-project-name t)

  ;; Display buffer modification status.
  (doom-modeline-highlight-modified-buffer-name t)

  :config
  (doom-modeline-mode 1))


(provide 'init-modeline)

;;; init-modeline.el ends here
