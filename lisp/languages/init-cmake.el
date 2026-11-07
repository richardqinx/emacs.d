;;; init-cmake.el --- CMake configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure CMake editing and syntax highlighting.
;; Support traditional CMake Mode and Tree-sitter integration.

;;; Code:

;; ------------------------------------------------------------
;; CMake Mode
;; ------------------------------------------------------------

(use-package cmake-mode
  :ensure t

  :mode
  (("CMakeLists\\.txt\\'" . cmake-mode)
   ("\\.cmake\\'" . cmake-mode)))


;; ------------------------------------------------------------
;; CMake editing
;; ------------------------------------------------------------

(defun my/cmake-mode-setup ()
  "Configure CMake editing in the current buffer."
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 4))


;; ------------------------------------------------------------
;; Major mode hooks
;; ------------------------------------------------------------

(add-hook 'cmake-mode-hook #'my/cmake-mode-setup)
(add-hook 'cmake-ts-mode-hook #'my/cmake-mode-setup)


(provide 'init-cmake)

;;; init-cmake.el ends here
