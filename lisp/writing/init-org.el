;;; init-org.el --- Org-mode configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure Org-mode for documents, tasks, and agenda management.
;; Provide shared keybindings for writing-related commands.

;;; Code:

;; ------------------------------------------------------------
;; Directories
;; ------------------------------------------------------------

(defvar my/org-directory
  (expand-file-name "~/org/")
  "Directory containing personal Org files.")


;; ------------------------------------------------------------
;; Writing keymap
;; ------------------------------------------------------------

(defvar my/writing-map
  (make-sparse-keymap)
  "Keymap for writing-related commands.")

(define-key my/command-map
            (kbd "W")
            my/writing-map)


;; ------------------------------------------------------------
;; Org-mode
;; ------------------------------------------------------------

(use-package org
  :ensure nil

  :custom
  ;; Personal Org directory.
  (org-directory my/org-directory)

  ;; Agenda files.
  (org-agenda-files
   (list (expand-file-name
          "inbox.org" my/org-directory)
         (expand-file-name
          "projects.org" my/org-directory)))

  ;; Default capture file.
  (org-default-notes-file
   (expand-file-name
    "inbox.org" my/org-directory))

  ;; Agenda display.
  (org-agenda-span 'week)

  ;; Record task completion times.
  (org-log-done 'time)

  ;; Document editing.
  (org-startup-indented nil)
  (org-hide-emphasis-markers t)
  (org-src-fontify-natively t)
  (org-src-tab-acts-natively t)

  ;; Require confirmation before executing Babel code.
  (org-confirm-babel-evaluate t)

  ;; Capture templates.
  (org-capture-templates
   '(("t" "Task" entry
      (file "inbox.org")
      "* TODO %?\n  %U\n")

     ("n" "Note" entry
      (file "inbox.org")
      "* %?\n  %U\n"))))


;; ------------------------------------------------------------
;; Org Modern
;; ------------------------------------------------------------

(use-package org-modern
  :ensure t

  :hook
  ((org-mode . org-modern-mode)
   (org-agenda-finalize . org-modern-agenda)))


;; ------------------------------------------------------------
;; Keybindings
;; ------------------------------------------------------------

(define-key my/writing-map
            (kbd "a")
            #'org-agenda)

(define-key my/writing-map
            (kbd "c")
            #'org-capture)

(define-key my/writing-map
            (kbd "l")
            #'org-store-link)


(provide 'init-org)

;;; init-org.el ends here
