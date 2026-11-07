;;; init-corfu.el --- In-buffer completion -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure in-buffer completion using Corfu.
;; Extend completion-at-point with Cape backends.

;;; Code:

;; ------------------------------------------------------------
;; Completion defaults
;; ------------------------------------------------------------

;; Try indentation first, then completion.
(setq tab-always-indent 'complete)


;; ------------------------------------------------------------
;; Corfu
;; ------------------------------------------------------------

(use-package corfu
  :ensure t

  :custom
  ;; Enable automatic completion.
  (corfu-auto t)

  ;; Delay before automatic completion.
  (corfu-auto-delay 0.2)

  ;; Minimum prefix length.
  (corfu-auto-prefix 2)

  ;; Cycle through candidates.
  (corfu-cycle t)

  ;; Delay before displaying documentation.
  (corfu-popupinfo-delay 0.5)

  :init
  (global-corfu-mode 1)

  :config
  ;; Keep RET available for inserting newlines.
  ;; Use TAB to complete candidates.
  (keymap-unset corfu-map "RET")

  ;; Show documentation for completion candidates.
  (corfu-popupinfo-mode 1))


;; ------------------------------------------------------------
;; Cape
;; ------------------------------------------------------------

(use-package cape
  :ensure t

  :bind
  (("C-c m f" . cape-file)
   ("C-c m b" . cape-dabbrev))

  :init
  ;; Append fallback completion sources.
  ;; Major-mode and LSP completions retain precedence.
  (add-hook 'completion-at-point-functions
            #'cape-file t)

  (add-hook 'completion-at-point-functions
            #'cape-dabbrev t))


(provide 'init-corfu)

;;; init-corfu.el ends here
