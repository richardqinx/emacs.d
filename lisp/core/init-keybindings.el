;;; init-keybindings.el --- Global keybindings -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Define personal commands and global keybindings.
;; Use C-c m as the prefix for custom commands.

;;; Code:

;; ------------------------------------------------------------
;; Personal commands
;; ------------------------------------------------------------

(defun my/open-init-file ()
  "Open the main Emacs initialization file."
  (interactive)
  (find-file
   (expand-file-name "init.el" user-emacs-directory)))

(defun my/open-config-directory ()
  "Open the Emacs configuration directory in Dired."
  (interactive)
  (dired user-emacs-directory))


;; ------------------------------------------------------------
;; Personal keymap
;; ------------------------------------------------------------

(defvar my/command-map
  (make-sparse-keymap)
  "Keymap for personal Emacs commands.")

;; Register the personal command prefix.
(define-key global-map
            (kbd "C-c m")
            my/command-map)


;; ------------------------------------------------------------
;; Keybindings
;; ------------------------------------------------------------

(define-key my/command-map
            (kbd "i")
            #'my/open-init-file)

(define-key my/command-map
            (kbd "d")
            #'my/open-config-directory)

(define-key my/command-map
            (kbd "r")
            #'revert-buffer)

(define-key my/command-map
            (kbd "w")
            #'whitespace-mode)

(define-key my/command-map
            (kbd "e")
            #'eval-buffer)


(provide 'init-keybindings)

;;; init-keybindings.el ends here
