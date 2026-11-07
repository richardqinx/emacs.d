;;; init-python.el --- Python language configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure Python editing with uv virtual environments.
;; Use BasedPyright through Eglot for language intelligence.
;; Use Black through Apheleia for formatting.

;;; Code:

;; ------------------------------------------------------------
;; Python virtual environment
;; ------------------------------------------------------------

(defun my/python-use-project-venv ()
  "Use a nearby .venv Python interpreter when available."
  (when-let* ((root
               (locate-dominating-file
                default-directory ".venv"))
              (python
               (expand-file-name
                ".venv/bin/python" root)))
    (when (file-executable-p python)
      (setq-local python-shell-interpreter python))))


;; ------------------------------------------------------------
;; Python language server
;; ------------------------------------------------------------

;; Prefer BasedPyright for Python buffers.
(with-eval-after-load 'eglot
  (add-to-list
   'eglot-server-programs
   '((python-mode python-ts-mode)
     "basedpyright-langserver" "--stdio")))


;; ------------------------------------------------------------
;; Python editing
;; ------------------------------------------------------------

(defun my/python-mode-setup ()
  "Configure Python editing in the current buffer."
  (setq-local indent-tabs-mode nil)
  (setq-local python-indent-offset 4)

  ;; Select the project's Python interpreter.
  (my/python-use-project-venv)

  ;; Start the language server when installed.
  (when (executable-find "basedpyright-langserver")
    (eglot-ensure)))


;; ------------------------------------------------------------
;; Major mode hooks
;; ------------------------------------------------------------

(add-hook 'python-mode-hook #'my/python-mode-setup)
(add-hook 'python-ts-mode-hook #'my/python-mode-setup)


(provide 'init-python)

;;; init-python.el ends here
