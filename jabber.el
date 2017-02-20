;;; jabber.el --- Emacs Jabber client -*- emacs-lisp -*-
;;
;; Author: Sliim <sliim@mailoo.org>
;; Version: 1.0.0
;; Keywords: emacs-apps

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Emacs app: Jabber client

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

;; Jabber setup
(require 'jabber)
(require 'password-cache)

(setq password-cache nil
      jabber-show-resources "Never"
      jabber-auto-reconnect t
      jabber-history-enabled t
      jabber-history-dir (expand-file-name "jabber-history" emacsd-var-dir)
      jabber-avatar-cache-directory (expand-file-name "jabber-avatar-cache" emacsd-var-dir))

(defun jabber-alert-message-shell-command (from buffer text title)
  "Run shell command when alert."
  (shell-command-to-string (concat "notify-send '" from "' '" text "' -i chat -u normal> /dev/null 2>&1")))
(add-hook 'jabber-alert-message-hooks 'jabber-alert-message-shell-command)

(let ((config (expand-file-name ".account.el" (getenv "HOME"))))
  (when (file-exists-p config)
    (load-file config)))

(jabber-connect-all)
(switch-to-buffer "*-jabber-roster-*")

;;; jabber.el ends here
