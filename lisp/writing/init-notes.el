;;; init-notes.el --- Knowledge management -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure knowledge management using Org-roam.
;; Store Org notes separately from the Emacs configuration.
;; Keep the Org-roam database under the var/ directory.

;;; Code:

;; ------------------------------------------------------------
;; Org-roam
;; ------------------------------------------------------------

(use-package org-roam
  :ensure t

  :commands
  (org-roam-node-find
   org-roam-node-insert
   org-roam-buffer-toggle
   org-roam-dailies-capture-today)

  :custom
  ;; Directory containing knowledge notes.
  (org-roam-directory
   (expand-file-name
    "roam/" my/org-directory))

  ;; SQLite database location.
  (org-roam-db-location
   (expand-file-name
    "var/org-roam.db"
    user-emacs-directory))

  ;; Note templates.
  (org-roam-capture-templates
   '(("d" "Default" plain
      "%?"
      :if-new
      (file+head
       "%<%Y%m%d%H%M%S>-${slug}.org"
       "#+title: ${title}\n")
      :unnarrowed t)))

  :config
  ;; Maintain the note database automatically.
  (org-roam-db-autosync-mode 1))


;; ------------------------------------------------------------
;; Keybindings
;; ------------------------------------------------------------

(define-key my/writing-map
            (kbd "f")
            #'org-roam-node-find)

(define-key my/writing-map
            (kbd "i")
            #'org-roam-node-insert)

(define-key my/writing-map
            (kbd "b")
            #'org-roam-buffer-toggle)

(define-key my/writing-map
            (kbd "d")
            #'org-roam-dailies-capture-today)


(provide 'init-notes)

;;; init-notes.el ends here
