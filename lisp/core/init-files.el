;;; init-files.el --- File management -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure file backups and automatic saving.
;; Store generated files under the var/ directory.

;;; Code:

;; ------------------------------------------------------------
;; Directories
;; ------------------------------------------------------------

(defvar my/backup-directory
  (expand-file-name "var/backups/" user-emacs-directory)
  "Directory for backup files.")

(defvar my/auto-save-directory
  (expand-file-name "var/auto-save/" user-emacs-directory)
  "Directory for auto-save files.")

(defvar my/auto-save-list-directory
  (expand-file-name "var/auto-save-list/" user-emacs-directory)
  "Directory for auto-save session records.")

(dolist (dir (list my/backup-directory
                   my/auto-save-directory
                   my/auto-save-list-directory))
  (make-directory dir t))


;; ------------------------------------------------------------
;; Backups
;; ------------------------------------------------------------

;; Enable backup files.
(setq make-backup-files t)

;; Store all backups in a dedicated directory.
(setq backup-directory-alist
      `(("." . ,my/backup-directory)))

;; Use numbered backups.
(setq version-control t)

;; Keep several versions of each file.
(setq kept-new-versions 10
      kept-old-versions 2
      delete-old-versions t)


;; ------------------------------------------------------------
;; Auto-save
;; ------------------------------------------------------------

;; Enable automatic saving.
(setq auto-save-default t)

;; Store auto-save files in a dedicated directory.
;; SHA-1 avoids excessively long generated filenames.
(setq auto-save-file-name-transforms
      `((".*" ,my/auto-save-directory sha1)))

;; Store auto-save session records separately.
(setq auto-save-list-file-prefix
      (expand-file-name
       ".saves-"
       my/auto-save-list-directory))


(provide 'init-files)

;;; init-files.el ends here
