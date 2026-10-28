;;; init-theme.el --- Theme configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure the graphical appearance of Emacs.
;; Use the Tokyo Night color theme.

;;; Code:

;; ------------------------------------------------------------
;; Tokyo Night
;; ------------------------------------------------------------

(use-package tokyo-night
  :ensure t
  :demand t
  :config
  (load-theme 'tokyo-night-storm t))


(provide 'init-theme)

;;; init-theme.el ends here
