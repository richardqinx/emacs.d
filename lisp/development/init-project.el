;;; init-project.el --- Project management -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure project management using the built-in project.el.
;; Provide a dedicated keymap for development commands.

;;; Code:

;; ------------------------------------------------------------
;; Project management
;; ------------------------------------------------------------

(require 'project)

;; Store the list of known projects under var/.
(setq project-list-file
      (expand-file-name
       "var/projects"
       user-emacs-directory))


;; ------------------------------------------------------------
;; Development keymap
;; ------------------------------------------------------------

(defvar my/development-map
  (make-sparse-keymap)
  "Keymap for development commands.")

;; Register development commands under C-c m D.
(define-key my/command-map
            (kbd "D")
            my/development-map)


;; ------------------------------------------------------------
;; Project keybindings
;; ------------------------------------------------------------

(define-key my/development-map
            (kbd "p")
            #'project-switch-project)

(define-key my/development-map
            (kbd "f")
            #'project-find-file)

(define-key my/development-map
            (kbd "b")
            #'project-switch-to-buffer)

(define-key my/development-map
            (kbd "c")
            #'project-compile)

(define-key my/development-map
            (kbd "s")
            #'project-shell)


(provide 'init-project)

;;; init-project.el ends here
