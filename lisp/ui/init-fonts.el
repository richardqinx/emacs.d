;;; init-fonts.el --- Font configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure fonts for graphical Emacs frames.
;; Use JetBrains Mono for Latin text and code.
;; Prefer Noto Sans CJK SC for Chinese characters.

;;; Code:

;; ------------------------------------------------------------
;; Font settings
;; ------------------------------------------------------------

(defvar my/default-font-family "JetBrains Mono"
  "Preferred font family for code and Latin text.")

(defvar my/cjk-font-family "Noto Sans CJK SC"
  "Preferred font family for CJK characters.")

(defvar my/default-font-height 130
  "Default font height in units of 1/10 point.")


;; ------------------------------------------------------------
;; Apply fonts
;; ------------------------------------------------------------

(defun my/apply-fonts (&optional frame)
  "Configure fonts for graphical FRAME."
  (with-selected-frame (or frame (selected-frame))
    (when (display-graphic-p)

      ;; Default font.
      (when (find-font
             (font-spec :family my/default-font-family))
        (set-face-attribute
         'default (selected-frame)
         :family my/default-font-family
         :height my/default-font-height))

      ;; Chinese font.
      (when (find-font
             (font-spec :family my/cjk-font-family))
        (set-fontset-font
         nil 'han
         (font-spec :family my/cjk-font-family)
         nil 'prepend)))))


;; ------------------------------------------------------------
;; Initialize
;; ------------------------------------------------------------

;; Apply to the current frame.
(my/apply-fonts)

;; Apply to new frames, including emacsclient GUI frames.
(add-hook 'after-make-frame-functions #'my/apply-fonts)


(provide 'init-fonts)

;;; init-fonts.el ends here
