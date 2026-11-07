;;; init-snippets.el --- Snippet configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure YASnippet for code and text templates.
;; Store personal snippets under ~/.emacs.d/snippets/.
;; Integrate snippet expansion with the existing completion system.

;;; Code:

;; ------------------------------------------------------------
;; YASnippet
;; ------------------------------------------------------------

(use-package yasnippet
  :ensure t

  :custom
  ;; Personal snippet directory.
  (yas-snippet-dirs
   (list (expand-file-name
          "snippets"
          user-emacs-directory)))

  :hook
  ((prog-mode . yas-minor-mode)
   (text-mode . yas-minor-mode))

  :bind
  (("C-c m s" . yas-expand)
   ("C-c m S" . yas-insert-snippet))

  :config
  ;; Keep TAB available for indentation and Corfu.
  ;; Active snippet fields retain their own TAB navigation.
  (define-key yas-minor-mode-map (kbd "TAB") nil)

  ;; Load snippet definitions.
  (yas-reload-all))


;; ------------------------------------------------------------
;; Snippet collection
;; ------------------------------------------------------------

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet

  :config
  (yasnippet-snippets-initialize))


(provide 'init-snippets)

;;; init-snippets.el ends here
