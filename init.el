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
;; Custom settings
;; ------------------------------------------------------------

(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))

;;; init.el ends here
