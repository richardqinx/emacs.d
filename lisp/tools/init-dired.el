;;; init-dired.el --- Dired file management -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure Dired for file and directory management.
;; Enable useful built-in extensions and writable Dired.

;;; Code:

;; ------------------------------------------------------------
;; Tools keymap
;; ------------------------------------------------------------

(defvar my/tools-map
  (make-sparse-keymap)
  "Keymap for Emacs utility commands.")

(define-key my/command-map
            (kbd "X")
            my/tools-map)


;; ------------------------------------------------------------
;; Dired
;; ------------------------------------------------------------

(use-package dired
  :ensure nil

  :commands
  (dired dired-jump)

  :custom
  ;; GNU ls options for local Debian directories.
  (dired-listing-switches "-alh --group-directories-first")

  ;; Suggest the other Dired window as the destination.
  (dired-dwim-target t)

  ;; Allow recursive copies.
  (dired-recursive-copies 'always)

  ;; Ask for confirmation before recursive deletion.
  (dired-recursive-deletes 'top)

  :hook
  (dired-mode . dired-hide-details-mode))


;; ------------------------------------------------------------
;; Dired-X
;; ------------------------------------------------------------

(use-package dired-x
  :ensure nil
  :after dired)


;; ------------------------------------------------------------
;; Keybindings
;; ------------------------------------------------------------

(define-key my/tools-map
            (kbd "d")
            #'dired)

(define-key my/tools-map
            (kbd "j")
            #'dired-jump)


(provide 'init-dired)

;;; init-dired.el ends here
