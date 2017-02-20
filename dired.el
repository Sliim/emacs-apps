;;; dired.el --- Emacs IRC Client -*- emacs-lisp -*-
;;
;; Author: Sliim <sliim@mailoo.org>
;; Version: 1.0.0
;; Keywords: emacs-apps

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Emacs app: File manager with dired

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING. If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(load-file (expand-file-name "init.el" (file-name-directory load-file-name)))
(require 'direx)
(require 'helm)
(require 'helm-files)

(defun direx:mouse-1 (event)
  (interactive "e")
  (direx:awhen (direx:item-at-event event)
    (setq item (or it (direx:item-at-point!)))
    (if (direx:item-leaf-p item)
        (direx:find-item-other-window item)
      (direx:toggle-item item))))

(set-default 'cursor-type '(bar . 2))
(split-window-right 50)

;; Kbd settings
(global-set-key (kbd "C-c h") 'helm-find-files)
(global-set-key (kbd "C-x C-d") 'direx:find-directory)

(add-hook 'find-file-hook 'view-mode t)
(direx:find-directory (getenv "PWD"))

;;; dired.el ends here
