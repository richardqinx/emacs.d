;;; init-elfeed.el --- RSS feed reader -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Richard Qin
;; SPDX-License-Identifier: GPL-3.0-or-later

;; Author: Richard Qin
;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configure Elfeed for RSS, Atom, and JSON feeds.
;; Store the feed database under the var/ directory.

;;; Code:

;; ------------------------------------------------------------
;; Elfeed
;; ------------------------------------------------------------

(use-package elfeed
  :ensure t

  :commands
  (elfeed elfeed-update)

  :custom
  ;; Feed database directory.
  (elfeed-db-directory
   (expand-file-name
    "var/elfeed/"
    user-emacs-directory))

  ;; Show recent unread entries.
  (elfeed-search-filter "@6-months-ago +unread")

  ;; Subscribed feeds.
  (elfeed-feeds
   '(("https://planet.emacslife.com/atom.xml" emacs)
     ("https://sachachua.com/blog/category/emacs-news/feed/"
      emacs news))))


;; ------------------------------------------------------------
;; Keybindings
;; ------------------------------------------------------------

(define-key my/tools-map
            (kbd "n")
            #'elfeed)


(provide 'init-elfeed)

;;; init-elfeed.el ends here
