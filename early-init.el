;;; early-init.el --- Early initialization -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Early initialization of Emacs.
;; Configure startup behavior before loading init.el.

;;; Code:

;; Disable automatic package initialization.
;; Package initialization is handled by init-packages.el.
(setq package-enable-at-startup nil)

;;; early-init.el ends here
