;;; slack.el --- Emacs Slack client -*- emacs-lisp -*-
;;
;; Author: Sliim <sliim@mailoo.org>
;; Version: 1.0.0
;; Keywords: emacs-apps

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Emacs app: Slack client

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

(require 'slack)
(require 'helm-command)

(setq alert-default-icon "view-conversation-balloon"
      slack-buffer-emojify t
      slack-prefer-current-team t)

(global-set-key (kbd "M-x") 'helm-M-x)

(let ((config (expand-file-name ".slack.el.gpg" (getenv "HOME"))))
  (when (file-exists-p config)
    (load-file config)))

(slack-start)

;;; slack.el ends here
