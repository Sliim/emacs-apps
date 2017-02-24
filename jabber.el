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

(defun jabber/alert-message (from buffer text title)
  "Notify with alert when new message."
  (alert text :title from :icon "im-jabber" :category "im" :severity 'normal))
(defun jabber/alert-muc (nick group buffer text title)
  "Notify with alert when new muc."
  (alert text :title (concat "[" group "] " nick) :icon "im-jabber" :category "im" :severity 'normal))
(defun jabber/alert-presence (who oldstatus newstatus statustext proposed-alert)
  "Notify with alert when presence change."
  (when proposed-alert
    (alert (concat (symbol-name who) " ==> " newstatus) :title proposed-alert :icon "im-user" :category "im" :severity 'trivial)))
(defun jabber/alert-info-message (what buffer proposed-alert)
  "Notify with alert when message info."
  (when proposed-alert
    (alert proposed-alert :title proposed-alert :icon "dialog-information" :category "im" :severity 'normal)))
(defun jabber/alert-pre-connect ()
  "Notify with alert when connecting."
  (alert "Connecting to jabber.." :title "Jabber status" :icon "network-connect" :category "im" :severity 'trivial))
(defun jabber/alert-post-connect ()
  "Notify with alert when connection established."
  (alert "You are now connected to Jabber." :title "Jabber status" :icon "network-connect" :category "im" :severity 'normal))
(defun jabber/alert-lost-connection ()
  "Notify with alert when connection lost."
  (alert "Connection lost!" :title "Jabber status" :icon "network-disconnect" :category "im" :severity 'urgent))
(defun jabber/alert-post-disconnect ()
  "Notify with alert when disconnected."
  (alert "You are now disconnected." :title "Jabber status" :icon "network-disconnect" :category "im" :severity 'normal))

(add-hook 'jabber-alert-message-hooks 'jabber/alert-message)
(add-hook 'jabber-alert-muc-hooks 'jabber/alert-muc)
(add-hook 'jabber-alert-presence-hooks 'jabber/alert-presence)
(add-hook 'jabber-alert-info-message-hooks 'jabber/alert-info-message)
;(add-hook 'jabber-post-connect-hooks 'jabber/alert-post-connect)
(add-hook 'jabber-pre-connect-hook 'jabber/alert-pre-connect)
(add-hook 'jabber-lost-connection-hooks 'jabber/alert-lost-connection)
(add-hook 'jabber-post-disconnect-hook 'jabber/alert-post-disconnect)

(let ((config (expand-file-name ".jabber.el" (getenv "HOME"))))
  (when (file-exists-p config)
    (load-file config)))

(jabber-connect-all)
(switch-to-buffer "*-jabber-roster-*")

;;; jabber.el ends here
