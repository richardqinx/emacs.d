;;; init-cpp.el --- C++ language configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure C++ language editing.
;; Support traditional CC Mode and Tree-sitter modes.
;; Enable clangd integration through Eglot.

;;; Code:

;; ------------------------------------------------------------
;; C++ editing
;; ------------------------------------------------------------

(defun my/cpp-mode-setup ()
  "Configure C++ editing in the current buffer."
  (setq-local indent-tabs-mode nil)

  ;; Traditional CC Mode.
  (if (derived-mode-p 'c++-mode)
      (setq-local c-basic-offset 4)
    ;; Tree-sitter C++ Mode.
    (setq-local c-ts-mode-indent-offset 4))

  ;; Start Eglot when clangd is available.
  (when (executable-find "clangd")
    (eglot-ensure)))


;; ------------------------------------------------------------
;; Major mode hooks
;; ------------------------------------------------------------

(add-hook 'c++-mode-hook #'my/cpp-mode-setup)
(add-hook 'c++-ts-mode-hook #'my/cpp-mode-setup)


(provide 'init-cpp)

;;; init-cpp.el ends here
