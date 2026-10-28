;;; init-session.el --- Session management -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Preserve command history, recently opened files,
;; and cursor positions between Emacs sessions.

;;; Code:

;; ------------------------------------------------------------
;; Command history
;; ------------------------------------------------------------

(require 'savehist)

(setq savehist-file
      (expand-file-name
       "var/savehist"
       user-emacs-directory))

(savehist-mode 1)


;; ------------------------------------------------------------
;; Cursor positions
;; ------------------------------------------------------------

(require 'saveplace)

(setq save-place-file
      (expand-file-name
       "var/places"
       user-emacs-directory))

(save-place-mode 1)


;; ------------------------------------------------------------
;; Recent files
;; ------------------------------------------------------------

(require 'recentf)

(setq recentf-save-file
      (expand-file-name
       "var/recentf"
       user-emacs-directory))

(setq recentf-max-saved-items 200)

(recentf-mode 1)


(provide 'init-session)

;;; init-session.el ends here
