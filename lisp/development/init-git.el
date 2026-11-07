;;; init-git.el --- Git integration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure Git integration using Magit.
;; Highlight uncommitted changes with diff-hl.

;;; Code:

;; ------------------------------------------------------------
;; Magit
;; ------------------------------------------------------------

(use-package magit
  :ensure t

  :commands
  (magit-status)

  :bind
  (("C-x g" . magit-status)))


;; ------------------------------------------------------------
;; diff-hl
;; ------------------------------------------------------------

(use-package diff-hl
  :ensure t

  :hook
  ((prog-mode . diff-hl-mode)
   (text-mode . diff-hl-mode)
   (dired-mode . diff-hl-dired-mode))

  :custom
  ;; Avoid Git checks over slow remote connections.
  (diff-hl-disable-on-remote t)

  :config
  ;; Refresh change indicators after Magit operations.
  (add-hook 'magit-post-refresh-hook
            #'diff-hl-magit-post-refresh))


;; ------------------------------------------------------------
;; Git keybindings
;; ------------------------------------------------------------

(define-key my/development-map
            (kbd "g")
            #'magit-status)


(provide 'init-git)

;;; init-git.el ends here
