;;; init-packages.el --- Package management -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure package archives and initialize package.el.
;; Use use-package for declarative package configuration.

;;; Code:

;; ------------------------------------------------------------
;; Package archives
;; ------------------------------------------------------------

(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

;; Prefer GNU ELPA and NonGNU ELPA.
(setq package-archive-priorities
      '(("gnu"    . 30)
        ("nongnu" . 20)
        ("melpa"  . 10)))


;; ------------------------------------------------------------
;; Initialize package.el
;; ------------------------------------------------------------

(package-initialize)


;; ------------------------------------------------------------
;; use-package
;; ------------------------------------------------------------

(require 'use-package)

;; Enable package loading diagnostics.
(setq use-package-verbose t)

(provide 'init-packages)

;;; init-packages.el ends here
