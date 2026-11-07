;;; init-shell.el --- Shell language configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure Shell and Bash script editing.
;; Integrate ShellCheck with the Emacs compilation interface.

;;; Code:

;; ------------------------------------------------------------
;; Shell editing
;; ------------------------------------------------------------

(defun my/shell-mode-setup ()
  "Configure Shell script editing in the current buffer."
  (setq-local indent-tabs-mode nil)
  (setq-local sh-basic-offset 2)
  (setq-local tab-width 2))


;; ------------------------------------------------------------
;; ShellCheck
;; ------------------------------------------------------------

(defun my/shellcheck-buffer ()
  "Run ShellCheck on the current file."
  (interactive)

  (unless buffer-file-name
    (user-error "Current buffer is not visiting a file"))

  (unless (executable-find "shellcheck")
    (user-error "ShellCheck is not installed"))

  (save-buffer)

  (compile
   (format "shellcheck %s"
           (shell-quote-argument buffer-file-name))))


;; ------------------------------------------------------------
;; Hooks
;; ------------------------------------------------------------

(add-hook 'sh-mode-hook #'my/shell-mode-setup)
(add-hook 'bash-ts-mode-hook #'my/shell-mode-setup)


;; ------------------------------------------------------------
;; Keybindings
;; ------------------------------------------------------------

(define-key my/development-map
            (kbd "S")
            #'my/shellcheck-buffer)


(provide 'init-shell)

;;; init-shell.el ends here
