;;; init.el --- Main Emacs configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Main entry point for the Emacs configuration.
;; Configure load paths and initialize configuration modules.

;;; Code:

;; ------------------------------------------------------------
;; Load paths
;; ------------------------------------------------------------

(defvar my/config-directories
  '("core"
    "ui"
    "completion"
    "editing"
    "development"
    "languages"
    "writing"
    "tools")
  "Directories containing Emacs configuration modules.")

(dolist (dir my/config-directories)
  (add-to-list
   'load-path
   (expand-file-name
    (concat "lisp/" dir)
    user-emacs-directory)))

;; Custom Emacs Lisp extensions.
(add-to-list
 'load-path
 (expand-file-name "site-lisp" user-emacs-directory))


;; ------------------------------------------------------------
;; Customize
;; ------------------------------------------------------------

(setq custom-file
      (expand-file-name
       "var/custom.el"
       user-emacs-directory))

(make-directory
 (file-name-directory custom-file)
 t)


;; ------------------------------------------------------------
;; Core modules
;; ------------------------------------------------------------

(require 'init-packages)
(require 'init-defaults)
(require 'init-files)
(require 'init-session)
(require 'init-keybindings)


;; ------------------------------------------------------------
;; UI modules
;; ------------------------------------------------------------

(require 'init-fonts)
(require 'init-theme)
(require 'init-modeline)
(require 'init-windows)


;; ------------------------------------------------------------
;; Completion modules
;; ------------------------------------------------------------

(require 'init-minibuffer)
(require 'init-consult)
(require 'init-embark)
(require 'init-corfu)


;; ------------------------------------------------------------
;; Editing modules
;; ------------------------------------------------------------

(require 'init-editing)
(require 'init-snippets)
(require 'init-navigation)
(require 'init-structural)


;; ------------------------------------------------------------
;; Development modules
;; ------------------------------------------------------------

(require 'init-project)
(require 'init-lsp)
(require 'init-treesit)
(require 'init-diagnostics)
(require 'init-format)
(require 'init-debug)
(require 'init-git)


;; ------------------------------------------------------------
;; Language modules
;; ------------------------------------------------------------

(require 'init-c)
(require 'init-cpp)
(require 'init-python)
(require 'init-verilog)
(require 'init-cmake)
(require 'init-shell)
(require 'init-data)


;; ------------------------------------------------------------
;; Writing modules
;; ------------------------------------------------------------

(require 'init-org)
(require 'init-latex)
(require 'init-markdown)
(require 'init-pdf)
(require 'init-notes)


;; ------------------------------------------------------------
;; Tools modules
;; ------------------------------------------------------------

(require 'init-dired)
(require 'init-terminal)
(require 'init-tramp)
(require 'init-help)
;;; (require 'init-ai)
(require 'init-elfeed)


;; ------------------------------------------------------------
;; Custom settings
;; ------------------------------------------------------------

(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))

;;; init.el ends here
