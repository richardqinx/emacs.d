;;; init-embark.el --- Contextual actions -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure contextual actions using Embark.
;; Integrate Embark with Consult for search result operations.

;;; Code:

;; ------------------------------------------------------------
;; Embark
;; ------------------------------------------------------------

(use-package embark
  :ensure t

  :bind
  (("C-."   . embark-act)
   ("C-;"   . embark-dwim)
   ("C-h B" . embark-bindings))

  :init
  ;; Use Embark to display prefix keybindings.
  (setq prefix-help-command
        #'embark-prefix-help-command))


;; ------------------------------------------------------------
;; Embark-Consult
;; ------------------------------------------------------------

(use-package embark-consult
  :ensure t
  :after (embark consult))


(provide 'init-embark)

;;; init-embark.el ends here
