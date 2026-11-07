;;; init-tramp.el --- Remote access configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure remote file access using TRAMP.
;; Prefer SSH and store connection metadata under var/.

;;; Code:

;; ------------------------------------------------------------
;; TRAMP
;; ------------------------------------------------------------

(use-package tramp
  :ensure nil
  :defer t

  :custom
  ;; Default remote connection method.
  (tramp-default-method "ssh")

  ;; Store persistent connection information.
  (tramp-persistency-file-name
   (expand-file-name
    "var/tramp"
    user-emacs-directory)))


;; ------------------------------------------------------------
;; Remote file access
;; ------------------------------------------------------------

(define-key my/tools-map
            (kbd "r")
            #'find-file)


(provide 'init-tramp)

;;; init-tramp.el ends here
