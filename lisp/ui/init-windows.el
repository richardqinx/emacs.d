;;; init-windows.el --- Window management -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure Emacs window and tab management.
;; Enable tab-bar-mode and winner-mode.

;;; Code:

;; ------------------------------------------------------------
;; Tab Bar
;; ------------------------------------------------------------

(require 'tab-bar)

;; Show the tab bar when multiple tabs exist.
(setq tab-bar-show 1)

;; Hide additional tab control buttons.
(setq tab-bar-new-button-show nil)
(setq tab-bar-close-button-show nil)

;; Enable tab management.
(tab-bar-mode 1)


;; ------------------------------------------------------------
;; Winner Mode
;; ------------------------------------------------------------

(require 'winner)

;; Enable window layout history.
(winner-mode 1)


;; ------------------------------------------------------------
;; Keybindings
;; ------------------------------------------------------------

;; Create a new tab.
(define-key my/command-map
            (kbd "t")
            #'tab-new)

;; Switch tabs.
(define-key my/command-map
            (kbd "n")
            #'tab-next)

(define-key my/command-map
            (kbd "p")
            #'tab-previous)

;; Restore window layouts.
(define-key my/command-map
            (kbd "u")
            #'winner-undo)

(define-key my/command-map
            (kbd "U")
            #'winner-redo)


(provide 'init-windows)

;;; init-windows.el ends here
