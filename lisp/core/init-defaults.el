;;; init-defaults.el --- Basic Emacs settings -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure basic Emacs behavior and built-in features.
;; Settings in this module are shared across the environment.

;;; Code:

;; ------------------------------------------------------------
;; Startup
;; ------------------------------------------------------------

;; (setq inhibit-startup-screen t)


;; ------------------------------------------------------------
;; User interaction
;; ------------------------------------------------------------

(setq use-short-answers t)

(column-number-mode 1)

(show-paren-mode 1)


;; ------------------------------------------------------------
;; Basic editing
;; ------------------------------------------------------------

(delete-selection-mode 1)


;; ------------------------------------------------------------
;; History
;; ------------------------------------------------------------

(setq savehist-file
      (expand-file-name "var/savehist" user-emacs-directory))

(setq save-place-file
      (expand-file-name "var/places" user-emacs-directory))

(savehist-mode 1)
(save-place-mode 1)

(provide 'init-defaults)

;;; init-defaults.el ends here
