;;; init-terminal.el --- Terminal configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure Vterm for terminal emulation.
;; Configure Eshell as an Emacs-integrated shell.

;;; Code:

;; ------------------------------------------------------------
;; Eshell
;; ------------------------------------------------------------

(use-package eshell
  :ensure nil

  :commands
  (eshell)

  :custom
  ;; Eshell state directory.
  (eshell-directory-name
   (expand-file-name
    "var/eshell/"
    user-emacs-directory))

  ;; Eshell command history.
  (eshell-history-file-name
   (expand-file-name
    "var/eshell/history"
    user-emacs-directory))

  :init
  (make-directory
   (expand-file-name "var/eshell/" user-emacs-directory)
   t))


;; ------------------------------------------------------------
;; Vterm
;; ------------------------------------------------------------

(use-package vterm
  :ensure t

  :commands
  (vterm vterm-other-window)

  :custom
  ;; Number of scrollback lines.
  (vterm-max-scrollback 10000)

  ;; Close terminal buffers when their processes exit.
  (vterm-kill-buffer-on-exit t))


;; ------------------------------------------------------------
;; Keybindings
;; ------------------------------------------------------------

(define-key my/tools-map
            (kbd "e")
            #'eshell)

(define-key my/tools-map
            (kbd "t")
            #'vterm)

(define-key my/tools-map
            (kbd "T")
            #'vterm-other-window)


(provide 'init-terminal)

;;; init-terminal.el ends here
