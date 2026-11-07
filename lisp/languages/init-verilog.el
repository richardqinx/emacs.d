;;; init-verilog.el --- Verilog language configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure Verilog and SystemVerilog editing.
;; Provide indentation, AUTO expansion, and Verilator linting.

;;; Code:

;; ------------------------------------------------------------
;; Verilog Mode
;; ------------------------------------------------------------

(use-package verilog-mode
  :ensure nil

  :mode
  (("\\.v\\'"   . verilog-mode)
   ("\\.vh\\'"  . verilog-mode)
   ("\\.sv\\'"  . verilog-mode)
   ("\\.svh\\'" . verilog-mode))

  :custom
  ;; Indentation.
  (verilog-indent-level 2)
  (verilog-indent-level-module 2)
  (verilog-indent-level-declaration 2)
  (verilog-indent-level-behavioral 2)

  ;; Avoid automatic newline insertion.
  (verilog-auto-newline nil)

  ;; Disable automatic end comments.
  (verilog-auto-endcomments nil))


;; ------------------------------------------------------------
;; Verilator lint
;; ------------------------------------------------------------

(defun my/verilog-lint ()
  "Run Verilator lint on the current file."
  (interactive)

  (unless buffer-file-name
    (user-error "Current buffer is not visiting a file"))

  (unless (executable-find "verilator")
    (user-error "Verilator is not installed"))

  (save-buffer)

  (let* ((project (project-current nil))
         (default-directory
          (if project
              (project-root project)
            default-directory))
         (command
          (read-shell-command
           "Verilator lint command: "
           (format "verilator --lint-only %s"
                   (shell-quote-argument
                    buffer-file-name)))))

    (compile command)))


;; ------------------------------------------------------------
;; Keybindings
;; ------------------------------------------------------------

(define-key my/development-map
            (kbd "V")
            #'my/verilog-lint)

(define-key my/development-map
            (kbd "A")
            #'verilog-auto)


(provide 'init-verilog)

;;; init-verilog.el ends here
